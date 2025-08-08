// lib/features/admin/data/repositories/user_repository.dart

import 'package:t2_client/t2_client.dart';
import '../../domain/repositories/i_user_repository.dart';

class UserRepository implements IUserRepository {
  final Client _client;

  UserRepository(this._client);

  @override
  Future<List<UserDetails>> getUsers() async {
    final superUserDetails = await _client.superAdmin.saListAllUsers();
    return superUserDetails.map((superDetail) => UserDetails(
      userInfo: superDetail.userInfo,
      role: superDetail.role,
    )).toList();
  }

  @override
  Future<List<Customer>> getCustomers() async {
    return await _client.superAdmin.saListCustomers();
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