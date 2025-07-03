// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'task_tag_map_data_providers.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$taskTagMapDaoHash() => r'0c7f5a2d501e44e25b285619ccef857f95394b7f';

/// See also [taskTagMapDao].
@ProviderFor(taskTagMapDao)
final taskTagMapDaoProvider = AutoDisposeProvider<TaskTagMapDao>.internal(
  taskTagMapDao,
  name: r'taskTagMapDaoProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product')
          ? null
          : _$taskTagMapDaoHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef TaskTagMapDaoRef = AutoDisposeProviderRef<TaskTagMapDao>;
String _$taskTagMapLocalDataSourceHash() =>
    r'838c8b41bf57b42891ff04dabda5e04b38c423f9';

/// See also [taskTagMapLocalDataSource].
@ProviderFor(taskTagMapLocalDataSource)
final taskTagMapLocalDataSourceProvider =
    AutoDisposeProvider<ITaskTagMapLocalDataSource>.internal(
      taskTagMapLocalDataSource,
      name: r'taskTagMapLocalDataSourceProvider',
      debugGetCreateSourceHash:
          const bool.fromEnvironment('dart.vm.product')
              ? null
              : _$taskTagMapLocalDataSourceHash,
      dependencies: null,
      allTransitiveDependencies: null,
    );

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef TaskTagMapLocalDataSourceRef =
    AutoDisposeProviderRef<ITaskTagMapLocalDataSource>;
String _$taskTagMapRemoteDataSourceHash() =>
    r'afd55b92bc9e8d182ab0ea54b3293f3969fb1a5d';

/// See also [taskTagMapRemoteDataSource].
@ProviderFor(taskTagMapRemoteDataSource)
final taskTagMapRemoteDataSourceProvider =
    AutoDisposeProvider<ITaskTagMapRemoteDataSource>.internal(
      taskTagMapRemoteDataSource,
      name: r'taskTagMapRemoteDataSourceProvider',
      debugGetCreateSourceHash:
          const bool.fromEnvironment('dart.vm.product')
              ? null
              : _$taskTagMapRemoteDataSourceHash,
      dependencies: null,
      allTransitiveDependencies: null,
    );

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef TaskTagMapRemoteDataSourceRef =
    AutoDisposeProviderRef<ITaskTagMapRemoteDataSource>;
String _$syncMetadataLocalDataSourceHash() =>
    r'8fe23dd3a0392e40a49b10c234daf3add7018260';

/// See also [syncMetadataLocalDataSource].
@ProviderFor(syncMetadataLocalDataSource)
final syncMetadataLocalDataSourceProvider =
    AutoDisposeProvider<ISyncMetadataLocalDataSource>.internal(
      syncMetadataLocalDataSource,
      name: r'syncMetadataLocalDataSourceProvider',
      debugGetCreateSourceHash:
          const bool.fromEnvironment('dart.vm.product')
              ? null
              : _$syncMetadataLocalDataSourceHash,
      dependencies: null,
      allTransitiveDependencies: null,
    );

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef SyncMetadataLocalDataSourceRef =
    AutoDisposeProviderRef<ISyncMetadataLocalDataSource>;
String _$syncMetadataDaoHash() => r'4875e7284109092e2c7f00057f7329e847c5dce2';

/// See also [syncMetadataDao].
@ProviderFor(syncMetadataDao)
final syncMetadataDaoProvider = AutoDisposeProvider<SyncMetadataDao>.internal(
  syncMetadataDao,
  name: r'syncMetadataDaoProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product')
          ? null
          : _$syncMetadataDaoHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef SyncMetadataDaoRef = AutoDisposeProviderRef<SyncMetadataDao>;
String _$taskTagMapRepositoryHash() =>
    r'10a4e1eaca8ebcefdb6b074d76e8a80ae023bddc';

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

