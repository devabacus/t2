// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tag_state_providers.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$tagsStreamHash() => r'aae5815c5ce4fd3d7ce5091b360dc66b0c6dd785';

/// See also [tagsStream].
@ProviderFor(tagsStream)
final tagsStreamProvider = AutoDisposeStreamProvider<List<TagEntity>>.internal(
  tagsStream,
  name: r'tagsStreamProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$tagsStreamHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef TagsStreamRef = AutoDisposeStreamProviderRef<List<TagEntity>>;
String _$tagsHash() => r'9ee96484ab60ebaedbc763dd187a4e3e4eca65f5';

/// See also [Tags].
@ProviderFor(Tags)
final tagsProvider =
    AutoDisposeAsyncNotifierProvider<Tags, List<TagEntity>>.internal(
      Tags.new,
      name: r'tagsProvider',
      debugGetCreateSourceHash:
          const bool.fromEnvironment('dart.vm.product') ? null : _$tagsHash,
      dependencies: null,
      allTransitiveDependencies: null,
    );

typedef _$Tags = AutoDisposeAsyncNotifier<List<TagEntity>>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
