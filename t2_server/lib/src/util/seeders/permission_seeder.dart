// t2_server/lib/src/util/seeders/permission_seeder.dart

import 'package:serverpod/serverpod.dart';
import '../../generated/protocol.dart';

class PermissionSeeder {
  static const Map<String, String> _definitions = {
    // Организации
    'organizations.read': 'Просмотр списка организаций',
    'organizations.create': 'Создание новых организаций',
    'organizations.update': 'Редактирование организаций',
    'organizations.delete': 'Удаление организаций',
    // Пользователи
    'users.read': 'Просмотр списка пользователей',
    'users.create': 'Создание новых пользователей',
    'users.update': 'Редактирование пользователей',
    'users.delete': 'Удаление пользователей',
    'users.block': 'Блокировка и разблокировка пользователей',
    // Роли
    'roles.read': 'Просмотр ролей и разрешений',
    'roles.create': 'Создание новых ролей',
    'roles.update': 'Редактирование ролей и их разрешений',
    'roles.delete': 'Удаление ролей',
  };
   
  /// Создает или находит все определенные права доступа.
  static Future<Map<String, Permission>> seed(Session session) async {
    final seededPermissions = <String, Permission>{};

    for (final entry in _definitions.entries) {
      final key = entry.key;
      final description = entry.value;

      var permission = await Permission.db.findFirstRow(session, where: (p) => p.key.equals(key));

      if (permission == null) {
        permission = Permission(
          key: key,
          description: description,
          createdAt: DateTime.now().toUtc(),
        );
        permission = await Permission.db.insertRow(session, permission);
        session.log('Created permission: $key', level: LogLevel.debug);
      }
      seededPermissions[key] = permission;
    }

    return seededPermissions;
  }
}