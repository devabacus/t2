// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'task_tag_map_state_providers.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$relatedTagsForTaskHash() =>
    r'464a314d506886de2f9fb3622b03d806c605cff1';

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

abstract class _$RelatedTagsForTask
    extends BuildlessAutoDisposeAsyncNotifier<List<TagEntity>> {
  late final String taskId;

  FutureOr<List<TagEntity>> build(String taskId);
}

/// See also [RelatedTagsForTask].
@ProviderFor(RelatedTagsForTask)
const relatedTagsForTaskProvider = RelatedTagsForTaskFamily();

/// See also [RelatedTagsForTask].
class RelatedTagsForTaskFamily extends Family<AsyncValue<List<TagEntity>>> {
  /// See also [RelatedTagsForTask].
  const RelatedTagsForTaskFamily();

  /// See also [RelatedTagsForTask].
  RelatedTagsForTaskProvider call(String taskId) {
    return RelatedTagsForTaskProvider(taskId);
  }

  @override
  RelatedTagsForTaskProvider getProviderOverride(
    covariant RelatedTagsForTaskProvider provider,
  ) {
    return call(provider.taskId);
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'relatedTagsForTaskProvider';
}

/// See also [RelatedTagsForTask].
class RelatedTagsForTaskProvider
    extends
        AutoDisposeAsyncNotifierProviderImpl<
          RelatedTagsForTask,
          List<TagEntity>
        > {
  /// See also [RelatedTagsForTask].
  RelatedTagsForTaskProvider(String taskId)
    : this._internal(
        () => RelatedTagsForTask()..taskId = taskId,
        from: relatedTagsForTaskProvider,
        name: r'relatedTagsForTaskProvider',
        debugGetCreateSourceHash:
            const bool.fromEnvironment('dart.vm.product')
                ? null
                : _$relatedTagsForTaskHash,
        dependencies: RelatedTagsForTaskFamily._dependencies,
        allTransitiveDependencies:
            RelatedTagsForTaskFamily._allTransitiveDependencies,
        taskId: taskId,
      );

  RelatedTagsForTaskProvider._internal(
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
  FutureOr<List<TagEntity>> runNotifierBuild(
    covariant RelatedTagsForTask notifier,
  ) {
    return notifier.build(taskId);
  }

  @override
  Override overrideWith(RelatedTagsForTask Function() create) {
    return ProviderOverride(
      origin: this,
      override: RelatedTagsForTaskProvider._internal(
        () => create()..taskId = taskId,
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
  AutoDisposeAsyncNotifierProviderElement<RelatedTagsForTask, List<TagEntity>>
  createElement() {
    return _RelatedTagsForTaskProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is RelatedTagsForTaskProvider && other.taskId == taskId;
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
mixin RelatedTagsForTaskRef
    on AutoDisposeAsyncNotifierProviderRef<List<TagEntity>> {
  /// The parameter `taskId` of this provider.
  String get taskId;
}

class _RelatedTagsForTaskProviderElement
    extends
        AutoDisposeAsyncNotifierProviderElement<
          RelatedTagsForTask,
          List<TagEntity>
        >
    with RelatedTagsForTaskRef {
  _RelatedTagsForTaskProviderElement(super.provider);

  @override
  String get taskId => (origin as RelatedTagsForTaskProvider).taskId;
}

// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
