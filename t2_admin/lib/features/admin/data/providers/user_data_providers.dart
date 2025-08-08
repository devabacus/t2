// lib/features/admin/data/providers/user_data_providers.dart

import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:t2_admin/core/providers/serverpod_client_provider.dart';
import '../../domain/repositories/i_user_repository.dart';
import '../../domain/repositories/user_repository.dart';

part 'user_data_providers.g.dart';

@Riverpod(keepAlive: true)
IUserRepository userRepository(UserRepositoryRef ref) {
  final client = ref.watch(serverpodClientProvider);
  return UserRepository(client);
}