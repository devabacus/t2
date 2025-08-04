// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'configuration_state_providers.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$configurationsStreamHash() =>
    r'1106e50c573ab9a095b4e8392428e46118f84640';

/// See also [configurationsStream].
@ProviderFor(configurationsStream)
final configurationsStreamProvider =
    AutoDisposeStreamProvider<List<ConfigurationEntity>>.internal(
      configurationsStream,
      name: r'configurationsStreamProvider',
      debugGetCreateSourceHash:
          const bool.fromEnvironment('dart.vm.product')
              ? null
              : _$configurationsStreamHash,
      dependencies: null,
      allTransitiveDependencies: null,
    );

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef ConfigurationsStreamRef =
    AutoDisposeStreamProviderRef<List<ConfigurationEntity>>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
