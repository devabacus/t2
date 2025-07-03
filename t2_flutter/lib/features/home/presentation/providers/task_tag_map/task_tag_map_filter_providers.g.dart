// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'task_tag_map_filter_providers.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$unassignedTagsForTaskProviderHash() =>
    r'107c507be219b4c579bd803953dbebe7c55d7fb4';

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

/// See also [unassignedTagsForTaskProvider].
@ProviderFor(unassignedTagsForTaskProvider)
const unassignedTagsForTaskProviderProvider =
    UnassignedTagsForTaskProviderFamily();

/// See also [unassignedTagsForTaskProvider].
class UnassignedTagsForTaskProviderFamily
    extends Family<AsyncValue<List<TagEntity>>> {
  /// See also [unassignedTagsForTaskProvider].
  const UnassignedTagsForTaskProviderFamily();

  /// See also [unassignedTagsForTaskProvider].
  UnassignedTagsForTaskProviderProvider call({required String taskId}) {
    return UnassignedTagsForTaskProviderProvider(taskId: taskId);
  }

  @override
  UnassignedTagsForTaskProviderProvider getProviderOverride(
    covariant UnassignedTagsForTaskProviderProvider provider,
  ) {
    return call(taskId: provider.taskId);
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'unassignedTagsForTaskProviderProvider';
}

/// See also [unassignedTagsForTaskProvider].
class UnassignedTagsForTaskProviderProvider
    extends AutoDisposeFutureProvider<List<TagEntity>> {
  /// See also [unassignedTagsForTaskProvider].
  UnassignedTagsForTaskProviderProvider({required String taskId})
    : this._internal(
        (ref) => unassignedTagsForTaskProvider(
          ref as UnassignedTagsForTaskProviderRef,
          taskId: taskId,
        ),
        from: unassignedTagsForTaskProviderProvider,
        name: r'unassignedTagsForTaskProviderProvider',
        debugGetCreateSourceHash:
            const bool.fromEnvironment('dart.vm.product')
                ? null
                : _$unassignedTagsForTaskProviderHash,
        dependencies: UnassignedTagsForTaskProviderFamily._dependencies,
        allTransitiveDependencies:
            UnassignedTagsForTaskProviderFamily._allTransitiveDependencies,
        taskId: taskId,
      );

  UnassignedTagsForTaskProviderProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.taskId,
  }) : super.internal();

  final String taskId;

  @override
  Override overrideWith(
    FutureOr<List<TagEntity>> Function(
      UnassignedTagsForTaskProviderRef provider,
    )
    create,
  ) {
    return ProviderOverride(
      origin: this,
      override: UnassignedTagsForTaskProviderProvider._internal(
        (ref) => create(ref as UnassignedTagsForTaskProviderRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        taskId: taskId,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<List<TagEntity>> createElement() {
    return _UnassignedTagsForTaskProviderProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is UnassignedTagsForTaskProviderProvider &&
        other.taskId == taskId;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, taskId.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin UnassignedTagsForTaskProviderRef
    on AutoDisposeFutureProviderRef<List<TagEntity>> {
  /// The parameter `taskId` of this provider.
  String get taskId;
}

class _UnassignedTagsForTaskProviderProviderElement
    extends AutoDisposeFutureProviderElement<List<TagEntity>>
    with UnassignedTagsForTaskProviderRef {
  _UnassignedTagsForTaskProviderProviderElement(super.provider);

  @override
  String get taskId => (origin as UnassignedTagsForTaskProviderProvider).taskId;
}

// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
