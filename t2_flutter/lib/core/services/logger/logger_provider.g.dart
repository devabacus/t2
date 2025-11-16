// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'logger_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$talkerHash() => r'980ff56d6c048dd47df804c111f198707a650141';

/// Провайдер для экземпляра Talker.
/// Он нужен, чтобы TalkerScreen мог получить к нему доступ.
///
/// Copied from [talker].
@ProviderFor(talker)
final talkerProvider = AutoDisposeProvider<Talker>.internal(
  talker,
  name: r'talkerProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$talkerHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef TalkerRef = AutoDisposeProviderRef<Talker>;
String _$loggerServiceHash() => r'd2468257ef12bff8f2ab7e7eff877ecf2ac7ad25';

/// Провайдер для нашего абстрактного сервиса логирования.
///
/// Copied from [loggerService].
@ProviderFor(loggerService)
final loggerServiceProvider = AutoDisposeProvider<LoggerService>.internal(
  loggerService,
  name: r'loggerServiceProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product')
          ? null
          : _$loggerServiceHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef LoggerServiceRef = AutoDisposeProviderRef<LoggerService>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
