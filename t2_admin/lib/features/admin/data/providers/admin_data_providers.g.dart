// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'admin_data_providers.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$adminRepositoryHash() => r'60acbcd6f3398798e6e561bfa3a2cceef0311fdb';

/// Провайдер-переключатель.
/// В зависимости от ID пользователя, предоставляет либо [SuperAdminRepository],
/// либо [AdminRepository].
///
/// Copied from [adminRepository].
@ProviderFor(adminRepository)
final adminRepositoryProvider = Provider<IAdminRepository>.internal(
  adminRepository,
  name: r'adminRepositoryProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product')
          ? null
          : _$adminRepositoryHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef AdminRepositoryRef = ProviderRef<IAdminRepository>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
