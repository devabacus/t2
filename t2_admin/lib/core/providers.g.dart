// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'providers.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$serverpodClientHash() => r'33533cfe14616c658de5c55b64cc598ebe67b462';

/// See also [serverpodClient].
@ProviderFor(serverpodClient)
final serverpodClientProvider = AutoDisposeProvider<Client>.internal(
  serverpodClient,
  name: r'serverpodClientProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product')
          ? null
          : _$serverpodClientHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef ServerpodClientRef = AutoDisposeProviderRef<Client>;
String _$sessionManagerHash() => r'3fe889fa47ec3e92959538a21129570172214411';

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
String _$authStateChangesHash() => r'17cb3fb9f6afb714ed96ef8898a779497de6dd6f';

/// See also [authStateChanges].
@ProviderFor(authStateChanges)
final authStateChangesProvider = AutoDisposeStreamProvider<UserInfo?>.internal(
  authStateChanges,
  name: r'authStateChangesProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product')
          ? null
          : _$authStateChangesHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef AuthStateChangesRef = AutoDisposeStreamProviderRef<UserInfo?>;
String _$userRoleHash() => r'dc99b36d9f3136056283e5dc97ef5f044166490f';

/// See also [userRole].
@ProviderFor(userRole)
final userRoleProvider = AutoDisposeFutureProvider<UserRole>.internal(
  userRole,
  name: r'userRoleProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$userRoleHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef UserRoleRef = AutoDisposeFutureProviderRef<UserRole>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
