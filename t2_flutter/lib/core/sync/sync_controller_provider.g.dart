// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sync_controller_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$syncControllerHash() => r'9e5c114120b2481a1010c9a0c909f65550368b5f';

/// Контроллер, управляющий процессом автоматической синхронизации данных.
///
/// Этот контроллер централизованно отслеживает ключевые события в приложении:
/// 1. Изменение статуса подключения к сети ([ConnectivityResult]).
/// 2. Вход нового пользователя ([authStateChangesProvider]).
///
/// При наступлении этих событий он инициирует полную синхронизацию данных
/// для всех репозиториев, зарегистрированных в [SyncRegistry].
///
/// Также предоставляет публичный метод [triggerSync] для ручного запуска.
///
/// Copied from [SyncController].
@ProviderFor(SyncController)
final syncControllerProvider =
    AutoDisposeNotifierProvider<SyncController, void>.internal(
      SyncController.new,
      name: r'syncControllerProvider',
      debugGetCreateSourceHash:
          const bool.fromEnvironment('dart.vm.product')
              ? null
              : _$syncControllerHash,
      dependencies: null,
      allTransitiveDependencies: null,
    );

typedef _$SyncController = AutoDisposeNotifier<void>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
