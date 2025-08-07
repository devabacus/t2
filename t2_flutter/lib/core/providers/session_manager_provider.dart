// manifest: startProject
import 'dart:async';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:serverpod_auth_shared_flutter/serverpod_auth_shared_flutter.dart';
import 'package:serverpod_auth_client/serverpod_auth_client.dart';
import 'package:t2_client/t2_client.dart';
import 'serverpod_client_provider.dart';

part 'session_manager_provider.g.dart';

@riverpod  // создаем сессию для текущего serverpod клента   
SessionManager sessionManager(Ref ref) {
  ref.keepAlive();
  final client = ref.watch(serverpodClientProvider);
  final sessionManager = SessionManager(
    caller: client.modules.auth,
  );
  sessionManager.initialize();
  return sessionManager;
}

@riverpod
Stream<UserInfo?> userInfoStream(Ref ref) {
  final sessionManager = ref.watch(sessionManagerProvider);
  late StreamController<UserInfo?> controller;
  
  void listener() {
    if (!controller.isClosed) {
      controller.add(sessionManager.signedInUser);
    } 
  }
           
  controller = StreamController<UserInfo?>(
    onListen: () {
      // Отправляем текущее состояние сразу
      controller.add(sessionManager.signedInUser);
      // Подписываемся на изменения
      sessionManager.addListener(listener);
    },
    onCancel: () {
      sessionManager.removeListener(listener);
    },
  );
  
  ref.onDispose(() {
    sessionManager.removeListener(listener);
    controller.close();
  });
  
  return controller.stream;
}

@riverpod
UserInfo? currentUser(Ref ref) {
  final asyncUserInfo = ref.watch(userInfoStreamProvider);
  return asyncUserInfo.valueOrNull;
}

@riverpod
bool isAuthenticated(Ref ref) {
  final user = ref.watch(currentUserProvider);
  return user != null;
}

@riverpod
class UserSessionDataNotifier extends _$UserSessionDataNotifier {
  @override
  UserSessionData? build() {
    // Слушаем изменения статуса аутентификации пользователя
    ref.listen(userInfoStreamProvider, (previous, next) async {
      final newUserId = next.valueOrNull?.id;
      final oldUserId = previous?.valueOrNull?.id;
    await _fetchUserContext();
      // Основное условие: ID нового пользователя существует и не совпадает со старым.
      // Это покрывает все сценарии: первый вход, запуск с активной сессией и смену пользователя.
      if (newUserId != null && newUserId != oldUserId) {
        await _fetchUserContext();
      } 
      // Условие выхода: ID нового пользователя - null, а старый ID был.
      else if (newUserId == null && oldUserId != null) {
        state = null;
      }
    });
    return null; // Изначальное состояние
  }

  // Метод для вызова эндпоинта на сервере и получения UserSessionData
  Future<void> _fetchUserContext() async {
    state = null; // Очищаем предыдущее состояние
    final client = ref.read(serverpodClientProvider);

    try {
      // Вызываем эндпоинт на сервере для получения UserSessionData
      final userContext = await client.userManagement.getMyUserContext();
      state = userContext; // Обновляем состояние провайдера
      print('✅ Получен User Context: $userContext');
    } catch (e, st) {
      print('❌ Ошибка получения User Context: $e\n$st');
      state = null; // Очищаем состояние в случае ошибки
    }
  }

  // Метод для ручного обновления контекста (если понадобится)
  Future<void> refreshUserContext() => _fetchUserContext();
}

// Провайдер, который просто смотрит за состоянием UserSessionDataNotifier
@riverpod
UserSessionData? currentUserSessionData(Ref ref) {
  return ref.watch(userSessionDataNotifierProvider);
}

// Провайдер для получения customerId из UserSessionData
@riverpod
String? currentCustomerId(Ref ref) {
  return ref.watch(currentUserSessionDataProvider)?.customerId.toString();
}

// Провайдер для получения roleId из UserSessionData
@riverpod
UuidValue? currentRoleId(Ref ref) {
  return ref.watch(currentUserSessionDataProvider)?.roleId;
}

// Провайдер для получения списка активных разрешений
@riverpod
List<String> currentUserPermissions(Ref ref) {
  return ref.watch(currentUserSessionDataProvider)?.activePermissions ?? [];
}

