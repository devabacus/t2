// lib/features/admin/domain/repositories/i_user_repository.dart

import 'package:t2_client/t2_client.dart';

abstract class IUserRepository {
  Future<List<UserDetails>> getUsers();
  Future<List<Customer>> getCustomers(); // Дублируется, но оставим для независимости модулей
  Future<SuperUserDetails?> getUserDetails(int userId);
  Future<void> createUser({
    required String userName,
    required String email,
    required String password,
    required String customerId,
    required String roleId,
  });
  Future<void> updateUser({
    required int userId,
    required String userName,
    required String email,
    required String customerId,
    required String roleId,
  });
  Future<void> deleteUser(int userId);
  Future<void> blockUser(int userId, bool blocked);
}