// manifest: startProject
import 'dart:async';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:serverpod_auth_client/serverpod_auth_client.dart';

import '../../features/auth/presentation/providers/auth_state_providers.dart';
import 'sync_registry.dart';

part 'sync_controller_provider.g.dart';

@riverpod
class SyncController extends _$SyncController {
  StreamSubscription? _connectivitySubscription;
  ProviderSubscription? _authSubscription; 

  @override
  void build() {
    _connectivitySubscription = Connectivity().onConnectivityChanged.listen(
      // обрабатываем события от connectivity, если online то запускаем полную синхр.
      _handleConnectivityChange,
    );

    _listenToAuthChanges();

    ref.onDispose(() {
      _connectivitySubscription?.cancel();
      _authSubscription
          ?.close(); 
    });
  }

// после авторизации пользователя также запускаем авторизацию
  void _listenToAuthChanges() {
    _authSubscription = ref.listen<AsyncValue<UserInfo?>>(
      authStateChangesProvider,
      (previous, next) {
        final wasLoggedIn = previous?.valueOrNull != null;
        final isLoggedIn = next.valueOrNull != null;

        if (!wasLoggedIn && isLoggedIn) {
          print('✅ Обнаружен вход пользователя. Запускаем синхронизацию...');
          _triggerSync();
        }
      },
    );
  }

// при подключении к сети запускаем полную синхронизацию (_triggerSync)
  Future<void> _handleConnectivityChange(
    List<ConnectivityResult> results,
  ) async {
    final isOnline = results.any((result) => result != ConnectivityResult.none);

    if (isOnline) {
      print('✅ Обнаружено подключение к сети.');

      _triggerSync();
    }
  }

// запускаем полную синхронизацию
  Future<void> _triggerSync() async {
    try {
      await Future.delayed(const Duration(milliseconds: 500));
      
      final registry = ref.read(syncRegistryProvider);
      await registry.syncAll();
      
      print('✅ Синхронизация всех сущностей завершена');
    } catch (e) {
      print('❌ Ошибка автоматической синхронизации: $e');
    }
  }

// ручная синхронизация из других частей приложения
  Future<void> triggerSync() async {
    print('🔄 Запуск ручной синхронизации...');
    await _triggerSync();
  }
}

