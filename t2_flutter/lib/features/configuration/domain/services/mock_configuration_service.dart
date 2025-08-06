// lib/features/configuration/domain/services/mock_configuration_service.dart

import 'i_configuration_service.dart';

/// "Безопасная" реализация сервиса конфигурации, которая ничего не делает.
/// Используется, когда пользователь не аутентифицирован, чтобы избежать ошибок.
class MockConfigurationService implements IConfigurationService {
  const MockConfigurationService();

  @override
  Future<T> getValue<T>(String key, T defaultValue) {
    // Всегда возвращаем значение по умолчанию.
    return Future.value(defaultValue);
  }

  @override
  Stream<T> watchValue<T>(String key, T defaultValue) {
    // Всегда возвращаем стрим с единственным значением по умолчанию.
    return Stream.value(defaultValue);
  }

  @override
  Future<void> setValue<T>(String key, T value) {
    // Ничего не делаем, так как сохранять настройки для анонимного
    // пользователя некуда.
    return Future.value();
  }
}