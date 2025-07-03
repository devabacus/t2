// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'task_remote_data_providers.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$taskRemoteDataSourceHash() =>
    r'37fa4028a3ed32a90e22c0c20ac2aaf521c7e0b0';

/// See also [taskRemoteDataSource].
@ProviderFor(taskRemoteDataSource)
final taskRemoteDataSourceProvider =
    AutoDisposeProvider<ITaskRemoteDataSource>.internal(
      taskRemoteDataSource,
      name: r'taskRemoteDataSourceProvider',
      debugGetCreateSourceHash:
          const bool.fromEnvironment('dart.vm.product')
              ? null
              : _$taskRemoteDataSourceHash,
      dependencies: null,
      allTransitiveDependencies: null,
    );

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef TaskRemoteDataSourceRef = AutoDisposeProviderRef<ITaskRemoteDataSource>;
String _$taskRemoteConnectionCheckHash() =>
    r'58eea8b030094837b1ef1b68e77f355cbdca88f1';

/// See also [taskRemoteConnectionCheck].
@ProviderFor(taskRemoteConnectionCheck)
final taskRemoteConnectionCheckProvider =
    AutoDisposeFutureProvider<bool>.internal(
      taskRemoteConnectionCheck,
      name: r'taskRemoteConnectionCheckProvider',
      debugGetCreateSourceHash:
          const bool.fromEnvironment('dart.vm.product')
              ? null
              : _$taskRemoteConnectionCheckHash,
      dependencies: null,
      allTransitiveDependencies: null,
    );

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef TaskRemoteConnectionCheckRef = AutoDisposeFutureProviderRef<bool>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
