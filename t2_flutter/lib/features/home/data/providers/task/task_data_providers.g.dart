// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'task_data_providers.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$taskDaoHash() => r'1a599230984fa7a5a8842129f9af3776d913324a';

/// See also [taskDao].
@ProviderFor(taskDao)
final taskDaoProvider = AutoDisposeProvider<TaskDao>.internal(
  taskDao,
  name: r'taskDaoProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$taskDaoHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef TaskDaoRef = AutoDisposeProviderRef<TaskDao>;
String _$taskLocalDataSourceHash() =>
    r'72d225bc8ecdb603bee4a10a79a6a3c7ddd07dd6';

/// See also [taskLocalDataSource].
@ProviderFor(taskLocalDataSource)
final taskLocalDataSourceProvider =
    AutoDisposeProvider<ITaskLocalDataSource>.internal(
      taskLocalDataSource,
      name: r'taskLocalDataSourceProvider',
      debugGetCreateSourceHash:
          const bool.fromEnvironment('dart.vm.product')
              ? null
              : _$taskLocalDataSourceHash,
      dependencies: null,
      allTransitiveDependencies: null,
    );

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef TaskLocalDataSourceRef = AutoDisposeProviderRef<ITaskLocalDataSource>;
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
String _$taskRepositoryHash() => r'544f9447f4ddb3eb8c9dd2491575ab1e8295ee17';

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
/// Каждый userId получает свой изолированный экземпляр репозитория
///
/// Copied from [taskRepository].
@ProviderFor(taskRepository)
const taskRepositoryProvider = TaskRepositoryFamily();

/// Семейный провайдер репозитория для конкретного пользователя
/// Каждый userId получает свой изолированный экземпляр репозитория
///
/// Copied from [taskRepository].
class TaskRepositoryFamily extends Family<ITaskRepository> {
  /// Семейный провайдер репозитория для конкретного пользователя
  /// Каждый userId получает свой изолированный экземпляр репозитория
  ///
  /// Copied from [taskRepository].
  const TaskRepositoryFamily();

  /// Семейный провайдер репозитория для конкретного пользователя
  /// Каждый userId получает свой изолированный экземпляр репозитория
  ///
  /// Copied from [taskRepository].
  TaskRepositoryProvider call({
    required int userId,
    required String customerId,
  }) {
    return TaskRepositoryProvider(userId: userId, customerId: customerId);
  }

  @override
  TaskRepositoryProvider getProviderOverride(
    covariant TaskRepositoryProvider provider,
  ) {
    return call(userId: provider.userId, customerId: provider.customerId);
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'taskRepositoryProvider';
}

/// Семейный провайдер репозитория для конкретного пользователя
/// Каждый userId получает свой изолированный экземпляр репозитория
///
/// Copied from [taskRepository].
class TaskRepositoryProvider extends AutoDisposeProvider<ITaskRepository> {
  /// Семейный провайдер репозитория для конкретного пользователя
  /// Каждый userId получает свой изолированный экземпляр репозитория
  ///
  /// Copied from [taskRepository].
  TaskRepositoryProvider({required int userId, required String customerId})
    : this._internal(
        (ref) => taskRepository(
          ref as TaskRepositoryRef,
          userId: userId,
          customerId: customerId,
        ),
        from: taskRepositoryProvider,
        name: r'taskRepositoryProvider',
        debugGetCreateSourceHash:
            const bool.fromEnvironment('dart.vm.product')
                ? null
                : _$taskRepositoryHash,
        dependencies: TaskRepositoryFamily._dependencies,
        allTransitiveDependencies:
            TaskRepositoryFamily._allTransitiveDependencies,
        userId: userId,
        customerId: customerId,
      );

  TaskRepositoryProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.userId,
    required this.customerId,
  }) : super.internal();

  final int userId;
  final String customerId;

  @override
  Override overrideWith(
    ITaskRepository Function(TaskRepositoryRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: TaskRepositoryProvider._internal(
        (ref) => create(ref as TaskRepositoryRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        userId: userId,
        customerId: customerId,
      ),
    );
  }

  @override
  AutoDisposeProviderElement<ITaskRepository> createElement() {
    return _TaskRepositoryProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is TaskRepositoryProvider &&
        other.userId == userId &&
        other.customerId == customerId;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, userId.hashCode);
    hash = _SystemHash.combine(hash, customerId.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin TaskRepositoryRef on AutoDisposeProviderRef<ITaskRepository> {
  /// The parameter `userId` of this provider.
  int get userId;

  /// The parameter `customerId` of this provider.
  String get customerId;
}

class _TaskRepositoryProviderElement
    extends AutoDisposeProviderElement<ITaskRepository>
    with TaskRepositoryRef {
  _TaskRepositoryProviderElement(super.provider);

  @override
  int get userId => (origin as TaskRepositoryProvider).userId;
  @override
  String get customerId => (origin as TaskRepositoryProvider).customerId;
}

String _$currentUserTaskRepositoryHash() =>
    r'ed01d1bcf4bdbc5320a1999bbc4d92e14ee4cffc';

/// Удобный провайдер для получения репозитория текущего пользователя
/// Автоматически следит за сменой пользователя и предоставляет соответствующий репозиторий
///
/// Copied from [currentUserTaskRepository].
@ProviderFor(currentUserTaskRepository)
final currentUserTaskRepositoryProvider =
    AutoDisposeProvider<ITaskRepository?>.internal(
      currentUserTaskRepository,
      name: r'currentUserTaskRepositoryProvider',
      debugGetCreateSourceHash:
          const bool.fromEnvironment('dart.vm.product')
              ? null
              : _$currentUserTaskRepositoryHash,
      dependencies: null,
      allTransitiveDependencies: null,
    );

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef CurrentUserTaskRepositoryRef = AutoDisposeProviderRef<ITaskRepository?>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
