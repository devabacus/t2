// lib/features/admin/presentation/providers/users_providers.dart

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:t2_client/t2_client.dart';
import '../../data/providers/user_data_providers.dart'; // <-- Новый импорт

part 'users_providers.g.dart';

@riverpod
Future<List<UserDetails>> usersList(Ref ref) async {
  return ref.watch(userRepositoryProvider).getUsers();
}

@riverpod
Future<List<Customer>> customersList(Ref ref) async {
  // Используем метод из репозитория пользователей
  return ref.watch(userRepositoryProvider).getCustomers();
}

@riverpod
Future<void> createUser(Ref ref, {
  required String userName,
  required String email,
  required String password,
  required String customerId,
  required String roleId,
}) async {
  await ref.read(userRepositoryProvider).createUser(
    userName: userName,
    email: email,
    password: password,
    customerId: customerId,
    roleId: roleId,
  );
  ref.invalidate(usersListProvider);
}

@riverpod
Future<SuperUserDetails?> userDetails(Ref ref, int userId) async {
  return ref.watch(userRepositoryProvider).getUserDetails(userId);
}

@riverpod
Future<void> updateUser(Ref ref, {
  required int userId,
  required String userName,
  required String email,
  required String customerId,
  required String roleId,
}) async {
  await ref.read(userRepositoryProvider).updateUser(
    userId: userId,
    userName: userName,
    email: email,
    customerId: customerId,
    roleId: roleId,
  );
  ref.invalidate(usersListProvider);
  ref.invalidate(userDetailsProvider(userId));
}

@riverpod
Future<void> deleteUser(Ref ref, int userId) async {
  await ref.read(userRepositoryProvider).deleteUser(userId);
  ref.invalidate(usersListProvider);
}

@riverpod
Future<void> blockUser(Ref ref, int userId, bool blocked) async {
  await ref.read(userRepositoryProvider).blockUser(userId, blocked);
  ref.invalidate(usersListProvider);
  ref.invalidate(userDetailsProvider(userId));
}