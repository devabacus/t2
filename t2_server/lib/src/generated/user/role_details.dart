/* AUTOMATICALLY GENERATED CODE DO NOT MODIFY */
/*   To generate run: "serverpod generate"    */

// ignore_for_file: implementation_imports
// ignore_for_file: library_private_types_in_public_api
// ignore_for_file: non_constant_identifier_names
// ignore_for_file: public_member_api_docs
// ignore_for_file: type_literal_in_constant_pattern
// ignore_for_file: use_super_parameters

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:serverpod/serverpod.dart' as _i1;
import '../user/role.dart' as _i2;

abstract class RoleDetails
    implements _i1.SerializableModel, _i1.ProtocolSerialization {
  RoleDetails._({
    required this.role,
    required this.permissionIds,
  });

  factory RoleDetails({
    required _i2.Role role,
    required List<_i1.UuidValue> permissionIds,
  }) = _RoleDetailsImpl;

  factory RoleDetails.fromJson(Map<String, dynamic> jsonSerialization) {
    return RoleDetails(
      role: _i2.Role.fromJson(
          (jsonSerialization['role'] as Map<String, dynamic>)),
      permissionIds: (jsonSerialization['permissionIds'] as List)
          .map((e) => _i1.UuidValueJsonExtension.fromJson(e))
          .toList(),
    );
  }

  _i2.Role role;

  List<_i1.UuidValue> permissionIds;

  /// Returns a shallow copy of this [RoleDetails]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  RoleDetails copyWith({
    _i2.Role? role,
    List<_i1.UuidValue>? permissionIds,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      'role': role.toJson(),
      'permissionIds': permissionIds.toJson(valueToJson: (v) => v.toJson()),
    };
  }

  @override
  Map<String, dynamic> toJsonForProtocol() {
    return {
      'role': role.toJsonForProtocol(),
      'permissionIds': permissionIds.toJson(valueToJson: (v) => v.toJson()),
    };
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _RoleDetailsImpl extends RoleDetails {
  _RoleDetailsImpl({
    required _i2.Role role,
    required List<_i1.UuidValue> permissionIds,
  }) : super._(
          role: role,
          permissionIds: permissionIds,
        );

  /// Returns a shallow copy of this [RoleDetails]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  RoleDetails copyWith({
    _i2.Role? role,
    List<_i1.UuidValue>? permissionIds,
  }) {
    return RoleDetails(
      role: role ?? this.role.copyWith(),
      permissionIds:
          permissionIds ?? this.permissionIds.map((e0) => e0).toList(),
    );
  }
}
