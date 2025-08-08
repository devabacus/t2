// lib/src/permissions.dart
class Permissions {
  // Управление пользователями
  static const viewUsers = 'admin:users:view';
  static const manageUsers = 'admin:users:manage';
  // Управление ролями
  static const viewRoles = 'admin:roles:view';
  static const manageRoles = 'admin:roles:manage';
  // Супер-администратор (НЕ давать обычным админам!)
  static const superAdmin = 'super:admin:all';
  static const List<String> all = [
    viewUsers,
    manageUsers,
    viewRoles,
    manageRoles,
    superAdmin,
  ];
}