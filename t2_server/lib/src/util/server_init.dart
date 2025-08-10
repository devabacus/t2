// t2_server/lib/src/util/server_init.dart

import 'package:serverpod/serverpod.dart';
// Важно: импортируем модуль auth для работы с пользователями
import 'package:serverpod_auth_server/module.dart' as auth;
import 'package:t2_server/src/generated/protocol.dart';

/// Класс для первоначального заполнения базы данных (seeding).
class ServerInit {
  /// Основной метод для запуска процесса инициализации.
  static Future<void> run(Session session) async {
    print('[ServerInit] Starting database initialization...');
    
    // 1. Создаем все необходимые права в системе.
    final permissions = await _seedPermissions(session);
    print('[ServerInit] Permissions seeded: ${permissions.length} permissions created or found.');
    session.log('Permissions seeded: ${permissions.length} permissions created or found.', level: LogLevel.info);

    // 2. Создаем роли и пользователей.
    await _seedRolesAndUsers(session, permissions);
    print('[ServerInit] Roles and Users seeding process completed.');
    session.log('Roles and Users seeding process completed.', level: LogLevel.info);
  }

  /// Создает или находит все определенные права доступа в базе данных.
  static Future<Map<String, Permission>> _seedPermissions(Session session) async {
    print('[ServerInit] Seeding permissions...');
    
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
        // insertRow возвращает объект с установленным id
        permission = await Permission.db.insertRow(session, permission);
        print('[ServerInit] Created permission: $key with ID: ${permission.id}');
      } else {
        print('[ServerInit] Permission already exists: $key with ID: ${permission.id}');
      }
      seededPermissions[key] = permission;
    }

    return seededPermissions;
  }

  /// Проверяет и восстанавливает permissions для роли
  static Future<void> _ensureRolePermissions(
    Session session,
    Role role,
    List<Permission> requiredPermissions,
  ) async {
    print('[ServerInit] Checking permissions for role: ${role.name}');
    
    // Получаем существующие permissions для роли
    final existingRolePermissions = await RolePermission.db.find(
      session,
      where: (rp) => rp.roleId.equals(role.id!),
    );
    
    final existingPermissionIds = existingRolePermissions
        .map((rp) => rp.permissionId)
        .toSet();
    
    // Находим отсутствующие permissions (проверяем что id не null)
    final missingPermissions = requiredPermissions
        .where((p) => p.id != null && !existingPermissionIds.contains(p.id!))
        .toList();
    
    if (missingPermissions.isNotEmpty) {
      print('[ServerInit] Adding ${missingPermissions.length} missing permissions to role ${role.name}');
      
      for (final permission in missingPermissions) {
        await RolePermission.db.insertRow(
          session,
          RolePermission(
            roleId: role.id!,
            permissionId: permission.id!,
          ),
        );
      }
      
      print('[ServerInit] Added missing permissions to role ${role.name}');
    } else {
      print('[ServerInit] All permissions are already assigned to role ${role.name}');
    }
  }

  /// Создает роли, пользователей и связывает их с правами.
  static Future<void> _seedRolesAndUsers(Session session, Map<String, Permission> permissions) async {
    print('[ServerInit] Starting roles and users seeding...');
    
    // --- 1. Создание Организации по умолчанию ---
    print('[ServerInit] Looking for Default Corp...');
    var defaultCustomer = await Customer.db.findFirstRow(session, where: (c) => c.name.equals('Default Corp'));
    if (defaultCustomer == null) {
      print('[ServerInit] Creating Default Corp...');
      defaultCustomer = Customer(
          name: 'Default Corp', 
          userId: 0, // будет перезаписано при создании суперадмина
          createdAt: DateTime.now().toUtc(), 
          lastModified: DateTime.now().toUtc(), 
          isDeleted: false
      );
      defaultCustomer = await Customer.db.insertRow(session, defaultCustomer);
      print('[ServerInit] Default Corp created with ID: ${defaultCustomer.id}');
    } else {
      print('[ServerInit] Default Corp already exists with ID: ${defaultCustomer.id}');
    }
    
    // --- 2. Создание роли "Супер Администратор" ---
    print('[ServerInit] Looking for Super Admin role...');
    var superAdminRole = await Role.db.findFirstRow(session, where: (r) => r.name.equals('Super Admin'));
    bool isNewSuperAdminRole = false;
    
    if (superAdminRole == null) {
      print('[ServerInit] Creating Super Admin role...');
      superAdminRole = Role(
        customerId: defaultCustomer.id!,
        name: 'Super Admin',
        description: 'Имеет доступ ко всем функциям системы.',
        createdAt: DateTime.now().toUtc(),
      );
      superAdminRole = await Role.db.insertRow(session, superAdminRole);
      print('[ServerInit] Super Admin role created with ID: ${superAdminRole.id}');
      isNewSuperAdminRole = true;
    } else {
      print('[ServerInit] Super Admin role already exists with ID: ${superAdminRole.id}');
    }
    
    // Назначаем permissions для Super Admin роли
    if (isNewSuperAdminRole) {
      // Для новой роли просто добавляем все permissions
      print('[ServerInit] Assigning all permissions to new Super Admin role...');
      int assignedCount = 0;
      for (final p in permissions.values) {
        if (p.id != null) {
          await RolePermission.db.insertRow(session, RolePermission(
            roleId: superAdminRole.id!,
            permissionId: p.id!,
          ));
          assignedCount++;
          print('[ServerInit] Assigned permission ${p.key} (ID: ${p.id}) to Super Admin');
        } else {
          print('[ServerInit] WARNING: Permission ${p.key} has null ID, skipping');
        }
      }
      print('[ServerInit] Assigned $assignedCount permissions to Super Admin role');
    } else {
      // Для существующей роли проверяем и восстанавливаем отсутствующие
      await _ensureRolePermissions(
        session,
        superAdminRole,
        permissions.values.toList(),
      );
    }
    
    // --- 3. Создание пользователя "Супер Администратор" ---
    final superAdminEmail = 'admin@example.com';
    print('[ServerInit] Looking for Super Admin user with email: $superAdminEmail');
    
    var superAdminUser = await auth.Users.findUserByEmail(session, superAdminEmail);
    if (superAdminUser == null) {
      print('[ServerInit] Super Admin user not found. Attempting to create...');
      session.log('Attempting to create Super Admin user...', level: LogLevel.debug);
      
      try {
        // Создаем UserInfo
        final userInfo = auth.UserInfo(
          userName: 'SuperAdmin',
          email: superAdminEmail,
          fullName: 'Главный Администратор',
          created: DateTime.now().toUtc(),
          scopeNames: [], 
          blocked: false, 
          userIdentifier: superAdminEmail,
        );
        
        // Используем createUser который должен создать и email auth
        superAdminUser = await auth.Users.createUser(
          session,
          userInfo,
          '123qweasd',
        );
        
        // Если createUser не создал email auth, создаем вручную
        if (superAdminUser != null) {
          var emailAuth = await auth.EmailAuth.db.findFirstRow(
            session,
            where: (ea) => ea.email.equals(superAdminEmail),
          );
          
          if (emailAuth == null) {
            print('[ServerInit] Creating EmailAuth for Super Admin...');
            final passwordHash = await auth.AuthConfig.current.passwordHashGenerator('123qweasd');
            print('[ServerInit] Generated password hash: $passwordHash');
            
            await auth.EmailAuth.db.insertRow(
              session,
              auth.EmailAuth(
                userId: superAdminUser.id!,
                email: superAdminEmail,
                hash: passwordHash,
              ),
            );
            print('[ServerInit] EmailAuth created for Super Admin');
          } else {
            print('[ServerInit] EmailAuth already exists for Super Admin');
          }
        }

        print('[ServerInit] auth.Users.createUser returned: ${superAdminUser?.toString()}');
        session.log('auth.Users.createUser for Super Admin returned: ${superAdminUser?.toString()}', level: LogLevel.debug);

        if (superAdminUser != null) {
          print('[ServerInit] Creating CustomerUser link...');
          await CustomerUser.db.insertRow(session, CustomerUser(
            customerId: defaultCustomer.id!,
            userId: superAdminUser.id!,
            roleId: superAdminRole.id!,
          ));

          defaultCustomer.userId = superAdminUser.id!;
          await Customer.db.updateRow(session, defaultCustomer);
          
          print('[ServerInit] Super Admin user created successfully with ID: ${superAdminUser.id}');
          session.log('Super Admin user created successfully with ID: ${superAdminUser.id}', level: LogLevel.info);
        } else {
          print('[ServerInit] ERROR: auth.Users.createUser returned null for Super Admin');
          session.log('Failed to create Super Admin user. auth.Users.createUser returned null.', level: LogLevel.error);
        }
      } catch (e, stackTrace) {
        print('[ServerInit] EXCEPTION while creating Super Admin: $e');
        print('[ServerInit] Stack trace: $stackTrace');
        session.log(
          'An exception occurred while creating Super Admin user.',
          level: LogLevel.error,
          exception: e,
          stackTrace: stackTrace,
        );
      }
    } else {
        print('[ServerInit] Super Admin user already exists with ID: ${superAdminUser.id}');
        session.log('Super Admin user already exists.', level: LogLevel.info);
        
        // Проверяем, есть ли связь CustomerUser для этого пользователя
        var customerUser = await CustomerUser.db.findFirstRow(
          session,
          where: (cu) => cu.userId.equals(superAdminUser!.id!),
        );
        
        if (customerUser == null) {
          print('[ServerInit] CustomerUser link not found for Super Admin. Creating...');
          await CustomerUser.db.insertRow(session, CustomerUser(
            customerId: defaultCustomer.id!,
            userId: superAdminUser.id!,
            roleId: superAdminRole.id!,
          ));
          print('[ServerInit] CustomerUser link created for Super Admin');
        }
        
        // Обновляем Customer.userId если необходимо
        if (defaultCustomer.userId == 0) {
          defaultCustomer.userId = superAdminUser.id!;
          await Customer.db.updateRow(session, defaultCustomer);
          print('[ServerInit] Updated Default Corp userId to Super Admin');
        }
    }

    // --- 4. Создание роли "Demo User" ---
    print('[ServerInit] Looking for Demo User role...');
    var demoRole = await Role.db.findFirstRow(session, where: (r) => r.name.equals('Demo User'));
    bool isNewDemoRole = false;
    
    if (demoRole == null) {
      print('[ServerInit] Creating Demo User role...');
      demoRole = Role(
        customerId: defaultCustomer.id!,
        name: 'Demo User',
        description: 'Имеет права только на чтение.',
        createdAt: DateTime.now().toUtc(),
      );
      demoRole = await Role.db.insertRow(session, demoRole);
      print('[ServerInit] Demo User role created');
      isNewDemoRole = true;
    } else {
      print('[ServerInit] Demo User role already exists');
    }
    
    // Назначаем permissions для Demo роли
    final readPermissions = permissions.values
        .where((p) => p.key.endsWith('.read'))
        .toList();
    
    if (isNewDemoRole) {
      // Для новой роли просто добавляем read permissions
      print('[ServerInit] Assigning read permissions to new Demo User role...');
      int assignedCount = 0;
      for (final p in readPermissions) {
        if (p.id != null) {
          await RolePermission.db.insertRow(session, RolePermission(
            roleId: demoRole.id!,
            permissionId: p.id!,
          ));
          assignedCount++;
          print('[ServerInit] Assigned permission ${p.key} (ID: ${p.id}) to Demo User');
        } else {
          print('[ServerInit] WARNING: Permission ${p.key} has null ID, skipping');
        }
      }
      print('[ServerInit] Assigned $assignedCount read permissions to Demo User role');
    } else {
      // Для существующей роли проверяем и восстанавливаем отсутствующие
      await _ensureRolePermissions(
        session,
        demoRole,
        readPermissions,
      );
    }

    // --- 5. Создание пользователя "Demo User" ---
    final demoUserEmail = 'demo@example.com';
    print('[ServerInit] Looking for Demo user with email: $demoUserEmail');
    
    var demoUser = await auth.Users.findUserByEmail(session, demoUserEmail);
    if (demoUser == null) {
        print('[ServerInit] Demo user not found. Attempting to create...');
        session.log('Attempting to create Demo user...', level: LogLevel.debug);
        
        try {
            // Создаем UserInfo
            final demoUserInfo = auth.UserInfo(
                userName: 'DemoUser',
                email: demoUserEmail,
                fullName: 'Демонстрационный Пользователь',
                created: DateTime.now().toUtc(),
                scopeNames: [],
                blocked: false,
                userIdentifier: demoUserEmail,
            );
            
            demoUser = await auth.Users.createUser(
                session,
                demoUserInfo,
                '123qweasd',
            );
            
            // Если createUser не создал email auth, создаем вручную
            if (demoUser != null) {
              var emailAuth = await auth.EmailAuth.db.findFirstRow(
                session,
                where: (ea) => ea.email.equals(demoUserEmail),
              );
              
              if (emailAuth == null) {
                print('[ServerInit] Creating EmailAuth for Demo User...');
                final passwordHash = await auth.AuthConfig.current.passwordHashGenerator('123qweasd');
                await auth.EmailAuth.db.insertRow(
                  session,
                  auth.EmailAuth(
                    userId: demoUser.id!,
                    email: demoUserEmail,
                    hash: passwordHash,
                  ),
                );
              }
            }

            print('[ServerInit] auth.Users.createUser for Demo User returned: ${demoUser?.toString()}');
            session.log('auth.Users.createUser for Demo User returned: ${demoUser?.toString()}', level: LogLevel.debug);

            if (demoUser != null) {
                await CustomerUser.db.insertRow(session, CustomerUser(
                    customerId: defaultCustomer.id!,
                    userId: demoUser.id!,
                    roleId: demoRole.id!,
                ));
                print('[ServerInit] Demo User created successfully with ID: ${demoUser.id}');
                session.log('Demo User created successfully with ID: ${demoUser.id}', level: LogLevel.info);
            } else {
                print('[ServerInit] ERROR: auth.Users.createUser returned null for Demo User');
                session.log('Failed to create Demo User. auth.Users.createUser returned null.', level: LogLevel.error);
            }
        } catch (e, stackTrace) {
            print('[ServerInit] EXCEPTION while creating Demo user: $e');
            print('[ServerInit] Stack trace: $stackTrace');
            session.log(
                'An exception occurred while creating Demo user.',
                level: LogLevel.error,
                exception: e,
                stackTrace: stackTrace,
            );
        }
    } else {
        print('[ServerInit] Demo user already exists with ID: ${demoUser.id}');
        session.log('Demo user already exists.', level: LogLevel.info);
        
        // Проверяем, есть ли связь CustomerUser для этого пользователя
        var customerUser = await CustomerUser.db.findFirstRow(
          session,
          where: (cu) => cu.userId.equals(demoUser!.id!),
        );
        
        if (customerUser == null) {
          print('[ServerInit] CustomerUser link not found for Demo User. Creating...');
          await CustomerUser.db.insertRow(session, CustomerUser(
            customerId: defaultCustomer.id!,
            userId: demoUser.id!,
            roleId: demoRole.id!,
          ));
          print('[ServerInit] CustomerUser link created for Demo User');
        }
    }
    
    print('[ServerInit] Roles and users seeding completed!');
  }
}