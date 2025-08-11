// lib/src/endpoints/admin_endpoint.dart
import 'package:serverpod/serverpod.dart';
import 'package:serverpod_auth_server/serverpod_auth_server.dart';

import '../generated/protocol.dart';
import '../services/admin_service.dart';
import 'shared/auth_context_mixin.dart';

class SuperAdminEndpoint extends Endpoint with AuthContextMixin {
  
   final AdminService _adminService = AdminService();
  static const List<int> _superAdminUserIds = [1];

  Future<void> _requireSuperAdmin(Session session) async {
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

    // 1. ✨ Используем Emails.createUser
    // Этот метод создает и UserInfo, и EmailAuth (запись для входа) за один вызов,
    // используя имя пользователя, email и пароль.
    var createdUser = await Emails.createUser(
      session,
      userName,
      email,
      password,
    );

    // 2. Проверяем результат
    if (createdUser == null) {
      // Это может произойти, если пользователь с таким email уже существует.
      throw Exception('Пользователь с таким email уже существует.');
    }

    // 3. Связываем созданного пользователя с организацией и ролью
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
    UuidValue? customerId, // customerId пока не используется в сервисе, но оставим для будущих доработок
    int? limit,
    int? offset,
  }) async {
    await _requireSuperAdmin(session);
    // 4. Делегируем вызов сервису
    return _adminService.listAllUsers(session, limit: limit, offset: offset);
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
  Future<List<Role>> saListAllRoles(Session session, {UuidValue? customerId}) async {
    await _requireSuperAdmin(session);
    // Логика фильтрации по customerId теперь может быть в сервисе, если понадобится
    return _adminService.listAllRoles(session);
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



// Добавить в t2_server/lib/src/endpoints/super_admin_endpoint.dart

  // Получение всех разрешений в системе
 Future<List<Permission>> saListAllPermissions(Session session) async {
    await _requireSuperAdmin(session);
    return _adminService.listAllPermissions(session);
  }

  // Создание/обновление роли (суперадмин версия)
 Future<Role> saCreateOrUpdateRole(Session session, {
    required Role role,
    required List<UuidValue> permissionIds,
  }) async {
    await _requireSuperAdmin(session);
    return _adminService.createOrUpdateRole(session, role: role, permissionIds: permissionIds);
  }

  // Удаление роли (суперадмин версия)
  Future<bool> saDeleteRole(Session session, UuidValue roleId) async {
    await _requireSuperAdmin(session);
    return _adminService.deleteRole(session, roleId);
  }

  // Обновление информации о пользователе
  Future<bool> saUpdateUser(Session session, {
    required int userId,
    required String userName,
    required String email,
    required UuidValue customerId,
    required UuidValue roleId,
  }) async {
    await _requireSuperAdmin(session);

    // Проверяем, что пользователь существует
    final userInfo = await UserInfo.db.findById(session, userId);
    if (userInfo == null) {
      throw Exception('Пользователь не найден.');
    }

    // Проверяем уникальность email (если изменился)
    if (userInfo.email != email) {
      final existingUser = await Users.findUserByEmail(session, email);
      if (existingUser != null && existingUser.id != userId) {
        throw Exception('Пользователь с таким email уже существует.');
      }
    }

    // Проверяем, что роль принадлежит указанной организации
    final role = await Role.db.findById(session, roleId);
    if (role == null || role.customerId != customerId) {
      throw Exception('Роль не найдена или не принадлежит указанной организации.');
    }

    await session.db.transaction((transaction) async {
      // Обновляем информацию пользователя
      userInfo.userName = userName;
      userInfo.email = email;
      userInfo.userIdentifier = email; // Обычно userIdentifier = email
      
      await UserInfo.db.updateRow(session, userInfo, transaction: transaction);

      // Обновляем связь пользователь-организация-роль
      final customerUser = await CustomerUser.db.findFirstRow(
        session,
        where: (cu) => cu.userId.equals(userId),
        transaction: transaction,
      );

      if (customerUser != null) {
        customerUser.customerId = customerId;
        customerUser.roleId = roleId;
        await CustomerUser.db.updateRow(session, customerUser, transaction: transaction);
      } else {
        // Если по какой-то причине связи нет, создаем новую
        await CustomerUser.db.insertRow(
          session,
          CustomerUser(
            customerId: customerId,
            userId: userId,
            roleId: roleId,
          ),
          transaction: transaction,
        );
      }
    });

    // Логируем действие
    final authContext = await getAuthenticatedUserContext(session);
    session.log(
      'User $userId updated by admin ${authContext.userId}',
      level: LogLevel.info,
    );

    return true;
  }

  // Удаление пользователя
  Future<bool> saDeleteUser(Session session, int userId) async {
    await _requireSuperAdmin(session);

    // Проверяем, что пользователь существует
    final userInfo = await UserInfo.db.findById(session, userId);
    if (userInfo == null) {
      throw Exception('Пользователь не найден.');
    }

    // Проверяем, что это не суперадминистратор
    if (_superAdminUserIds.contains(userId)) {
      throw Exception('Нельзя удалить суперадминистратора.');
    }

    await session.db.transaction((transaction) async {
      // Удаляем связи пользователь-организация-роль
      await CustomerUser.db.deleteWhere(
        session,
        where: (cu) => cu.userId.equals(userId),
        transaction: transaction,
      );

      // Удаляем информацию о пользователе
      await UserInfo.db.deleteWhere(
        session,
        where: (u) => u.id.equals(userId),
        transaction: transaction,
      );
    });

    // Логируем действие
    final authContext = await getAuthenticatedUserContext(session);
    session.log(
      'User $userId deleted by admin ${authContext.userId}',
      level: LogLevel.info,
    );

    return true;
  }

  // Получение детальной информации о пользователе
  Future<SuperUserDetails?> saGetUserDetails(Session session, int userId) async {
    await _requireSuperAdmin(session);

    final userInfo = await UserInfo.db.findById(session, userId);
    if (userInfo == null) return null;

    final customerUser = await CustomerUser.db.findFirstRow(
      session,
      where: (cu) => cu.userId.equals(userId),
    );

    Customer? customer;
    Role? role;

    if (customerUser != null) {
      customer = await Customer.db.findById(session, customerUser.customerId);
      role = await Role.db.findById(session, customerUser.roleId);
    }

    return SuperUserDetails(
      userInfo: userInfo,
      customer: customer,
      role: role,
      customerUser: customerUser,
    );
  }

  Future<RoleDetails?> saGetRoleDetails(Session session, UuidValue roleId) async {
    await _requireSuperAdmin(session);
    return _adminService.getRoleDetails(session, roleId);
  }
 
Future<Customer?> saGetCustomer(Session session, UuidValue customerId) async {
  // Нужны проверки доступа (является ли пользователь суперадмином)
  await _requireSuperAdmin(session);
  return await Customer.db.findById(session, customerId);
}
}


