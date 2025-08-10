// t2_server/lib/src/util/server_init.dart

import 'package:serverpod/serverpod.dart';
// Важно: импортируем модуль auth для работы с пользователями
import 'package:serverpod_auth_server/module.dart' as auth;
import 'package:t2_server/src/generated/protocol.dart';

/// Класс для первоначального заполнения базы данных (seeding).
class ServerInit {
  /// Основной метод для запуска процесса инициализации.
  static Future<void> run(Session session) async {
    // 1. Создаем все необходимые права в системе.
    final permissions = await _seedPermissions(session);
    session.log('Permissions seeded: ${permissions.length} permissions created or found.', level: LogLevel.info);

    // 2. Создаем роли и пользователей.
    await _seedRolesAndUsers(session, permissions);
    session.log('Roles and Users seeded successfully.', level: LogLevel.info);
  }

  /// Создает или находит все определенные права доступа в базе данных.
  static Future<Map<String, Permission>> _seedPermissions(Session session) async {
    final Map<String, String> permissionDefinitions = {
      // Права для Организаций
      'organizations.read': 'Просмотр списка организаций',
      'organizations.create': 'Создание новых организаций',
      'organizations.update': 'Редактирование организаций',
      'organizations.delete': 'Удаление организаций',
      // Права для Пользователей
      'users.read': 'Просмотр списка пользователей',
      'users.create': 'Создание новых пользователей',
      'users.update': 'Редактирование пользователей',
      'users.delete': 'Удаление пользователей',
      'users.block': 'Блокировка и разблокировка пользователей',
      // Права для Ролей
      'roles.read': 'Просмотр ролей и разрешений',
      'roles.create': 'Создание новых ролей',
      'roles.update': 'Редактирование ролей и их разрешений',
      'roles.delete': 'Удаление ролей',
    };

    final Map<String, Permission> seededPermissions = {};

    for (final key in permissionDefinitions.keys) {
      var permission = await Permission.db.findFirstRow(session, where: (p) => p.key.equals(key));
      
      if (permission == null) {
        permission = Permission(
          key: key,
          description: permissionDefinitions[key],
          createdAt: DateTime.now().toUtc(),
        );
        await Permission.db.insertRow(session, permission);
      }
      seededPermissions[key] = permission;
    }

    return seededPermissions;
  }

  /// Создает роли, пользователей и связывает их с правами.
  static Future<void> _seedRolesAndUsers(Session session, Map<String, Permission> permissions) async {
    
    // --- 1. Создание Организации по умолчанию ---
    var defaultCustomer = await Customer.db.findFirstRow(session, where: (c) => c.name.equals('Default Corp'));
    if (defaultCustomer == null) {
      defaultCustomer = Customer(
          name: 'Default Corp', 
          userId: 0, // будет перезаписано при создании суперадмина
          createdAt: DateTime.now().toUtc(), 
          lastModified: DateTime.now().toUtc(), 
          isDeleted: false
      );
      defaultCustomer = await Customer.db.insertRow(session, defaultCustomer);
    }
    
    // --- 2. Создание роли "Супер Администратор" ---
    var superAdminRole = await Role.db.findFirstRow(session, where: (r) => r.name.equals('Super Admin'));
    if (superAdminRole == null) {
      superAdminRole = Role(
        customerId: defaultCustomer.id!,
        name: 'Super Admin',
        description: 'Имеет доступ ко всем функциям системы.',
        createdAt: DateTime.now().toUtc(),
      );
      superAdminRole = await Role.db.insertRow(session, superAdminRole);

      // Назначаем ВСЕ права этой роли
      for (final p in permissions.values) {
        await RolePermission.db.insertRow(session, RolePermission(
          roleId: superAdminRole.id!,
          permissionId: p.id!,
        ));
      }
    }
    
    // --- 3. Создание пользователя "Супер Администратор" ---
    final superAdminEmail = 'admin@example.com';
    var superAdminUser = await auth.Users.findUserByEmail(session, superAdminEmail);
    if (superAdminUser == null) {
      superAdminUser = await auth.Users.createUser(
        session,
        auth.UserInfo(
          userName: 'SuperAdmin',
          email: superAdminEmail,
          fullName: 'Главный Администратор',
          created: DateTime.now().toUtc(),
          scopeNames: [], 
          blocked: false, 
          userIdentifier: superAdminEmail,
        ),
        '123qweasd', // Установите надежный пароль
      );

      if (superAdminUser != null) {
        // Связываем пользователя с организацией и ролью
        await CustomerUser.db.insertRow(session, CustomerUser(
          customerId: defaultCustomer.id!,
          userId: superAdminUser.id!,
          roleId: superAdminRole.id!,
        ));

        // Обновляем организацию, указывая, кто ее создал
        defaultCustomer.userId = superAdminUser.id!;
        await Customer.db.updateRow(session, defaultCustomer);
        session.log('Super Admin user created successfully with ID: ${superAdminUser.id}', level: LogLevel.info);
      } else {
        session.log('Failed to create Super Admin user.', level: LogLevel.error);
      }
    }

    // --- 4. Создание роли "Demo User" ---
    var demoRole = await Role.db.findFirstRow(session, where: (r) => r.name.equals('Demo User'));
    if (demoRole == null) {
      demoRole = Role(
        customerId: defaultCustomer.id!,
        name: 'Demo User',
        description: 'Имеет права только на чтение.',
        createdAt: DateTime.now().toUtc(),
      );
      demoRole = await Role.db.insertRow(session, demoRole);

      // Назначаем права только на чтение
      final readPermissions = permissions.values.where((p) => p.key.endsWith('.read'));
      for (final p in readPermissions) {
        await RolePermission.db.insertRow(session, RolePermission(
          roleId: demoRole.id!,
          permissionId: p.id!,
        ));
      }
    }

    // --- 5. Создание пользователя "Demo User" ---
    final demoUserEmail = 'demo@example.com';
    var demoUser = await auth.Users.findUserByEmail(session, demoUserEmail);
    if (demoUser == null) {
      demoUser = await auth.Users.createUser(
        session,
        auth.UserInfo(
          userName: 'DemoUser',
          email: demoUserEmail,
          fullName: 'Демонстрационный Пользователь',
          created: DateTime.now().toUtc(),
          scopeNames: [],
          blocked: false,
          userIdentifier: demoUserEmail,
        ),
        '123qweasd',
      );

      if (demoUser != null) {
        // Связываем демо-пользователя с организацией и демо-ролью
        await CustomerUser.db.insertRow(session, CustomerUser(
          customerId: defaultCustomer.id!,
          userId: demoUser.id!,
          roleId: demoRole.id!,
        ));
        session.log('Demo User created successfully with ID: ${demoUser.id}', level: LogLevel.info);
      } else {
        session.log('Failed to create Demo User.', level: LogLevel.error);
      }
    }
  }
}