/// Семейный провайдер репозитория для конкретного пользователя
///
/// Copied from [taskTagMapRepository].
@ProviderFor(taskTagMapRepository)
const taskTagMapRepositoryProvider = TaskTagMapRepositoryFamily();

/// Семейный провайдер репозитория для конкретного пользователя
///
/// Copied from [taskTagMapRepository].
class TaskTagMapRepositoryFamily extends Family<ITaskTagMapRepository> {
  /// Семейный провайдер репозитория для конкретного пользователя
  ///
  /// Copied from [taskTagMapRepository].
  const TaskTagMapRepositoryFamily();

  /// Семейный провайдер репозитория для конкретного пользователя
  ///
  /// Copied from [taskTagMapRepository].
  TaskTagMapRepositoryProvider call(int userId) {
    return TaskTagMapRepositoryProvider(userId);
  }

  @override
  TaskTagMapRepositoryProvider getProviderOverride(
    covariant TaskTagMapRepositoryProvider provider,
  ) {
    return call(provider.userId);
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'taskTagMapRepositoryProvider';
}

/// Семейный провайдер репозитория для конкретного пользователя
///
/// Copied from [taskTagMapRepository].
class TaskTagMapRepositoryProvider
    extends AutoDisposeProvider<ITaskTagMapRepository> {
  /// Семейный провайдер репозитория для конкретного пользователя
  ///
  /// Copied from [taskTagMapRepository].
  TaskTagMapRepositoryProvider(int userId)
    : this._internal(
        (ref) => taskTagMapRepository(ref as TaskTagMapRepositoryRef, userId),
        from: taskTagMapRepositoryProvider,
        name: r'taskTagMapRepositoryProvider',
        debugGetCreateSourceHash:
            const bool.fromEnvironment('dart.vm.product')
                ? null
                : _$taskTagMapRepositoryHash,
        dependencies: TaskTagMapRepositoryFamily._dependencies,
        allTransitiveDependencies:
            TaskTagMapRepositoryFamily._allTransitiveDependencies,
        userId: userId,
      );

  TaskTagMapRepositoryProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.userId,
  }) : super.internal();

  final int userId;

  @override
  Override overrideWith(
    ITaskTagMapRepository Function(TaskTagMapRepositoryRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: TaskTagMapRepositoryProvider._internal(
        (ref) => create(ref as TaskTagMapRepositoryRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        userId: userId,
      ),
    );
  }

  @override
  AutoDisposeProviderElement<ITaskTagMapRepository> createElement() {
    return _TaskTagMapRepositoryProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is TaskTagMapRepositoryProvider && other.userId == userId;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, userId.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin TaskTagMapRepositoryRef on AutoDisposeProviderRef<ITaskTagMapRepository> {
  /// The parameter `userId` of this provider.
  int get userId;
}

class _TaskTagMapRepositoryProviderElement
    extends AutoDisposeProviderElement<ITaskTagMapRepository>
    with TaskTagMapRepositoryRef {
  _TaskTagMapRepositoryProviderElement(super.provider);

  @override
  int get userId => (origin as TaskTagMapRepositoryProvider).userId;
}

String _$currentUserTaskTagMapRepositoryHash() =>
    r'83f5e540eaba26a055b99f652f79b37e200720f2';

/// See also [currentUserTaskTagMapRepository].
@ProviderFor(currentUserTaskTagMapRepository)
final currentUserTaskTagMapRepositoryProvider =
    AutoDisposeProvider<ITaskTagMapRepository?>.internal(
      currentUserTaskTagMapRepository,
      name: r'currentUserTaskTagMapRepositoryProvider',
      debugGetCreateSourceHash:
          const bool.fromEnvironment('dart.vm.product')
              ? null
              : _$currentUserTaskTagMapRepositoryHash,
      dependencies: null,
      allTransitiveDependencies: null,
    );

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef CurrentUserTaskTagMapRepositoryRef =
    AutoDisposeProviderRef<ITaskTagMapRepository?>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
