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
class CreateUserUseCase extends _$CreateUserUseCase {
  @override
  FutureOr<void> build() {
    return null;
  }

  Future<void> call({
    required String userName,
    required String email,
    required String password,
    required String roleId,
  }) async {
    state = const AsyncLoading();
    
    try {
      final client = ref.read(serverpodClientProvider);
      
      // Преобразуем строку roleId в UuidValue
      final roleUuid = UuidValue.fromString(roleId);
      
      // Используем super admin endpoint для создания пользователя
      await client.superAdmin.saCreateUser(
        userName: userName,
        email: email,
        password: password,
        customerId: UuidValue.fromString('00000000-0000-0000-0000-000000000000'), // TODO: получать из контекста
        roleId: roleUuid,
      );
      
      // Обновляем список пользователей после создания
      ref.invalidate(usersListProvider);
      
      state = const AsyncData(null);
    } catch (e) {
      state = AsyncError(e, StackTrace.current);
      rethrow;
    }
  }
}