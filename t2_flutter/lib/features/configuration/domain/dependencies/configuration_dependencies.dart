// lib/features/configuration/domain/dependencies/configuration_dependencies.dart

import 'package:t2_client/t2_client.dart';
import '../../data/datasources/local/daos/configuration/configuration_dao.dart';
import '../../../../core/data/datasources/local/daos/sync_metadata_dao.dart';

/// Абстрактный "мост", который определяет все внешние зависимости,
/// необходимые модулю конфигурации для его работы.
abstract class IConfigurationDependencies {
  /// Предоставляет доступ к DAO для работы с настройками.
  ConfigurationDao get configurationDao;

  /// Предоставляет доступ к DAO для метаданных синхронизации.
  SyncMetadataDao get syncMetadataDao;

  /// Предоставляет экземпляр клиента Serverpod.
  Client get serverpodClient;
}