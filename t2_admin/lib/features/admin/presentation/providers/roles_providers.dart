// lib/features/admin/presentation/providers/roles_providers.dart

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:t2_client/t2_client.dart';
import '../../../../core/providers/serverpod_client_provider.dart';

part 'roles_providers.g.dart';

@riverpod
Future<List<Role>> rolesList(Ref ref) async {
  final client = ref.read(serverpodClientProvider);
  try {
    // Временно используем super admin endpoint для получения всех ролей
    return await client.superAdmin.saListAllRoles();
  } catch (e) {
    throw Exception('Не удалось загрузить список ролей: $e');
  }
}