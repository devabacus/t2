// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tag_get_by_id_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$getTagByIdHash() => r'b375ac761b65b400059cf422d15c9ebeebd72dc6';

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

/// See also [getTagById].
@ProviderFor(getTagById)
const getTagByIdProvider = GetTagByIdFamily();

/// See also [getTagById].
class GetTagByIdFamily extends Family<AsyncValue<TagEntity?>> {
  /// See also [getTagById].
  const GetTagByIdFamily();

  /// See also [getTagById].
  GetTagByIdProvider call(String id) {
    return GetTagByIdProvider(id);
  }

  @override
  GetTagByIdProvider getProviderOverride(
    covariant GetTagByIdProvider provider,
  ) {
    return call(provider.id);
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'getTagByIdProvider';
}

/// See also [getTagById].
class GetTagByIdProvider extends AutoDisposeFutureProvider<TagEntity?> {
  /// See also [getTagById].
  GetTagByIdProvider(String id)
    : this._internal(
        (ref) => getTagById(ref as GetTagByIdRef, id),
        from: getTagByIdProvider,
        name: r'getTagByIdProvider',
        debugGetCreateSourceHash:
            const bool.fromEnvironment('dart.vm.product')
                ? null
                : _$getTagByIdHash,
        dependencies: GetTagByIdFamily._dependencies,
        allTransitiveDependencies: GetTagByIdFamily._allTransitiveDependencies,
        id: id,
      );

  GetTagByIdProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.id,
  }) : super.internal();

  final String id;

  @override
  Override overrideWith(
    FutureOr<TagEntity?> Function(GetTagByIdRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: GetTagByIdProvider._internal(
        (ref) => create(ref as GetTagByIdRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        id: id,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<TagEntity?> createElement() {
    return _GetTagByIdProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is GetTagByIdProvider && other.id == id;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, id.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin GetTagByIdRef on AutoDisposeFutureProviderRef<TagEntity?> {
  /// The parameter `id` of this provider.
  String get id;
}

class _GetTagByIdProviderElement
    extends AutoDisposeFutureProviderElement<TagEntity?>
    with GetTagByIdRef {
  _GetTagByIdProviderElement(super.provider);

  @override
  String get id => (origin as GetTagByIdProvider).id;
}

// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
