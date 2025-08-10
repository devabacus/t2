// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'roles_providers.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$rolesListHash() => r'575c7c6022b6fbe2ce540cd27badce7d1081c1d7';

/// See also [rolesList].
@ProviderFor(rolesList)
final rolesListProvider = AutoDisposeFutureProvider<List<Role>>.internal(
  rolesList,
  name: r'rolesListProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$rolesListHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef RolesListRef = AutoDisposeFutureProviderRef<List<Role>>;
String _$permissionsListHash() => r'f49cfde02418374a262f0e77612da5a0a41c1a7c';

/// See also [permissionsList].
@ProviderFor(permissionsList)
final permissionsListProvider =
    AutoDisposeFutureProvider<List<Permission>>.internal(
      permissionsList,
      name: r'permissionsListProvider',
      debugGetCreateSourceHash:
          const bool.fromEnvironment('dart.vm.product')
              ? null
              : _$permissionsListHash,
      dependencies: null,
      allTransitiveDependencies: null,
    );

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef PermissionsListRef = AutoDisposeFutureProviderRef<List<Permission>>;
String _$createRoleHash() => r'2b61ff2729e5621ca0367a381789e1289ae6f893';

/// Copied from Dart SDK
class _SystemHash {
  _SystemHash._();

  static int combine(int hash, int value) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + value);
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x0007ffff & hash) << 10));
    return hash ^ (hash >> 6);
  }

  static int finish(int hash) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x03ffffff & hash) << 3));
    // ignore: parameter_assignments
    hash = hash ^ (hash >> 11);
    return 0x1fffffff & (hash + ((0x00003fff & hash) << 15));
  }
}

/// See also [createRole].
@ProviderFor(createRole)
const createRoleProvider = CreateRoleFamily();

/// See also [createRole].
class CreateRoleFamily extends Family<AsyncValue<void>> {
  /// See also [createRole].
  const CreateRoleFamily();

  /// See also [createRole].
  CreateRoleProvider call({
    required String roleName,
    required String? roleDescription,
    required List<String> permissionIds,
    required String customerId,
  }) {
    return CreateRoleProvider(
      roleName: roleName,
      roleDescription: roleDescription,
      permissionIds: permissionIds,
      customerId: customerId,
    );
  }

  @override
  CreateRoleProvider getProviderOverride(
    covariant CreateRoleProvider provider,
  ) {
    return call(
      roleName: provider.roleName,
      roleDescription: provider.roleDescription,
      permissionIds: provider.permissionIds,
      customerId: provider.customerId,
    );
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'createRoleProvider';
}

/// See also [createRole].
class CreateRoleProvider extends AutoDisposeFutureProvider<void> {
  /// See also [createRole].
  CreateRoleProvider({
    required String roleName,
    required String? roleDescription,
    required List<String> permissionIds,
    required String customerId,
  }) : this._internal(
         (ref) => createRole(
           ref as CreateRoleRef,
           roleName: roleName,
           roleDescription: roleDescription,
           permissionIds: permissionIds,
           customerId: customerId,
         ),
         from: createRoleProvider,
         name: r'createRoleProvider',
         debugGetCreateSourceHash:
             const bool.fromEnvironment('dart.vm.product')
                 ? null
                 : _$createRoleHash,
         dependencies: CreateRoleFamily._dependencies,
         allTransitiveDependencies: CreateRoleFamily._allTransitiveDependencies,
         roleName: roleName,
         roleDescription: roleDescription,
         permissionIds: permissionIds,
         customerId: customerId,
       );

  CreateRoleProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.roleName,
    required this.roleDescription,
    required this.permissionIds,
    required this.customerId,
  }) : super.internal();

  final String roleName;
  final String? roleDescription;
  final List<String> permissionIds;
  final String customerId;

  @override
  Override overrideWith(
    FutureOr<void> Function(CreateRoleRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: CreateRoleProvider._internal(
        (ref) => create(ref as CreateRoleRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        roleName: roleName,
        roleDescription: roleDescription,
        permissionIds: permissionIds,
        customerId: customerId,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<void> createElement() {
    return _CreateRoleProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is CreateRoleProvider &&
        other.roleName == roleName &&
        other.roleDescription == roleDescription &&
        other.permissionIds == permissionIds &&
        other.customerId == customerId;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, roleName.hashCode);
    hash = _SystemHash.combine(hash, roleDescription.hashCode);
    hash = _SystemHash.combine(hash, permissionIds.hashCode);
    hash = _SystemHash.combine(hash, customerId.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin CreateRoleRef on AutoDisposeFutureProviderRef<void> {
  /// The parameter `roleName` of this provider.
  String get roleName;

  /// The parameter `roleDescription` of this provider.
  String? get roleDescription;

  /// The parameter `permissionIds` of this provider.
  List<String> get permissionIds;

  /// The parameter `customerId` of this provider.
  String get customerId;
}

class _CreateRoleProviderElement extends AutoDisposeFutureProviderElement<void>
    with CreateRoleRef {
  _CreateRoleProviderElement(super.provider);

  @override
  String get roleName => (origin as CreateRoleProvider).roleName;
  @override
  String? get roleDescription => (origin as CreateRoleProvider).roleDescription;
  @override
  List<String> get permissionIds =>
      (origin as CreateRoleProvider).permissionIds;
  @override
  String get customerId => (origin as CreateRoleProvider).customerId;
}

String _$deleteRoleHash() => r'ed43ff0e6636a2e9ee24a60a0f69364ac3854023';

/// See also [deleteRole].
@ProviderFor(deleteRole)
const deleteRoleProvider = DeleteRoleFamily();

/// See also [deleteRole].
class DeleteRoleFamily extends Family<AsyncValue<void>> {
  /// See also [deleteRole].
  const DeleteRoleFamily();

  /// See also [deleteRole].
  DeleteRoleProvider call(String roleId) {
    return DeleteRoleProvider(roleId);
  }

  @override
  DeleteRoleProvider getProviderOverride(
    covariant DeleteRoleProvider provider,
  ) {
    return call(provider.roleId);
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'deleteRoleProvider';
}

/// See also [deleteRole].
class DeleteRoleProvider extends AutoDisposeFutureProvider<void> {
  /// See also [deleteRole].
  DeleteRoleProvider(String roleId)
    : this._internal(
        (ref) => deleteRole(ref as DeleteRoleRef, roleId),
        from: deleteRoleProvider,
        name: r'deleteRoleProvider',
        debugGetCreateSourceHash:
            const bool.fromEnvironment('dart.vm.product')
                ? null
                : _$deleteRoleHash,
        dependencies: DeleteRoleFamily._dependencies,
        allTransitiveDependencies: DeleteRoleFamily._allTransitiveDependencies,
        roleId: roleId,
      );

  DeleteRoleProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.roleId,
  }) : super.internal();

  final String roleId;

  @override
  Override overrideWith(
    FutureOr<void> Function(DeleteRoleRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: DeleteRoleProvider._internal(
        (ref) => create(ref as DeleteRoleRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        roleId: roleId,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<void> createElement() {
    return _DeleteRoleProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is DeleteRoleProvider && other.roleId == roleId;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, roleId.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin DeleteRoleRef on AutoDisposeFutureProviderRef<void> {
  /// The parameter `roleId` of this provider.
  String get roleId;
}

class _DeleteRoleProviderElement extends AutoDisposeFutureProviderElement<void>
    with DeleteRoleRef {
  _DeleteRoleProviderElement(super.provider);

  @override
  String get roleId => (origin as DeleteRoleProvider).roleId;
}

String _$roleDetailsHash() => r'2ce8ea4f45ea93832578a9c858731e40f2677510';

/// See also [roleDetails].
@ProviderFor(roleDetails)
const roleDetailsProvider = RoleDetailsFamily();

/// See also [roleDetails].
class RoleDetailsFamily extends Family<AsyncValue<RoleDetails?>> {
  /// See also [roleDetails].
  const RoleDetailsFamily();

  /// See also [roleDetails].
  RoleDetailsProvider call(String roleId) {
    return RoleDetailsProvider(roleId);
  }

  @override
  RoleDetailsProvider getProviderOverride(
    covariant RoleDetailsProvider provider,
  ) {
    return call(provider.roleId);
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'roleDetailsProvider';
}

/// See also [roleDetails].
class RoleDetailsProvider extends AutoDisposeFutureProvider<RoleDetails?> {
  /// See also [roleDetails].
  RoleDetailsProvider(String roleId)
    : this._internal(
        (ref) => roleDetails(ref as RoleDetailsRef, roleId),
        from: roleDetailsProvider,
        name: r'roleDetailsProvider',
        debugGetCreateSourceHash:
            const bool.fromEnvironment('dart.vm.product')
                ? null
                : _$roleDetailsHash,
        dependencies: RoleDetailsFamily._dependencies,
        allTransitiveDependencies: RoleDetailsFamily._allTransitiveDependencies,
        roleId: roleId,
      );

  RoleDetailsProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.roleId,
  }) : super.internal();

  final String roleId;

  @override
  Override overrideWith(
    FutureOr<RoleDetails?> Function(RoleDetailsRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: RoleDetailsProvider._internal(
        (ref) => create(ref as RoleDetailsRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        roleId: roleId,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<RoleDetails?> createElement() {
    return _RoleDetailsProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is RoleDetailsProvider && other.roleId == roleId;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, roleId.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin RoleDetailsRef on AutoDisposeFutureProviderRef<RoleDetails?> {
  /// The parameter `roleId` of this provider.
  String get roleId;
}

class _RoleDetailsProviderElement
    extends AutoDisposeFutureProviderElement<RoleDetails?>
    with RoleDetailsRef {
  _RoleDetailsProviderElement(super.provider);

  @override
  String get roleId => (origin as RoleDetailsProvider).roleId;
}

String _$updateRoleHash() => r'e8cbc1aaa24070f77e5ea7ed1273b249eb6b6f1d';

/// See also [updateRole].
@ProviderFor(updateRole)
const updateRoleProvider = UpdateRoleFamily();

/// See also [updateRole].
class UpdateRoleFamily extends Family<AsyncValue<void>> {
  /// See also [updateRole].
  const UpdateRoleFamily();

  /// See also [updateRole].
  UpdateRoleProvider call({
    required Role role,
    required List<String> permissionIds,
  }) {
    return UpdateRoleProvider(role: role, permissionIds: permissionIds);
  }

  @override
  UpdateRoleProvider getProviderOverride(
    covariant UpdateRoleProvider provider,
  ) {
    return call(role: provider.role, permissionIds: provider.permissionIds);
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'updateRoleProvider';
}

/// See also [updateRole].
class UpdateRoleProvider extends AutoDisposeFutureProvider<void> {
  /// See also [updateRole].
  UpdateRoleProvider({required Role role, required List<String> permissionIds})
    : this._internal(
        (ref) => updateRole(
          ref as UpdateRoleRef,
          role: role,
          permissionIds: permissionIds,
        ),
        from: updateRoleProvider,
        name: r'updateRoleProvider',
        debugGetCreateSourceHash:
            const bool.fromEnvironment('dart.vm.product')
                ? null
                : _$updateRoleHash,
        dependencies: UpdateRoleFamily._dependencies,
        allTransitiveDependencies: UpdateRoleFamily._allTransitiveDependencies,
        role: role,
        permissionIds: permissionIds,
      );

  UpdateRoleProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.role,
    required this.permissionIds,
  }) : super.internal();

  final Role role;
  final List<String> permissionIds;

  @override
  Override overrideWith(
    FutureOr<void> Function(UpdateRoleRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: UpdateRoleProvider._internal(
        (ref) => create(ref as UpdateRoleRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        role: role,
        permissionIds: permissionIds,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<void> createElement() {
    return _UpdateRoleProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is UpdateRoleProvider &&
        other.role == role &&
        other.permissionIds == permissionIds;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, role.hashCode);
    hash = _SystemHash.combine(hash, permissionIds.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin UpdateRoleRef on AutoDisposeFutureProviderRef<void> {
  /// The parameter `role` of this provider.
  Role get role;

  /// The parameter `permissionIds` of this provider.
  List<String> get permissionIds;
}

class _UpdateRoleProviderElement extends AutoDisposeFutureProviderElement<void>
    with UpdateRoleRef {
  _UpdateRoleProviderElement(super.provider);

  @override
  Role get role => (origin as UpdateRoleProvider).role;
  @override
  List<String> get permissionIds =>
      (origin as UpdateRoleProvider).permissionIds;
}

// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
