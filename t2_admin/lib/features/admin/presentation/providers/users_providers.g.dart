// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'users_providers.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$usersListHash() => r'8b4383c8887f421e6ea7e22c498ee7ee34b3e8d3';

/// See also [usersList].
@ProviderFor(usersList)
final usersListProvider = AutoDisposeFutureProvider<List<UserDetails>>.internal(
  usersList,
  name: r'usersListProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$usersListHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef UsersListRef = AutoDisposeFutureProviderRef<List<UserDetails>>;
String _$customersListHash() => r'1b53ccf37743d35e9bbc18c990872498d812df38';

/// See also [customersList].
@ProviderFor(customersList)
final customersListProvider =
    AutoDisposeFutureProvider<List<Customer>>.internal(
      customersList,
      name: r'customersListProvider',
      debugGetCreateSourceHash:
          const bool.fromEnvironment('dart.vm.product')
              ? null
              : _$customersListHash,
      dependencies: null,
      allTransitiveDependencies: null,
    );

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef CustomersListRef = AutoDisposeFutureProviderRef<List<Customer>>;
String _$createUserHash() => r'0d94d661f6b824fc6e30c874eb8ebd4fd73e26fb';

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

/// See also [createUser].
@ProviderFor(createUser)
const createUserProvider = CreateUserFamily();

/// See also [createUser].
class CreateUserFamily extends Family<AsyncValue<void>> {
  /// See also [createUser].
  const CreateUserFamily();

  /// See also [createUser].
  CreateUserProvider call({
    required String userName,
    required String email,
    required String password,
    required String customerId,
    required String roleId,
  }) {
    return CreateUserProvider(
      userName: userName,
      email: email,
      password: password,
      customerId: customerId,
      roleId: roleId,
    );
  }

  @override
  CreateUserProvider getProviderOverride(
    covariant CreateUserProvider provider,
  ) {
    return call(
      userName: provider.userName,
      email: provider.email,
      password: provider.password,
      customerId: provider.customerId,
      roleId: provider.roleId,
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
  String? get name => r'createUserProvider';
}

/// See also [createUser].
class CreateUserProvider extends AutoDisposeFutureProvider<void> {
  /// See also [createUser].
  CreateUserProvider({
    required String userName,
    required String email,
    required String password,
    required String customerId,
    required String roleId,
  }) : this._internal(
         (ref) => createUser(
           ref as CreateUserRef,
           userName: userName,
           email: email,
           password: password,
           customerId: customerId,
           roleId: roleId,
         ),
         from: createUserProvider,
         name: r'createUserProvider',
         debugGetCreateSourceHash:
             const bool.fromEnvironment('dart.vm.product')
                 ? null
                 : _$createUserHash,
         dependencies: CreateUserFamily._dependencies,
         allTransitiveDependencies: CreateUserFamily._allTransitiveDependencies,
         userName: userName,
         email: email,
         password: password,
         customerId: customerId,
         roleId: roleId,
       );

  CreateUserProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.userName,
    required this.email,
    required this.password,
    required this.customerId,
    required this.roleId,
  }) : super.internal();

  final String userName;
  final String email;
  final String password;
  final String customerId;
  final String roleId;

  @override
  Override overrideWith(
    FutureOr<void> Function(CreateUserRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: CreateUserProvider._internal(
        (ref) => create(ref as CreateUserRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        userName: userName,
        email: email,
        password: password,
        customerId: customerId,
        roleId: roleId,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<void> createElement() {
    return _CreateUserProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is CreateUserProvider &&
        other.userName == userName &&
        other.email == email &&
        other.password == password &&
        other.customerId == customerId &&
        other.roleId == roleId;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, userName.hashCode);
    hash = _SystemHash.combine(hash, email.hashCode);
    hash = _SystemHash.combine(hash, password.hashCode);
    hash = _SystemHash.combine(hash, customerId.hashCode);
    hash = _SystemHash.combine(hash, roleId.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin CreateUserRef on AutoDisposeFutureProviderRef<void> {
  /// The parameter `userName` of this provider.
  String get userName;

  /// The parameter `email` of this provider.
  String get email;

  /// The parameter `password` of this provider.
  String get password;

  /// The parameter `customerId` of this provider.
  String get customerId;

  /// The parameter `roleId` of this provider.
  String get roleId;
}

class _CreateUserProviderElement extends AutoDisposeFutureProviderElement<void>
    with CreateUserRef {
  _CreateUserProviderElement(super.provider);

  @override
  String get userName => (origin as CreateUserProvider).userName;
  @override
  String get email => (origin as CreateUserProvider).email;
  @override
  String get password => (origin as CreateUserProvider).password;
  @override
  String get customerId => (origin as CreateUserProvider).customerId;
  @override
  String get roleId => (origin as CreateUserProvider).roleId;
}

String _$userDetailsHash() => r'1a4532260fbf5d8e52d6a5c16602d6cc32961e55';

/// See also [userDetails].
@ProviderFor(userDetails)
const userDetailsProvider = UserDetailsFamily();

/// See also [userDetails].
class UserDetailsFamily extends Family<AsyncValue<SuperUserDetails?>> {
  /// See also [userDetails].
  const UserDetailsFamily();

  /// See also [userDetails].
  UserDetailsProvider call(int userId) {
    return UserDetailsProvider(userId);
  }

  @override
  UserDetailsProvider getProviderOverride(
    covariant UserDetailsProvider provider,
  ) {
    return call(provider.userId);
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'userDetailsProvider';
}

/// See also [userDetails].
class UserDetailsProvider extends AutoDisposeFutureProvider<SuperUserDetails?> {
  /// See also [userDetails].
  UserDetailsProvider(int userId)
    : this._internal(
        (ref) => userDetails(ref as UserDetailsRef, userId),
        from: userDetailsProvider,
        name: r'userDetailsProvider',
        debugGetCreateSourceHash:
            const bool.fromEnvironment('dart.vm.product')
                ? null
                : _$userDetailsHash,
        dependencies: UserDetailsFamily._dependencies,
        allTransitiveDependencies: UserDetailsFamily._allTransitiveDependencies,
        userId: userId,
      );

  UserDetailsProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.userId,
  }) : super.internal();

  final int userId;

  @override
  Override overrideWith(
    FutureOr<SuperUserDetails?> Function(UserDetailsRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: UserDetailsProvider._internal(
        (ref) => create(ref as UserDetailsRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        userId: userId,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<SuperUserDetails?> createElement() {
    return _UserDetailsProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is UserDetailsProvider && other.userId == userId;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, userId.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin UserDetailsRef on AutoDisposeFutureProviderRef<SuperUserDetails?> {
  /// The parameter `userId` of this provider.
  int get userId;
}

class _UserDetailsProviderElement
    extends AutoDisposeFutureProviderElement<SuperUserDetails?>
    with UserDetailsRef {
  _UserDetailsProviderElement(super.provider);

  @override
  int get userId => (origin as UserDetailsProvider).userId;
}

String _$updateUserHash() => r'72b1ecb4fcfdbd9b90b93491ef00027263b85ebe';

/// See also [updateUser].
@ProviderFor(updateUser)
const updateUserProvider = UpdateUserFamily();

/// See also [updateUser].
class UpdateUserFamily extends Family<AsyncValue<void>> {
  /// See also [updateUser].
  const UpdateUserFamily();

  /// See also [updateUser].
  UpdateUserProvider call({
    required int userId,
    required String userName,
    required String email,
    required String customerId,
    required String roleId,
  }) {
    return UpdateUserProvider(
      userId: userId,
      userName: userName,
      email: email,
      customerId: customerId,
      roleId: roleId,
    );
  }

  @override
  UpdateUserProvider getProviderOverride(
    covariant UpdateUserProvider provider,
  ) {
    return call(
      userId: provider.userId,
      userName: provider.userName,
      email: provider.email,
      customerId: provider.customerId,
      roleId: provider.roleId,
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
  String? get name => r'updateUserProvider';
}

/// See also [updateUser].
class UpdateUserProvider extends AutoDisposeFutureProvider<void> {
  /// See also [updateUser].
  UpdateUserProvider({
    required int userId,
    required String userName,
    required String email,
    required String customerId,
    required String roleId,
  }) : this._internal(
         (ref) => updateUser(
           ref as UpdateUserRef,
           userId: userId,
           userName: userName,
           email: email,
           customerId: customerId,
           roleId: roleId,
         ),
         from: updateUserProvider,
         name: r'updateUserProvider',
         debugGetCreateSourceHash:
             const bool.fromEnvironment('dart.vm.product')
                 ? null
                 : _$updateUserHash,
         dependencies: UpdateUserFamily._dependencies,
         allTransitiveDependencies: UpdateUserFamily._allTransitiveDependencies,
         userId: userId,
         userName: userName,
         email: email,
         customerId: customerId,
         roleId: roleId,
       );

  UpdateUserProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.userId,
    required this.userName,
    required this.email,
    required this.customerId,
    required this.roleId,
  }) : super.internal();

  final int userId;
  final String userName;
  final String email;
  final String customerId;
  final String roleId;

  @override
  Override overrideWith(
    FutureOr<void> Function(UpdateUserRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: UpdateUserProvider._internal(
        (ref) => create(ref as UpdateUserRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        userId: userId,
        userName: userName,
        email: email,
        customerId: customerId,
        roleId: roleId,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<void> createElement() {
    return _UpdateUserProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is UpdateUserProvider &&
        other.userId == userId &&
        other.userName == userName &&
        other.email == email &&
        other.customerId == customerId &&
        other.roleId == roleId;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, userId.hashCode);
    hash = _SystemHash.combine(hash, userName.hashCode);
    hash = _SystemHash.combine(hash, email.hashCode);
    hash = _SystemHash.combine(hash, customerId.hashCode);
    hash = _SystemHash.combine(hash, roleId.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin UpdateUserRef on AutoDisposeFutureProviderRef<void> {
  /// The parameter `userId` of this provider.
  int get userId;

  /// The parameter `userName` of this provider.
  String get userName;

  /// The parameter `email` of this provider.
  String get email;

  /// The parameter `customerId` of this provider.
  String get customerId;

  /// The parameter `roleId` of this provider.
  String get roleId;
}

class _UpdateUserProviderElement extends AutoDisposeFutureProviderElement<void>
    with UpdateUserRef {
  _UpdateUserProviderElement(super.provider);

  @override
  int get userId => (origin as UpdateUserProvider).userId;
  @override
  String get userName => (origin as UpdateUserProvider).userName;
  @override
  String get email => (origin as UpdateUserProvider).email;
  @override
  String get customerId => (origin as UpdateUserProvider).customerId;
  @override
  String get roleId => (origin as UpdateUserProvider).roleId;
}

String _$deleteUserHash() => r'78364000cfb62270444e6e10a8f63660bca4744e';

/// See also [deleteUser].
@ProviderFor(deleteUser)
const deleteUserProvider = DeleteUserFamily();

/// See also [deleteUser].
class DeleteUserFamily extends Family<AsyncValue<void>> {
  /// See also [deleteUser].
  const DeleteUserFamily();

  /// See also [deleteUser].
  DeleteUserProvider call(int userId) {
    return DeleteUserProvider(userId);
  }

  @override
  DeleteUserProvider getProviderOverride(
    covariant DeleteUserProvider provider,
  ) {
    return call(provider.userId);
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'deleteUserProvider';
}

/// See also [deleteUser].
class DeleteUserProvider extends AutoDisposeFutureProvider<void> {
  /// See also [deleteUser].
  DeleteUserProvider(int userId)
    : this._internal(
        (ref) => deleteUser(ref as DeleteUserRef, userId),
        from: deleteUserProvider,
        name: r'deleteUserProvider',
        debugGetCreateSourceHash:
            const bool.fromEnvironment('dart.vm.product')
                ? null
                : _$deleteUserHash,
        dependencies: DeleteUserFamily._dependencies,
        allTransitiveDependencies: DeleteUserFamily._allTransitiveDependencies,
        userId: userId,
      );

  DeleteUserProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.userId,
  }) : super.internal();

  final int userId;

  @override
  Override overrideWith(
    FutureOr<void> Function(DeleteUserRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: DeleteUserProvider._internal(
        (ref) => create(ref as DeleteUserRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        userId: userId,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<void> createElement() {
    return _DeleteUserProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is DeleteUserProvider && other.userId == userId;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, userId.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin DeleteUserRef on AutoDisposeFutureProviderRef<void> {
  /// The parameter `userId` of this provider.
  int get userId;
}

class _DeleteUserProviderElement extends AutoDisposeFutureProviderElement<void>
    with DeleteUserRef {
  _DeleteUserProviderElement(super.provider);

  @override
  int get userId => (origin as DeleteUserProvider).userId;
}

String _$blockUserHash() => r'44d5c9c754abde1566013df6ff47fc24fc52d1c1';

/// See also [blockUser].
@ProviderFor(blockUser)
const blockUserProvider = BlockUserFamily();

/// See also [blockUser].
class BlockUserFamily extends Family<AsyncValue<void>> {
  /// See also [blockUser].
  const BlockUserFamily();

  /// See also [blockUser].
  BlockUserProvider call(int userId, bool blocked) {
    return BlockUserProvider(userId, blocked);
  }

  @override
  BlockUserProvider getProviderOverride(covariant BlockUserProvider provider) {
    return call(provider.userId, provider.blocked);
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'blockUserProvider';
}

/// See also [blockUser].
class BlockUserProvider extends AutoDisposeFutureProvider<void> {
  /// See also [blockUser].
  BlockUserProvider(int userId, bool blocked)
    : this._internal(
        (ref) => blockUser(ref as BlockUserRef, userId, blocked),
        from: blockUserProvider,
        name: r'blockUserProvider',
        debugGetCreateSourceHash:
            const bool.fromEnvironment('dart.vm.product')
                ? null
                : _$blockUserHash,
        dependencies: BlockUserFamily._dependencies,
        allTransitiveDependencies: BlockUserFamily._allTransitiveDependencies,
        userId: userId,
        blocked: blocked,
      );

  BlockUserProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.userId,
    required this.blocked,
  }) : super.internal();

  final int userId;
  final bool blocked;

  @override
  Override overrideWith(FutureOr<void> Function(BlockUserRef provider) create) {
    return ProviderOverride(
      origin: this,
      override: BlockUserProvider._internal(
        (ref) => create(ref as BlockUserRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        userId: userId,
        blocked: blocked,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<void> createElement() {
    return _BlockUserProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is BlockUserProvider &&
        other.userId == userId &&
        other.blocked == blocked;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, userId.hashCode);
    hash = _SystemHash.combine(hash, blocked.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin BlockUserRef on AutoDisposeFutureProviderRef<void> {
  /// The parameter `userId` of this provider.
  int get userId;

  /// The parameter `blocked` of this provider.
  bool get blocked;
}

class _BlockUserProviderElement extends AutoDisposeFutureProviderElement<void>
    with BlockUserRef {
  _BlockUserProviderElement(super.provider);

  @override
  int get userId => (origin as BlockUserProvider).userId;
  @override
  bool get blocked => (origin as BlockUserProvider).blocked;
}

// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
