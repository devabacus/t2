// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'users_providers.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$usersListHash() => r'9fbe1b42f7ef592236bb33fab9c19abd24d39e7a';

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
String _$customersListHash() => r'c1288792b7d9cf800ec11f89fcf428fd1babcc3a';

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
String _$createUserHash() => r'b7db5c93e1b02dc6db0e4611a5d88135767c0b42';

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

// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
