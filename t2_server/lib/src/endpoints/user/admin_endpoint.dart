// lib/src/endpoints/admin_endpoint.dart
import 'package:serverpod/serverpod.dart';
import 'package:serverpod_auth_server/serverpod_auth_server.dart';

import '../../generated/protocol.dart';
import '../../permissions.dart';
import '../shared/auth_context_mixin.dart';

class AdminEndpoint extends Endpoint with AuthContextMixin {

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
    await _requirePermission(session, Permissions.viewUsers);
    final authContext = await getAuthenticatedUserContext(session);
    final customerUsers = await CustomerUser.db.find(session,
        where: (cu) => cu.customerId.equals(authContext.customerId));
    final userDetailsList = <UserDetails>[];
    for (var customerUser in customerUsers) {
      final userInfo = await UserInfo.db.findById(session, customerUser.userId);
      if (userInfo == null) continue;
      final role = await Role.db.findById(session, customerUser.roleId);
      userDetailsList.add(UserDetails(
        userInfo: userInfo,
        role: role,
      ));
    }
    return userDetailsList;
  }

  Future<bool> updateUserRole(
      Session session, {required int userId, required UuidValue roleId}) async {
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
    await _requirePermission(session, Permissions.viewRoles);
    final authContext = await getAuthenticatedUserContext(session);
    return Role.db.find(session,
        where: (r) => r.customerId.equals(authContext.customerId));
  }

  Future<List<Permission>> listPermissions(Session session) async {
    await _requirePermission(session, Permissions.viewRoles);
    return Permission.db.find(session);
  }

  Future<Role> createOrUpdateRole(
      Session session, Role role, List<UuidValue> permissionIds) async {
    await _requirePermission(session, Permissions.manageRoles);
    final authContext = await getAuthenticatedUserContext(session);
    role.customerId = authContext.customerId;
    return await session.db.transaction((transaction) async {
      Role updatedRole;
      if (role.id == null) {
        updatedRole =
            await Role.db.insertRow(session, role, transaction: transaction);
      } else {
        final existingRole = await Role.db.findById(session, role.id!);
        if (existingRole?.customerId != authContext.customerId) {
          throw Exception('Нельзя редактировать роль другой организации');
        }
        updatedRole =
            await Role.db.updateRow(session, role, transaction: transaction);
      }
      await RolePermission.db.deleteWhere(session,
          where: (rp) => rp.roleId.equals(updatedRole.id!),
          transaction: transaction);
      if (permissionIds.isNotEmpty) {
        final newLinks = permissionIds
            .map((permId) =>
                RolePermission(roleId: updatedRole.id!, permissionId: permId))
            .toList();
        await RolePermission.db.insert(session, newLinks, transaction: transaction);
      }
      return updatedRole;
    });
  }

  Future<bool> deleteRole(Session session, UuidValue roleId) async {
    await _requirePermission(session, Permissions.manageRoles);
    final authContext = await getAuthenticatedUserContext(session);
    final role = await Role.db.findById(session, roleId);
    if (role == null || role.customerId != authContext.customerId) {
      throw Exception('Роль не найдена или принадлежит другой организации');
    }
    final assignedUsersCount = await CustomerUser.db
        .count(session, where: (cu) => cu.roleId.equals(roleId));
    if (assignedUsersCount > 0) {
      throw Exception(
          'Нельзя удалить роль, так как она назначена пользователям.');
    }
    await session.db.transaction((transaction) async {
      await RolePermission.db.deleteWhere(session,
          where: (rp) => rp.roleId.equals(roleId), transaction: transaction);
      await Role.db.deleteWhere(session,
          where: (r) => r.id.equals(roleId), transaction: transaction);
    });
    return true;
  }  
}