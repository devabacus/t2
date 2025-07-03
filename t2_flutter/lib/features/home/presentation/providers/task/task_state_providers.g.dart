// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'task_state_providers.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$tasksStreamHash() => r'b97dc89dd4e2cecf7d6576ee7c461e46db656d5e';

/// See also [tasksStream].
@ProviderFor(tasksStream)
final tasksStreamProvider =
    AutoDisposeStreamProvider<List<TaskEntity>>.internal(
      tasksStream,
      name: r'tasksStreamProvider',
      debugGetCreateSourceHash:
          const bool.fromEnvironment('dart.vm.product')
              ? null
              : _$tasksStreamHash,
      dependencies: null,
      allTransitiveDependencies: null,
    );

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef TasksStreamRef = AutoDisposeStreamProviderRef<List<TaskEntity>>;
String _$tasksHash() => r'2adaaae4bad77b5901aab70d6100b9d447393a06';

/// See also [Tasks].
@ProviderFor(Tasks)
final tasksProvider =
    AutoDisposeAsyncNotifierProvider<Tasks, List<TaskEntity>>.internal(
      Tasks.new,
      name: r'tasksProvider',
      debugGetCreateSourceHash:
          const bool.fromEnvironment('dart.vm.product') ? null : _$tasksHash,
      dependencies: null,
      allTransitiveDependencies: null,
    );

typedef _$Tasks = AutoDisposeAsyncNotifier<List<TaskEntity>>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
