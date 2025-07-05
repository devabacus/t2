// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'task_get_by_id_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$getTaskByIdHash() => r'490ab990391113d9c4110bebfa6b1dd53b436349';

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

/// See also [getTaskById].
@ProviderFor(getTaskById)
const getTaskByIdProvider = GetTaskByIdFamily();

/// See also [getTaskById].
class GetTaskByIdFamily extends Family<AsyncValue<TaskEntity?>> {
  /// See also [getTaskById].
  const GetTaskByIdFamily();

  /// See also [getTaskById].
  GetTaskByIdProvider call(String id) {
    return GetTaskByIdProvider(id);
  }

  @override
  GetTaskByIdProvider getProviderOverride(
    covariant GetTaskByIdProvider provider,
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
  String? get name => r'getTaskByIdProvider';
}

/// See also [getTaskById].
class GetTaskByIdProvider extends AutoDisposeFutureProvider<TaskEntity?> {
  /// See also [getTaskById].
  GetTaskByIdProvider(String id)
    : this._internal(
        (ref) => getTaskById(ref as GetTaskByIdRef, id),
        from: getTaskByIdProvider,
        name: r'getTaskByIdProvider',
        debugGetCreateSourceHash:
            const bool.fromEnvironment('dart.vm.product')
                ? null
                : _$getTaskByIdHash,
        dependencies: GetTaskByIdFamily._dependencies,
        allTransitiveDependencies: GetTaskByIdFamily._allTransitiveDependencies,
        id: id,
      );

  GetTaskByIdProvider._internal(
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
    FutureOr<TaskEntity?> Function(GetTaskByIdRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: GetTaskByIdProvider._internal(
        (ref) => create(ref as GetTaskByIdRef),
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
  AutoDisposeFutureProviderElement<TaskEntity?> createElement() {
    return _GetTaskByIdProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is GetTaskByIdProvider && other.id == id;
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
mixin GetTaskByIdRef on AutoDisposeFutureProviderRef<TaskEntity?> {
  /// The parameter `id` of this provider.
  String get id;
}

class _GetTaskByIdProviderElement
    extends AutoDisposeFutureProviderElement<TaskEntity?>
    with GetTaskByIdRef {
  _GetTaskByIdProviderElement(super.provider);

  @override
  String get id => (origin as GetTaskByIdProvider).id;
}

// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
