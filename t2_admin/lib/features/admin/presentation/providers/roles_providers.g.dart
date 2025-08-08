// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'roles_providers.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$rolesListHash() => r'1d51c96cd1155cfaa5a72f3f333e3ec549272336';

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
String _$permissionsListHash() => r'5334418daccce01347e273ab4de3a3a810d8a148';

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
String _$createRoleHash() => r'1649f3c3a7fed173755fb49e4f2807861b1920aa';

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

String _$updateRoleHash() => r'cd8042c467166a3f4c7309e1da781f0ca3305304';

/// See also [updateRole].
@ProviderFor(updateRole)
const updateRoleProvider = UpdateRoleFamily();

/// See also [updateRole].
class UpdateRoleFamily extends Family<AsyncValue<void>> {
  /// See also [updateRole].
  const UpdateRoleFamily();

  /// See also [updateRole].
  UpdateRoleProvider call({
    required String roleId,
    required String roleName,
    required String? roleDescription,
    required List<String> permissionIds,
    required String customerId,
  }) {
    return UpdateRoleProvider(
      roleId: roleId,
      roleName: roleName,
      roleDescription: roleDescription,
      permissionIds: permissionIds,
      customerId: customerId,
    );
  }

  @override
  UpdateRoleProvider getProviderOverride(
    covariant UpdateRoleProvider provider,
  ) {
    return call(
      roleId: provider.roleId,
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
  String? get name => r'updateRoleProvider';
}

/// See also [updateRole].
class UpdateRoleProvider extends AutoDisposeFutureProvider<void> {
  /// See also [updateRole].
  UpdateRoleProvider({
    required String roleId,
    required String roleName,
    required String? roleDescription,
    required List<String> permissionIds,
    required String customerId,
  }) : this._internal(
         (ref) => updateRole(
           ref as UpdateRoleRef,
           roleId: roleId,
           roleName: roleName,
           roleDescription: roleDescription,
           permissionIds: permissionIds,
           customerId: customerId,
         ),
         from: updateRoleProvider,
         name: r'updateRoleProvider',
         debugGetCreateSourceHash:
             const bool.fromEnvironment('dart.vm.product')
                 ? null
                 : _$updateRoleHash,
         dependencies: UpdateRoleFamily._dependencies,
         allTransitiveDependencies: UpdateRoleFamily._allTransitiveDependencies,
         roleId: roleId,
         roleName: roleName,
         roleDescription: roleDescription,
         permissionIds: permissionIds,
         customerId: customerId,
       );

  UpdateRoleProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.roleId,
    required this.roleName,
    required this.roleDescription,
    required this.permissionIds,
    required this.customerId,
  }) : super.internal();

  final String roleId;
  final String roleName;
  final String? roleDescription;
  final List<String> permissionIds;
  final String customerId;

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
        roleId: roleId,
        roleName: roleName,
        roleDescription: roleDescription,
        permissionIds: permissionIds,
        customerId: customerId,
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
        other.roleId == roleId &&
        other.roleName == roleName &&
        other.roleDescription == roleDescription &&
        other.permissionIds == permissionIds &&
        other.customerId == customerId;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, roleId.hashCode);
    hash = _SystemHash.combine(hash, roleName.hashCode);
    hash = _SystemHash.combine(hash, roleDescription.hashCode);
    hash = _SystemHash.combine(hash, permissionIds.hashCode);
    hash = _SystemHash.combine(hash, customerId.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin UpdateRoleRef on AutoDisposeFutureProviderRef<void> {
  /// The parameter `roleId` of this provider.
  String get roleId;

  /// The parameter `roleName` of this provider.
  String get roleName;

  /// The parameter `roleDescription` of this provider.
  String? get roleDescription;

  /// The parameter `permissionIds` of this provider.
  List<String> get permissionIds;

  /// The parameter `customerId` of this provider.
  String get customerId;
}

class _UpdateRoleProviderElement extends AutoDisposeFutureProviderElement<void>
    with UpdateRoleRef {
  _UpdateRoleProviderElement(super.provider);

  @override
  String get roleId => (origin as UpdateRoleProvider).roleId;
  @override
  String get roleName => (origin as UpdateRoleProvider).roleName;
  @override
  String? get roleDescription => (origin as UpdateRoleProvider).roleDescription;
  @override
  List<String> get permissionIds =>
      (origin as UpdateRoleProvider).permissionIds;
  @override
  String get customerId => (origin as UpdateRoleProvider).customerId;
}

String _$deleteRoleHash() => r'82d19cd644ee0b37239d8c221d17598245f6353a';

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

// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
