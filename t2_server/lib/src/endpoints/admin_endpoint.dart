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

    // 4. Делегируем вызов сервису
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
    final authContext = await getAuthenticatedUserContext(session);
    return _adminService.listRolesForCustomer(session, authContext.customerId);
  }

  Future<List<Permission>> listPermissions(Session session) async {
    await _requirePermission(session, 'roles.read');
    // Разрешения - общие для всех, поэтому вызываем общий метод
    return _adminService.listAllPermissions(session);
  }

  Future<Role> createOrUpdateRole(Session session, Role role, List<UuidValue> permissionIds) async {
    await _requirePermission(session, Permissions.manageRoles);
    final authContext = await getAuthenticatedUserContext(session);
    role.customerId = authContext.customerId; // Устанавливаем customerId перед передачей в сервис

    // Проверяем, что админ не пытается редактировать роль чужой организации
    if (role.id != null) {
      final existingRole = await Role.db.findById(session, role.id!);
      if (existingRole?.customerId != authContext.customerId) {
        throw Exception('Нельзя редактировать роль другой организации');
      }
    }

    return _adminService.createOrUpdateRole(session, role: role, permissionIds: permissionIds);
  }

  Future<bool> deleteRole(Session session, UuidValue roleId) async {
    await _requirePermission(session, Permissions.manageRoles);
    final authContext = await getAuthenticatedUserContext(session);
    
    // Проверяем, что админ не пытается удалить роль чужой организации
    final role = await Role.db.findById(session, roleId);
    if (role == null || role.customerId != authContext.customerId) {
      throw Exception('Роль не найдена или принадлежит другой организации');
    }

    return _adminService.deleteRole(session, roleId);
  }  


    Future<Customer?> getMyCustomer(Session session) async {
    // Получаем контекст пользователя (его ID и ID его организации)
    final authContext = await getAuthenticatedUserContext(session);
    // Находим и возвращаем организацию по ее ID
    return await Customer.db.findById(session, authContext.customerId);
  }


 Future<UserInfo?> createUser(Session session, {
    required String userName,
    required String email,
    required String password,
    required UuidValue roleId,
  }) async {
    // Проверяем, есть ли у админа право на создание пользователей
    await _requirePermission(session, 'users.create');
    final authContext = await getAuthenticatedUserContext(session);

    // Проверка безопасности: убеждаемся, что выбранная роль принадлежит организации админа
    final role = await Role.db.findById(session, roleId);
    if (role == null || role.customerId != authContext.customerId) {
      throw Exception('Указанная роль не найдена или не принадлежит вашей организации.');
    }

    // Делегируем создание пользователя нашему сервису
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
    // Проверяем право на чтение/редактирование пользователей
    await _requirePermission(session, 'users.read');
    final authContext = await getAuthenticatedUserContext(session);

    // Проверка безопасности: ищем связь пользователя с организацией админа
    final customerUser = await CustomerUser.db.findFirstRow(session,
        where: (cu) =>
            cu.userId.equals(userId) &
            cu.customerId.equals(authContext.customerId));

    // Если связи нет, значит пользователь не из этой организации
    if (customerUser == null) {
      throw Exception('Пользователь не найден в вашей организации.');
    }

    // Если все в порядке, получаем и возвращаем данные
    final userInfo = await UserInfo.db.findById(session, userId);
    final role = await Role.db.findById(session, customerUser.roleId);

    if (userInfo == null) return null;

    return UserDetails(
      userInfo: userInfo,
      role: role,
    );
  }
}


