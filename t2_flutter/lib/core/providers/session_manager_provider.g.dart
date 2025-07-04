// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'session_manager_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$sessionManagerHash() => r'b67e31ddb34c8cfdadb020f29be6df47947f230d';

/// See also [sessionManager].
@ProviderFor(sessionManager)
final sessionManagerProvider = AutoDisposeProvider<SessionManager>.internal(
  sessionManager,
  name: r'sessionManagerProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product')
          ? null
          : _$sessionManagerHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef SessionManagerRef = AutoDisposeProviderRef<SessionManager>;
String _$userInfoStreamHash() => r'688f3d558a2101af1ec4876f83da2569c766b421';

/// See also [userInfoStream].
@ProviderFor(userInfoStream)
final userInfoStreamProvider = AutoDisposeStreamProvider<UserInfo?>.internal(
  userInfoStream,
  name: r'userInfoStreamProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product')
          ? null
          : _$userInfoStreamHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef UserInfoStreamRef = AutoDisposeStreamProviderRef<UserInfo?>;
String _$currentUserHash() => r'a7754de5bf305b224c675a3f8016a175aba872a4';

/// See also [currentUser].
@ProviderFor(currentUser)
final currentUserProvider = AutoDisposeProvider<UserInfo?>.internal(
  currentUser,
  name: r'currentUserProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$currentUserHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef CurrentUserRef = AutoDisposeProviderRef<UserInfo?>;
String _$isAuthenticatedHash() => r'ec341d95b490bda54e8278477e26f7b345844931';

/// See also [isAuthenticated].
@ProviderFor(isAuthenticated)
final isAuthenticatedProvider = AutoDisposeProvider<bool>.internal(
  isAuthenticated,
  name: r'isAuthenticatedProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product')
          ? null
          : _$isAuthenticatedHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef IsAuthenticatedRef = AutoDisposeProviderRef<bool>;
String _$currentUserSessionDataHash() =>
    r'8e032fb35a8f1fa11fab490df8d7cf3467b3c6f5';

/// See also [currentUserSessionData].
@ProviderFor(currentUserSessionData)
final currentUserSessionDataProvider =
    AutoDisposeProvider<UserSessionData?>.internal(
      currentUserSessionData,
      name: r'currentUserSessionDataProvider',
      debugGetCreateSourceHash:
          const bool.fromEnvironment('dart.vm.product')
              ? null
              : _$currentUserSessionDataHash,
      dependencies: null,
      allTransitiveDependencies: null,
    );

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef CurrentUserSessionDataRef = AutoDisposeProviderRef<UserSessionData?>;
String _$currentCustomerIdHash() => r'5eba09eb73ab8adc7d6c10d7b397da5c5b4e86cf';

/// See also [currentCustomerId].
@ProviderFor(currentCustomerId)
final currentCustomerIdProvider = AutoDisposeProvider<UuidValue?>.internal(
  currentCustomerId,
  name: r'currentCustomerIdProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product')
          ? null
          : _$currentCustomerIdHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef CurrentCustomerIdRef = AutoDisposeProviderRef<UuidValue?>;
String _$currentRoleIdHash() => r'be77b5e33fdfd7e2c63b5b59ae6eeb9165cb66cb';

/// See also [currentRoleId].
@ProviderFor(currentRoleId)
final currentRoleIdProvider = AutoDisposeProvider<UuidValue?>.internal(
  currentRoleId,
  name: r'currentRoleIdProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product')
          ? null
          : _$currentRoleIdHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef CurrentRoleIdRef = AutoDisposeProviderRef<UuidValue?>;
String _$currentUserPermissionsHash() =>
    r'ac00626e88f02ad962dea23da2254643ee1477e3';

/// See also [currentUserPermissions].
@ProviderFor(currentUserPermissions)
final currentUserPermissionsProvider =
    AutoDisposeProvider<List<String>>.internal(
      currentUserPermissions,
      name: r'currentUserPermissionsProvider',
      debugGetCreateSourceHash:
          const bool.fromEnvironment('dart.vm.product')
              ? null
              : _$currentUserPermissionsHash,
      dependencies: null,
      allTransitiveDependencies: null,
    );

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef CurrentUserPermissionsRef = AutoDisposeProviderRef<List<String>>;
String _$userSessionDataNotifierHash() =>
    r'73ccf7897a0c9f612f19ea3bffbd3f53baa5dde3';

/// See also [UserSessionDataNotifier].
@ProviderFor(UserSessionDataNotifier)
final userSessionDataNotifierProvider = AutoDisposeNotifierProvider<
  UserSessionDataNotifier,
  UserSessionData?
>.internal(
  UserSessionDataNotifier.new,
  name: r'userSessionDataNotifierProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product')
          ? null
          : _$userSessionDataNotifierHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$UserSessionDataNotifier = AutoDisposeNotifier<UserSessionData?>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
