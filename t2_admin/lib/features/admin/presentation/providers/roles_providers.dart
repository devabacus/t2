// lib/features/admin/presentation/providers/roles_providers.dart

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:t2_client/t2_client.dart';
import '../../data/providers/role_data_providers.dart'; // <-- Новый импорт

part 'roles_providers.g.dart';

@riverpod
Future<List<Role>> rolesList(Ref ref) async {
  return ref.watch(roleRepositoryProvider).getRoles();
}

@riverpod
Future<List<Permission>> permissionsList(Ref ref) async {
  return ref.watch(roleRepositoryProvider).getPermissions();
}

@riverpod
Future<void> createRole(Ref ref, {
  required String roleName,
  required String? roleDescription,
  required List<String> permissionIds,
  required String customerId,
}) async {
  await ref.read(roleRepositoryProvider).createRole(
    roleName: roleName,
    roleDescription: roleDescription,
    permissionIds: permissionIds,
    customerId: customerId,
  );
  ref.invalidate(rolesListProvider);
}  

@riverpod
Future<void> deleteRole(Ref ref, String roleId) async {
  await ref.read(roleRepositoryProvider).deleteRole(roleId);
  ref.invalidate(rolesListProvider);
}

@riverpod
Future<RoleDetails?> roleDetails(Ref ref, String roleId) async {
  return ref.watch(roleRepositoryProvider).getRoleDetails(roleId);
}

@riverpod
Future<void> updateRole(Ref ref, {
  required Role role,
  required List<String> permissionIds,
}) async {
  await ref.read(roleRepositoryProvider).updateRole(
    role: role,
    permissionIds: permissionIds,
  );
  ref.invalidate(rolesListProvider);
  ref.invalidate(roleDetailsProvider(role.id.toString()));
}