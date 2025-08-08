// lib/features/admin/presentation/providers/users_providers.dart

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:t2_client/t2_client.dart';
import '../../../../core/providers/serverpod_client_provider.dart';

part 'users_providers.g.dart';

@riverpod
Future<List<UserDetails>> usersList(Ref ref) async {
  final client = ref.read(serverpodClientProvider);
  try {
    // Временно используем super admin endpoint, пока не настроим роли
    final superUserDetails = await client.superAdmin.saListAllUsers();
    
    // Преобразуем SuperUserDetails в UserDetails
    return superUserDetails.map((superDetail) => UserDetails(
      userInfo: superDetail.userInfo,
      role: superDetail.role,
    )).toList();
  } catch (e) {
    throw Exception('Не удалось загрузить список пользователей: $e');
  }
}

@riverpod
Future<List<Customer>> customersList(Ref ref) async {
  final client = ref.read(serverpodClientProvider);
  try {
    return await client.superAdmin.saListCustomers();
  } catch (e) {
    throw Exception('Не удалось загрузить список организаций: $e');
  }
}

@riverpod
Future<void> createUser(Ref ref, {
  required String userName,
  required String email,
  required String password,
  required String customerId,
  required String roleId,
}) async {
  final client = ref.read(serverpodClientProvider);
  
  // Преобразуем строки в UuidValue
  final customerUuid = UuidValue.fromString(customerId);
  final roleUuid = UuidValue.fromString(roleId);
  
  // Используем super admin endpoint для создания пользователя
  await client.superAdmin.saCreateUser(
    userName: userName,
    email: email,
    password: password,
    customerId: customerUuid,
    roleId: roleUuid,
  );
  
  // Обновляем список пользователей после создания
  ref.invalidate(usersListProvider);
}

// НОВЫЕ ПРОВАЙДЕРЫ ДЛЯ РЕДАКТИРОВАНИЯ И УДАЛЕНИЯ

@riverpod
Future<SuperUserDetails?> userDetails(Ref ref, int userId) async {
  final client = ref.read(serverpodClientProvider);
  try {
    return await client.superAdmin.saGetUserDetails(userId);
  } catch (e) {
    throw Exception('Не удалось загрузить данные пользователя: $e');
  }
}

@riverpod
Future<void> updateUser(Ref ref, {
  required int userId,
  required String userName,
  required String email,
  required String customerId,
  required String roleId,
}) async {
  final client = ref.read(serverpodClientProvider);
  
  try {
    // Преобразуем строки в UuidValue
    final customerUuid = UuidValue.fromString(customerId);
    final roleUuid = UuidValue.fromString(roleId);
    
    // Используем новый метод для обновления пользователя
    await client.superAdmin.saUpdateUser(
      userId: userId,
      userName: userName,
      email: email,
      customerId: customerUuid,
      roleId: roleUuid,
    );
    
    // Обновляем кэш
    ref.invalidate(usersListProvider);
    ref.invalidate(userDetailsProvider(userId));
  } catch (e) {
    throw Exception('Не удалось обновить пользователя: $e');
  }
}

@riverpod
Future<void> deleteUser(Ref ref, int userId) async {
  final client = ref.read(serverpodClientProvider);
  
  try {
    await client.superAdmin.saDeleteUser(userId);
    
    // Обновляем список пользователей
    ref.invalidate(usersListProvider);
  } catch (e) {
    throw Exception('Не удалось удалить пользователя: $e');
  }
}

@riverpod
Future<void> blockUser(Ref ref, int userId, bool blocked) async {
  final client = ref.read(serverpodClientProvider);
  
  try {
    await client.superAdmin.saBlockUser(userId, blocked);
    
    // Обновляем список пользователей
    ref.invalidate(usersListProvider);
    ref.invalidate(userDetailsProvider(userId));
  } catch (e) {
    throw Exception('Не удалось ${blocked ? 'заблокировать' : 'разблокировать'} пользователя: $e');
  }
}