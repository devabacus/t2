// lib/features/admin/data/repositories/user_repository.dart

import 'package:serverpod_auth_client/serverpod_auth_client.dart';
import 'package:t2_client/t2_client.dart';
import '../../domain/repositories/i_user_repository.dart';

class UserRepository implements IUserRepository {
  final Client _client;
  final UserInfo? _currentUser;

  UserRepository(this._client, this._currentUser);

  bool get _isSuperAdmin => _currentUser?.id == 1;

  @override
  Future<List<UserDetails>> getUsers() async {
    // ✨ УСЛОВНАЯ ЛОГИКА ✨
    if (_isSuperAdmin) {
      // Суперадмин получает всех пользователей через свой эндпоинт
      final superUserDetails = await _client.superAdmin.saListAllUsers();
      return superUserDetails
          .map(
            (superDetail) => UserDetails(
              userInfo: superDetail.userInfo,
              role: superDetail.role,
            ),
          )
          .toList();
    } else {
      // Обычный админ получает пользователей своей организации через admin_endpoint
      return await _client.admin.listUsers(); // ИСПОЛЬЗУЕМ ПРАВИЛЬНЫЙ ЭНДПОИНТ
    }
  }

 @override
  Future<List<Customer>> getCustomers() async {
    // --- ИЗМЕНЕНИЕ ЗДЕСЬ ---
    if (_isSuperAdmin) {
      // Суперадмин по-прежнему получает список ВСЕХ организаций
      return await _client.superAdmin.saListCustomers();
    } else {
      // Обычный админ получает ТОЛЬКО свою организацию через новый безопасный эндпоинт
      final myCustomer = await _client.admin.getMyCustomer();
      // Возвращаем список из одного элемента или пустой список, если что-то пошло не так
      return myCustomer != null ? [myCustomer] : [];
    }
  }

  @override
  Future<SuperUserDetails?> getUserDetails(int userId) async {
    return await _client.superAdmin.saGetUserDetails(userId);
  }

  @override
  Future<void> createUser({
    required String userName,
    required String email,
    required String password,
    required String customerId,
    required String roleId,
  }) async {
    await _client.superAdmin.saCreateUser(
      userName: userName,
      email: email,
      password: password,
      customerId: UuidValue.fromString(customerId),
      roleId: UuidValue.fromString(roleId),
    );
  }

  @override
  Future<void> updateUser({
    required int userId,
    required String userName,
    required String email,
    required String customerId,
    required String roleId,
  }) async {
    await _client.superAdmin.saUpdateUser(
      userId: userId,
      userName: userName,
      email: email,
      customerId: UuidValue.fromString(customerId),
      roleId: UuidValue.fromString(roleId),
    );
  }

  @override
  Future<void> deleteUser(int userId) async {
    await _client.superAdmin.saDeleteUser(userId);
  }

  @override
  Future<void> blockUser(int userId, bool blocked) async {
    await _client.superAdmin.saBlockUser(userId, blocked);
  }
}
