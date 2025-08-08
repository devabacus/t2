// lib/features/admin/domain/repositories/i_role_repository.dart

import 'package:t2_client/t2_client.dart';

abstract class IRoleRepository {
  Future<List<Role>> getRoles();
  Future<List<Permission>> getPermissions();
  Future<RoleDetails?> getRoleDetails(String roleId);
  Future<void> createRole({
    required String roleName,
    required String? roleDescription,
    required List<String> permissionIds,
    required String customerId,
  });
  Future<void> updateRole({
    required Role role,
    required List<String> permissionIds,
  });
  Future<void> deleteRole(String roleId);
}