
import 'dart:async';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:serverpod_auth_client/serverpod_auth_client.dart';

import '../providers/session_manager_provider.dart';
import 'sync_registry.dart';

part 'sync_controller_provider.g.dart';

@riverpod
class SyncController extends _$SyncController {
  StreamSubscription? _connectivitySubscription;
  ProviderSubscription? _authSubscription; 

  @override
  void build() {
    _connectivitySubscription = Connectivity().onConnectivityChanged.listen(
      _handleConnectivityChange,
    );

    _listenToAuthChanges();

    ref.onDispose(() {
      _connectivitySubscription?.cancel();
      _authSubscription
          ?.close(); 
    });
  }

  void _listenToAuthChanges() {
    _authSubscription = ref.listen<AsyncValue<UserInfo?>>(
      userInfoStreamProvider,
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

  Future<void> _handleConnectivityChange(
    List<ConnectivityResult> results,
  ) async {
    final isOnline = results.any((result) => result != ConnectivityResult.none);

    if (isOnline) {
      print('✅ Обнаружено подключение к сети.');

      _triggerSync();
    }
  }

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

  Future<void> triggerSync() async {
    print('🔄 Запуск ручной синхронизации...');
    await _triggerSync();
  }
}

