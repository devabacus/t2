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
String _$currentCustomerIdHash() => r'cf23458d8b99f8801ba6db3d9136c1d4805549a2';

/// See also [currentCustomerId].
@ProviderFor(currentCustomerId)
final currentCustomerIdProvider = AutoDisposeProvider<String?>.internal(
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
typedef CurrentCustomerIdRef = AutoDisposeProviderRef<String?>;
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
    r'788caf152526e99cee4bbb0a28fb9911f98e608e';

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
