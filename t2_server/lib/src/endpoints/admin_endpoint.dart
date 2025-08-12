// lib/src/endpoints/admin_endpoint.dart
import 'package:serverpod/serverpod.dart';
import 'package:serverpod_auth_server/serverpod_auth_server.dart';

import '../generated/protocol.dart';
import '../permissions.dart';
import '../services/admin_service.dart';
import 'shared/auth_context_mixin.dart';

class AdminEndpoint extends Endpoint with AuthContextMixin {
  final AdminService _adminService = AdminService();

  Future<void> _requirePermission(Session session, String permissionKey) async {
    final authContext = await getAuthenticatedUserContext(session);
    final customerUser = await CustomerUser.db.findFirstRow(session,
        where: (cu) =>
            cu.userId.equals(authContext.userId) &
            cu.customerId.equals(authContext.customerId));
    if (customerUser == null) {
      throw Exception('Доступ запрещен: пользователь не найден в организации.');
    }
    final rolePermissions = await RolePermission.db
        .find(session, where: (rp) => rp.roleId.equals(customerUser.roleId));
    final permissionIds = rolePermissions.map((rp) => rp.permissionId).toList();
    if (permissionIds.isEmpty) {
      throw Exception('Доступ запрещен: у вашей роли нет разрешений.');
    }
    final permissions = await Permission.db
        .find(session, where: (p) => p.id.inSet(permissionIds.toSet()));
    final userPermissionKeys = permissions.map((p) => p.key).toSet();
    if (!userPermissionKeys.contains(Permissions.superAdmin) &&
        !userPermissionKeys.contains(permissionKey)) {
      throw Exception(
          'Доступ запрещен: недостаточно прав для выполнения операции.');
    }
  }

  Future<List<UserDetails>> listUsers(Session session) async {
    await _requirePermission(session, 'users.read');
    final authContext = await getAuthenticatedUserContext(session);

    return _adminService.listUsersForCustomer(session, authContext.customerId);
  }

  Future<bool> updateUserRole(Session session,
      {required int userId, required UuidValue roleId}) async {
    await _requirePermission(session, Permissions.manageUsers);
    final authContext = await getAuthenticatedUserContext(session);
    var customerUser = await CustomerUser.db.findFirstRow(session,
        where: (cu) =>
            cu.userId.equals(userId) &
            cu.customerId.equals(authContext.customerId));
    if (customerUser == null) return false;
    customerUser.roleId = roleId;
    await CustomerUser.db.updateRow(session, customerUser);
    return true;
  }

  Future<List<Role>> listRoles(Session session) async {
    await _requirePermission(session, 'roles.read');
    // Роли теперь глобальные, получаем все
    return _adminService.listAllRoles(session);
  }

  Future<List<Permission>> listPermissions(Session session) async {
    await _requirePermission(session, 'roles.read');
    return _adminService.listAllPermissions(session);
  }

  Future<Role> createOrUpdateRole(
      Session session, Role role, List<UuidValue> permissionIds) async {
    await _requirePermission(session, Permissions.manageRoles);
    // Логика с customerId убрана, т.к. роли глобальные
    return _adminService.createOrUpdateRole(
        session, role: role, permissionIds: permissionIds);
  }

  Future<bool> deleteRole(Session session, UuidValue roleId) async {
    await _requirePermission(session, Permissions.manageRoles);
    // Проверка на customerId больше не нужна
    return _adminService.deleteRole(session, roleId);
  }

  Future<Customer?> getMyCustomer(Session session) async {
    final authContext = await getAuthenticatedUserContext(session);
    return await Customer.db.findById(session, authContext.customerId);
  }

  Future<UserInfo?> createUser(
    Session session, {
    required String userName,
    required String email,
    required String password,
    required UuidValue roleId,
  }) async {
    await _requirePermission(session, 'users.create');
    final authContext = await getAuthenticatedUserContext(session);

    // ИСПРАВЛЕНО: Проверяем только то, что роль существует.
    // Привязки к организации у роли больше нет.
    final role = await Role.db.findById(session, roleId);
    if (role == null) {
      throw Exception('Указанная роль не найдена.');
    }

    return await _adminService.createUser(
      session,
      userName: userName,
      email: email,
      password: password,
      customerId: authContext.customerId, // ID организации берется из сессии админа
      roleId: roleId,
    );
  }

  Future<UserDetails?> getUserDetails(Session session, int userId) async {
    await _requirePermission(session, 'users.read');
    final authContext = await getAuthenticatedUserContext(session);

    final customerUser = await CustomerUser.db.findFirstRow(session,
        where: (cu) =>
            cu.userId.equals(userId) &
            cu.customerId.equals(authContext.customerId));

    if (customerUser == null) {
      throw Exception('Пользователь не найден в вашей организации.');
    }

    final userInfo = await UserInfo.db.findById(session, userId);
    final role = await Role.db.findById(session, customerUser.roleId);

    if (userInfo == null) return null;

    return UserDetails(
      userInfo: userInfo,
      role: role,
    );
  }

  Future<bool> updateUser(
    Session session, {
    required int userId,
    required String userName,
    required String email,
    required UuidValue roleId,
  }) async {
    await _requirePermission(session, 'users.update');
    final authContext = await getAuthenticatedUserContext(session);

    final userToUpdateLink = await CustomerUser.db.findFirstRow(session,
        where: (cu) => cu.userId.equals(userId));
    if (userToUpdateLink == null ||
        userToUpdateLink.customerId != authContext.customerId) {
      throw Exception('Пользователь не найден в вашей организации.');
    }

    // ИСПРАВЛЕНО: Проверяем только то, что роль существует.
    final role = await Role.db.findById(session, roleId);
    if (role == null) {
      throw Exception('Указанная роль не найдена.');
    }

    return await _adminService.updateUser(
      session,
      userId: userId,
      userName: userName,
      email: email,
      customerId: authContext.customerId, // ID организации берем из сессии
      roleId: roleId,
    );
  }
}