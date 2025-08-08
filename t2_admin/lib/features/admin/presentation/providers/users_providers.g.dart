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
String _$createUserUseCaseHash() => r'5996093d3492e7cec2e0a3a2edfc7c766fe9aec2';

/// See also [CreateUserUseCase].
@ProviderFor(CreateUserUseCase)
final createUserUseCaseProvider =
    AutoDisposeAsyncNotifierProvider<CreateUserUseCase, void>.internal(
      CreateUserUseCase.new,
      name: r'createUserUseCaseProvider',
      debugGetCreateSourceHash:
          const bool.fromEnvironment('dart.vm.product')
              ? null
              : _$createUserUseCaseHash,
      dependencies: null,
      allTransitiveDependencies: null,
    );

typedef _$CreateUserUseCase = AutoDisposeAsyncNotifier<void>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
