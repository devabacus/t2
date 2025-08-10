// lib/features/admin/data/repositories/role_repository.dart

import 'package:serverpod_auth_client/serverpod_auth_client.dart';
import 'package:t2_client/t2_client.dart';
import '../../domain/repositories/i_role_repository.dart';

class RoleRepository implements IRoleRepository {
  final Client _client;
  final UserInfo? _currentUser;

  RoleRepository(this._client, this._currentUser);

  bool get _isSuperAdmin => _currentUser?.id == 1;

  @override
  Future<List<Role>> getRoles() async {
    // ✨ УСЛОВНАЯ ЛОГИКА ✨
    if (_isSuperAdmin) {
      return await _client.superAdmin.saListAllRoles();
    } else {
      // Обычный админ получает роли своей организации через admin_endpoint
      return await _client.admin.listRoles(); // ИСПОЛЬЗУЕМ ПРАВИЛЬНЫЙ ЭНДПОИНТ
    }
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