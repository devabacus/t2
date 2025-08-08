// lib/core/providers.dart
import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:serverpod_auth_client/serverpod_auth_client.dart';
import 'package:serverpod_auth_shared_flutter/serverpod_auth_shared_flutter.dart';
import 'package:serverpod_flutter/serverpod_flutter.dart';
import 'package:t2_client/t2_client.dart';

part 'providers.g.dart';

@riverpod
Client serverpodClient(Ref ref) {
  // Укажите URL вашего сервера. Для локальной разработки.
  // Для Android эмулятора используйте 'http://10.0.2.2:8080/'
  // Для iOS симулятора и Desktop используйте 'http://localhost:8080/'
  var client = Client('http://localhost:8080/')
    ..connectivityMonitor = FlutterConnectivityMonitor();

  // Пока не будем инициализировать SessionManager, т.к. auth-провайдеры ниже
  // будут делать это через модуль serverpod_auth_email_flutter
  return client;
}

@riverpod
SessionManager sessionManager(Ref ref) {
  final client = ref.watch(serverpodClientProvider);
  return SessionManager(caller: client.modules.auth)..initialize();
}

@riverpod
Stream<UserInfo?> authStateChanges(Ref ref) {
  // ИСПРАВЛЕНО: Полностью переписанная логика
  // SessionManager не предоставляет готовый stream, мы создаем его сами.
  
  // 1. Получаем наш SessionManager
  final sessionManager = ref.watch(sessionManagerProvider);
  
  // 2. Создаем контроллер, который будет управлять нашим потоком
  final controller = StreamController<UserInfo?>();

  // 3. Сразу отправляем в поток текущее состояние пользователя
  controller.add(sessionManager.signedInUser);

  // 4. Создаем "слушателя", который будет реагировать на изменения в SessionManager
  void listener() {
    // При каждом изменении (вход/выход) добавляем новое состояние в наш поток
    controller.add(sessionManager.signedInUser);
  }

  // 5. Подписываемся на изменения
  sessionManager.addListener(listener);

  // 6. Когда провайдер будет уничтожен, мы должны отписаться, чтобы избежать утечек памяти
  ref.onDispose(() {
    sessionManager.removeListener(listener);
    controller.close();
  });

  // 7. Возвращаем поток из нашего контроллера
  return controller.stream;
}

@riverpod
Future<UserRole> userRole(Ref ref) async {
  // Следим за состоянием аутентификации
  final authState = ref.watch(authStateChangesProvider);
  final user = authState.valueOrNull;

  // Если пользователя нет, он не авторизован
  if (user == null) {
    return UserRole.unauthorized;
  }
  
  final client = ref.watch(serverpodClientProvider);
  try {
    // Вызываем наш метод для проверки роли на сервере
    return await client.userContext.getMyRole();
  } catch (e) {
    // В случае любой ошибки (например, нет сети), считаем неавторизованным
    return UserRole.unauthorized;
  }
}