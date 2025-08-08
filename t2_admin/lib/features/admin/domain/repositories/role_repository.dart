// lib/features/admin/data/repositories/role_repository.dart

import 'package:t2_client/t2_client.dart';
import '../../domain/repositories/i_role_repository.dart';

class RoleRepository implements IRoleRepository {
  final Client _client;

  RoleRepository(this._client);

  @override
  Future<List<Role>> getRoles() async {
    return await _client.superAdmin.saListAllRoles();
  }

  @override
  Future<List<Permission>> getPermissions() async {
    return await _client.superAdmin.saListAllPermissions();
  }

  @override
  Future<RoleDetails?> getRoleDetails(String roleId) async {
    return await _client.superAdmin.saGetRoleDetails(UuidValue.fromString(roleId));
  }

  @override
  Future<void> createRole({
    required String roleName,
    required String? roleDescription,
    required List<String> permissionIds,
    required String customerId,
  }) async {
    final role = Role(
      customerId: UuidValue.fromString(customerId),
      name: roleName,
      description: roleDescription,
      createdAt: DateTime.now(),
    );
    final permissionUuids = permissionIds.map((id) => UuidValue.fromString(id)).toList();
    
    await _client.superAdmin.saCreateOrUpdateRole(
      role: role,
      permissionIds: permissionUuids,
    );
  }

  @override
  Future<void> updateRole({
    required Role role,
    required List<String> permissionIds,
  }) async {
    final permissionUuids = permissionIds.map((id) => UuidValue.fromString(id)).toList();
    await _client.superAdmin.saCreateOrUpdateRole(
      role: role,
      permissionIds: permissionUuids,
    );
  }

  @override
  Future<void> deleteRole(String roleId) async {
    await _client.superAdmin.saDeleteRole(UuidValue.fromString(roleId));
  }
}