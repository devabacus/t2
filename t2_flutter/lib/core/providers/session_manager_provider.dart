// manifest: startProject
import 'dart:async';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:serverpod_auth_shared_flutter/serverpod_auth_shared_flutter.dart';
import 'package:serverpod_auth_client/serverpod_auth_client.dart';
import 'package:t2_client/t2_client.dart';

import 'package:app_core/app_core.dart';

import 'serverpod_client_provider.dart';

part 'session_manager_provider.g.dart';

@riverpod
SessionManager sessionManager(Ref ref) {
  ref.keepAlive();
  final client = ref.watch(serverpodClientProvider);
  final sessionManager = SessionManager(
    caller: client.modules.auth,
  );
  sessionManager.initialize();
  return sessionManager;
}

/// Конвертер из serverpod-модели в нашу независимую entity.
UserInfoEntity? _convertToServerpodUserInfo(UserInfo? serverpodUser) {
  if (serverpodUser == null) return null;
  return UserInfoEntity(
    id: serverpodUser.id!,
    userIdentifier: serverpodUser.userIdentifier,
    email: serverpodUser.email,
    fullName: serverpodUser.fullName,
  );
}

/// Конкретная реализация стрима аутентификации для Serverpod.
/// Этот провайдер будет использоваться для переопределения (override)
/// абстрактного провайдера из app_core.
@riverpod
Stream<UserInfoEntity?> serverpodUserInfoStream(Ref ref) {
  final sessionManager = ref.watch(sessionManagerProvider);
  
  // Создаем стрим, который слушает SessionManager от Serverpod
  final controller = StreamController<UserInfo?>();
  void listener() {
    if (!controller.isClosed) {
      controller.add(sessionManager.signedInUser);
    }
  }

  sessionManager.addListener(listener);
  ref.onDispose(() {
    sessionManager.removeListener(listener);
    controller.close();
  });

  // Важно: мы конвертируем каждую новую serverpod-модель в нашу UserInfoEntity
  return controller.stream.map(_convertToServerpodUserInfo);
}

@riverpod
class UserSessionDataNotifier extends _$UserSessionDataNotifier {
  @override
   @override
  UserSessionData? build() {
    // Слушаем наш новый стрим, который возвращает нашу сущность
    ref.listen(serverpodUserInfoStreamProvider, (previous, next) async {
      final newUserId = next.valueOrNull?.id;
      final oldUserId = previous?.valueOrNull?.id;
      
      if (newUserId != null && newUserId != oldUserId) {
        await _fetchUserContext();
      } else if (newUserId == null && oldUserId != null) {
        state = null;
      }
    });
    // Запускаем получение контекста при первом запуске, если пользователь уже вошел
    if (ref.read(sessionManagerProvider).signedInUser != null) {
       _fetchUserContext();
    }
    return null;
  }

  // Метод для вызова эндпоинта на сервере и получения UserSessionData
  Future<void> _fetchUserContext() async {
    state = null; // Очищаем предыдущее состояние
    final client = ref.read(serverpodClientProvider);

    try {
      // Вызываем эндпоинт на сервере для получения UserSessionData
      // Предполагается, что UserManagementEndpoint уже настроен на сервере
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
String? serverpodCurrentCustomerId(Ref ref) {
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

