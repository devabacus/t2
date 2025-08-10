// lib/features/admin/data/providers/role_data_providers.dart

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:t2_admin/core/providers/serverpod_client_provider.dart';
import 'package:t2_admin/features/auth/presentation/providers/auth_state_providers.dart'; // <-- Добавьте импорт
import '../../domain/repositories/i_role_repository.dart';
import '../../domain/repositories/role_repository.dart';

part 'role_data_providers.g.dart';

@Riverpod(keepAlive: true)
IRoleRepository roleRepository(Ref ref) {
  final client = ref.watch(serverpodClientProvider);
  // Получаем информацию о текущем пользователе
  final userInfo = ref.watch(authStateChangesProvider).valueOrNull;
  // Передаем ее в конструктор
  return RoleRepository(client, userInfo);
}