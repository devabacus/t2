// lib/src/endpoints/admin_endpoint.dart
import 'package:serverpod/serverpod.dart';
import 'package:serverpod_auth_server/serverpod_auth_server.dart';

import '../generated/protocol.dart';
import 'shared/auth_context_mixin.dart';

class SuperAdminEndpoint extends Endpoint with AuthContextMixin {
  
  static const List<int> _superAdminUserIds = [1]; // ⚠️ ЗАМЕНИТЕ НА ВАШ ID

  Future<void> _requireSuperAdmin(Session session) async {
    // ИСПРАВЛЕНО: Используем ваш AuthContextMixin для получения userId
    final authContext = await getAuthenticatedUserContext(session);
    if (!_superAdminUserIds.contains(authContext.userId)) {
      throw Exception('Доступ запрещен.');
    }
  }

  Future<List<Customer>> saListCustomers(Session session) async {
    await _requireSuperAdmin(session);
    return Customer.db.find(session, orderBy: (t) => t.name);
  }

  Future<Customer> saSaveCustomer(Session session, Customer customer) async {
    await _requireSuperAdmin(session);
    
    if (customer.id == null) {
      final authContext = await getAuthenticatedUserContext(session);
      customer.userId = authContext.userId;
      return Customer.db.insertRow(session, customer);
    } else {
      return Customer.db.updateRow(session, customer);
    }
  }

  Future<UserInfo?> saCreateUser(Session session, {
    required String userName,
    required String email,
    required String password,
    required UuidValue customerId,
    required UuidValue roleId,
  }) async {
    await _requireSuperAdmin(session);

    var existing = await Users.findUserByEmail(session, email);
    if (existing != null) {
      throw Exception('Пользователь с таким email уже существует.');
    }
    
    var userInfo = UserInfo(
        userIdentifier: email,
        email: email,
        userName: userName,
        created: DateTime.now().toUtc(),
        scopeNames: [],
        blocked: false
    );
    
    var createdUser = await Users.createUser(session, userInfo, password);
    // Users.createUser может вернуть null, поэтому нужна проверка
    if (createdUser == null) return null;

    await CustomerUser.db.insertRow(session, CustomerUser(
        customerId: customerId,
        userId: createdUser.id!,
        roleId: roleId,
    ));
    return createdUser;
  }


  // Добавьте эти методы в ваш AdminEndpoint после существующих sa методов:

  // Получение всех пользователей системы
  Future<List<SuperUserDetails>> saListAllUsers(Session session, {
    UuidValue? customerId,
    int? limit,
    int? offset,
  }) async {
    await _requireSuperAdmin(session);

    // Фильтруем по customerId если указан
    final customerUsersQuery = customerId != null
        ? await CustomerUser.db.find(
            session,
            where: (cu) => cu.customerId.equals(customerId),
            limit: limit ?? 100,
            offset: offset ?? 0,
          )
        : await CustomerUser.db.find(
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

  // Блокировка/разблокировка пользователя
Future<bool> saBlockUser(Session session, int userId, bool blocked) async {
  await _requireSuperAdmin(session);

  final userInfo = await UserInfo.db.findById(session, userId);
  if (userInfo == null) {
    throw Exception('Пользователь не найден.');
  }

  userInfo.blocked = blocked;
  await UserInfo.db.updateRow(session, userInfo);

  // Исправленное логирование
  final authContext = await getAuthenticatedUserContext(session);
  session.log(
    blocked 
      ? 'User $userId blocked by admin ${authContext.userId}'
      : 'User $userId unblocked by admin ${authContext.userId}',
    level: LogLevel.info,
  );

  return true;
}

  // Удаление клиента
  Future<bool> saDeleteCustomer(Session session, UuidValue customerId) async {
    await _requireSuperAdmin(session);

    final usersCount = await CustomerUser.db.count(
      session,
      where: (cu) => cu.customerId.equals(customerId),
    );

    if (usersCount > 0) {
      throw Exception(
        'Нельзя удалить клиента с активными пользователями ($usersCount).',
      );
    }

    await session.db.transaction((transaction) async {
      // Удаляем роли и их связи
      final roles = await Role.db.find(
        session,
        where: (r) => r.customerId.equals(customerId),
      );
      
      for (var role in roles) {
        await RolePermission.db.deleteWhere(
          session,
          where: (rp) => rp.roleId.equals(role.id!),
          transaction: transaction,
        );
      }
      
      await Role.db.deleteWhere(
        session,
        where: (r) => r.customerId.equals(customerId),
        transaction: transaction,
      );

      // Удаляем клиента
      await Customer.db.deleteWhere(
        session,
        where: (c) => c.id.equals(customerId),
        transaction: transaction,
      );
    });

    return true;
  }

  // Dashboard с метриками
  Future<SuperAdminDashboard> saGetDashboard(Session session) async {
    await _requireSuperAdmin(session);

    final totalUsers = await UserInfo.db.count(session);
    final totalCustomers = await Customer.db.count(session);
    final blockedUsers = await UserInfo.db.count(
      session,
      where: (u) => u.blocked.equals(true),
    );
    final activeUsers = await CustomerUser.db.count(session);

    final recentUsers = await UserInfo.db.find(
      session,
      orderBy: (u) => u.created,
      orderDescending: true,
      limit: 10,
    );

    return SuperAdminDashboard(
      totalUsers: totalUsers,
      totalCustomers: totalCustomers,
      blockedUsers: blockedUsers,
      activeUsers: activeUsers,
      recentUsers: recentUsers,
    );
  }

  // Получение всех ролей в системе
  Future<List<Role>> saListAllRoles(Session session, {
    UuidValue? customerId,
  }) async {
    await _requireSuperAdmin(session);

    if (customerId != null) {
      return Role.db.find(
        session,
        where: (r) => r.customerId.equals(customerId),
      );
    }

    return Role.db.find(session);
  }

  // Перемещение пользователя между организациями
  Future<bool> saMoveUserToCustomer(Session session, {
    required int userId,
    required UuidValue newCustomerId,
    required UuidValue newRoleId,
  }) async {
    await _requireSuperAdmin(session);

    // Проверяем что роль принадлежит новому клиенту
    final role = await Role.db.findById(session, newRoleId);
    if (role == null || role.customerId != newCustomerId) {
      throw Exception('Роль не найдена или не принадлежит указанному клиенту.');
    }

    var customerUser = await CustomerUser.db.findFirstRow(
      session,
      where: (cu) => cu.userId.equals(userId),
    );

    if (customerUser == null) {
      // Создаем новую связь
      await CustomerUser.db.insertRow(
        session,
        CustomerUser(
          customerId: newCustomerId,
          userId: userId,
          roleId: newRoleId,
        ),
      );
    } else {
      // Обновляем существующую
      customerUser.customerId = newCustomerId;
      customerUser.roleId = newRoleId;
      await CustomerUser.db.updateRow(session, customerUser);
    }

    return true;
  }
}