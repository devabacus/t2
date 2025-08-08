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
    return await client.superAdmin.saListAllRoles();
  } catch (e) {
    throw Exception('Не удалось загрузить список ролей: $e');
  }
}

@riverpod
Future<List<Permission>> permissionsList(Ref ref) async {
  final client = ref.read(serverpodClientProvider);
  try {
    return await client.superAdmin.saListAllPermissions();
  } catch (e) {
    throw Exception('Не удалось загрузить список разрешений: $e');
  }
}

@riverpod
Future<void> createRole(Ref ref, {
  required String roleName,
  required String? roleDescription,
  required List<String> permissionIds,
  required String customerId,
}) async {
  final client = ref.read(serverpodClientProvider);
  
  // Преобразуем строки в UuidValue
  final permissionUuids = permissionIds.map((id) => UuidValue.fromString(id)).toList();
  final customerUuid = UuidValue.fromString(customerId);
  
  // Создаем роль
  final role = Role(
    customerId: customerUuid,
    name: roleName,
    description: roleDescription,
    createdAt: DateTime.now(),
  );
  
  await client.superAdmin.saCreateOrUpdateRole(
    role: role,
    permissionIds: permissionUuids,
  );
  
  // Обновляем список ролей
  ref.invalidate(rolesListProvider);
}

@riverpod
Future<void> deleteRole(Ref ref, String roleId) async {
  final client = ref.read(serverpodClientProvider);
  
  final roleUuid = UuidValue.fromString(roleId);
  await client.superAdmin.saDeleteRole(roleUuid);
  
  // Обновляем список ролей
  ref.invalidate(rolesListProvider);
}