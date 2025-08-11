// lib/features/admin/data/repositories/admin_repository.dart

import 'package:t2_client/t2_client.dart';
import '../../domain/repositories/i_admin_repository.dart';

/// Реализация репозитория для обычного администратора.
/// Вызывает эндпоинты `client.admin.*`.
class AdminRepository implements IAdminRepository {
  final Client _client;
  AdminRepository(this._client);

  @override
  Future<List<UserDetails>> getUsers() => _client.admin.listUsers();

  @override
  Future<void> createUser({
    required String userName,
    required String email,
    required String password,
    required String roleId,
    String? customerId, // Не используется, но нужен для соответствия интерфейсу
  }) async {
    await _client.admin.createUser(
      userName: userName,
      email: email,
      password: password,
      roleId: UuidValue.fromString(roleId),
    );
  }
  
  // Методы, которые не должны быть доступны обычному админу,
  // выбрасывают исключение или возвращают пустые данные.
  @override
  Future<List<Customer>> getCustomers() async {
     final myCustomer = await _client.admin.getMyCustomer();
     return myCustomer != null ? [myCustomer] : [];
  }

  @override
  Future<void> deleteUser(int userId) async {
    // Реализация на сервере для админа может быть добавлена в будущем
    throw UnimplementedError('Администраторы не могут удалять пользователей.');
  }

  @override
  Future<List<Role>> getRoles() => _client.admin.listRoles();

  @override
  Future<List<Permission>> getPermissions() => _client.admin.listPermissions();
  
  // Остальные методы можно реализовать по аналогии или оставить как "заглушки",
  // если они не должны быть доступны обычному админу.
  
  @override
  Future<SuperUserDetails?> getUserDetails(int userId) {
    throw UnimplementedError();
  }
  
  @override
  Future<void> updateUser({
    required int userId,
    required String userName,
    required String email,
    required String customerId,
    required String roleId,
  }) {
    throw UnimplementedError();
  }

  @override
  Future<void> blockUser(int userId, bool blocked) {
     throw UnimplementedError();
  }

  @override
  Future<RoleDetails?> getRoleDetails(String roleId) {
    throw UnimplementedError();
  }

  @override
  Future<void> createRole({
    required String roleName,
    required String? roleDescription,
    required List<String> permissionIds,
    required String customerId,
  }) {
    throw UnimplementedError();
  }

  @override
  Future<void> updateRole({required Role role, required List<String> permissionIds}) {
    throw UnimplementedError();
  }

  @override
  Future<void> deleteRole(String roleId) {
    throw UnimplementedError();
  }

  @override
  Future<Customer?> getOrganizationDetails(String organizationId) {
    throw UnimplementedError();
  }
  
  @override
  Future<void> createOrganization({
    required String organizationName,
    required String? organizationEmail,
    required String? organizationInfo,
  }) {
    throw UnimplementedError();
  }

  @override
  Future<void> updateOrganization({required Customer customer}) {
    throw UnimplementedError();
  }

  @override
  Future<void> deleteOrganization(String organizationId) {
    throw UnimplementedError();
  }
  
  @override
  Future<SuperAdminDashboard> getDashboardData() async {
    // Возвращаем пустые данные, т.к. дашборд для админа ограничен
    return SuperAdminDashboard(
        totalUsers: 0,
        totalCustomers: 0,
        blockedUsers: 0,
        activeUsers: 0,
        recentUsers: []);
  }
}