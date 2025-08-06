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
String _$serverpodUserInfoStreamHash() =>
    r'5395c3eca5b9842ae0d479a9154872a316176d17';

/// Конкретная реализация стрима аутентификации для Serverpod.
/// Этот провайдер будет использоваться для переопределения (override)
/// абстрактного провайдера из app_core.
///
/// Copied from [serverpodUserInfoStream].
@ProviderFor(serverpodUserInfoStream)
final serverpodUserInfoStreamProvider =
    AutoDisposeStreamProvider<UserInfoEntity?>.internal(
      serverpodUserInfoStream,
      name: r'serverpodUserInfoStreamProvider',
      debugGetCreateSourceHash:
          const bool.fromEnvironment('dart.vm.product')
              ? null
              : _$serverpodUserInfoStreamHash,
      dependencies: null,
      allTransitiveDependencies: null,
    );

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef ServerpodUserInfoStreamRef =
    AutoDisposeStreamProviderRef<UserInfoEntity?>;
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
String _$serverpodCurrentCustomerIdHash() =>
    r'48bc27408427c273e69d2c6251338d9f48120565';

/// See also [serverpodCurrentCustomerId].
@ProviderFor(serverpodCurrentCustomerId)
final serverpodCurrentCustomerIdProvider =
    AutoDisposeProvider<String?>.internal(
      serverpodCurrentCustomerId,
      name: r'serverpodCurrentCustomerIdProvider',
      debugGetCreateSourceHash:
          const bool.fromEnvironment('dart.vm.product')
              ? null
              : _$serverpodCurrentCustomerIdHash,
      dependencies: null,
      allTransitiveDependencies: null,
    );

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef ServerpodCurrentCustomerIdRef = AutoDisposeProviderRef<String?>;
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
    r'07717d304c8645be1c8fe61c0a071c7d0112f967';

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
