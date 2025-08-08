// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'users_providers.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$usersListHash() => r'62302fcf1522677047ed727f09ffc6fc0acaf5d4';

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
String _$createUserUseCaseHash() => r'876ff3fb0e9d95be9521368a3fdcec63be9882bb';

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
