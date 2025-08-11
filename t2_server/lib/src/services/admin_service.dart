// lib/src/services/admin_service.dart

import 'package:serverpod/serverpod.dart';
import 'package:serverpod_auth_server/serverpod_auth_server.dart';
import '../generated/protocol.dart';

/// Сервисный слой для инкапсуляции бизнес-логики администрирования.
/// Не содержит проверок прав доступа.
class AdminService {
  /// Получает список всех пользователей в системе.
  /// Используется суперадмином.
  Future<List<SuperUserDetails>> listAllUsers(Session session, {int? limit, int? offset}) async {
    final customerUsersQuery = await CustomerUser.db.find(
      session,
      limit: limit ?? 100,
      offset: offset ?? 0,
    );

    final userDetailsList = <SuperUserDetails>[];
    for (var cu in customerUsersQuery) {
      final userInfo = await UserInfo.db.findById(session, cu.userId);
      if (userInfo == null) continue;

      final customer = await Customer.db.findById(session, cu.customerId);
      final role = await Role.db.findById(session, cu.roleId);

      userDetailsList.add(SuperUserDetails(
        userInfo: userInfo,
        customer: customer,
        role: role,
        customerUser: cu,
      ));
    }
    return userDetailsList;
  }

  /// Получает список пользователей для конкретной организации.
  /// Используется обычным админом.
  Future<List<UserDetails>> listUsersForCustomer(Session session, UuidValue customerId) async {
    final customerUsers = await CustomerUser.db.find(
      session,
      where: (cu) => cu.customerId.equals(customerId),
    );

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


  /// Получает список всех ролей в системе.
  Future<List<Role>> listAllRoles(Session session) async {
    return await Role.db.find(session, orderBy: (r) => r.name);
  }

  /// Получает список ролей для конкретной организации.
  Future<List<Role>> listRolesForCustomer(Session session, UuidValue customerId) async {
    return await Role.db.find(session, where: (r) => r.customerId.equals(customerId));
  }
  
  /// Получает все существующие разрешения (permissions).
  Future<List<Permission>> listAllPermissions(Session session) async {
    return await Permission.db.find(session, orderBy: (p) => p.key);
  }

  /// Получает детальную информацию о роли, включая связанные с ней разрешения.
  Future<RoleDetails?> getRoleDetails(Session session, UuidValue roleId) async {
    final role = await Role.db.findById(session, roleId);
    if (role == null) {
      return null;
    }
    final rolePermissions = await RolePermission.db.find(session, where: (rp) => rp.roleId.equals(roleId));
    final permissionIds = rolePermissions.map((rp) => rp.permissionId).toList();
    return RoleDetails(role: role, permissionIds: permissionIds);
  }

  /// Создает или обновляет роль и ее связи с разрешениями.
  Future<Role> createOrUpdateRole(Session session, {
    required Role role,
    required List<UuidValue> permissionIds,
  }) async {
    return await session.db.transaction((transaction) async {
      Role updatedRole;
      if (role.id == null) {
        updatedRole = await Role.db.insertRow(session, role, transaction: transaction);
      } else {
        updatedRole = await Role.db.updateRow(session, role, transaction: transaction);
      }
      
      await RolePermission.db.deleteWhere(
        session,
        where: (rp) => rp.roleId.equals(updatedRole.id!),
        transaction: transaction,
      );
      
      if (permissionIds.isNotEmpty) {
        final newLinks = permissionIds.map((permId) => RolePermission(roleId: updatedRole.id!, permissionId: permId)).toList();
        await RolePermission.db.insert(session, newLinks, transaction: transaction);
      }
      return updatedRole;
    });
  }

  /// Удаляет роль.
  Future<bool> deleteRole(Session session, UuidValue roleId) async {
    final assignedUsersCount = await CustomerUser.db.count(session, where: (cu) => cu.roleId.equals(roleId));
    if (assignedUsersCount > 0) {
      throw Exception('Нельзя удалить роль, так как она назначена пользователям ($assignedUsersCount).');
    }
    
    await session.db.transaction((transaction) async {
      await RolePermission.db.deleteWhere(session, where: (rp) => rp.roleId.equals(roleId), transaction: transaction);
      await Role.db.deleteWhere(session, where: (r) => r.id.equals(roleId), transaction: transaction);
    });
    
    return true;
  }

}