// lib/core/dependencies/configuration_dependencies_impl.dart

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:t2_client/t2_client.dart';

import 'package:t2/core/data/datasources/local/daos/sync_metadata_dao.dart';
import 'package:t2/core/data/datasources/local/providers/database_provider.dart';
import 'package:t2/core/providers/serverpod_client_provider.dart';
import 'package:t2/features/configuration/data/datasources/local/daos/configuration/configuration_dao.dart';
import 'package:t2/features/configuration/domain/dependencies/configuration_dependencies.dart';


/// Конкретная реализация "моста" зависимостей для модуля конфигурации.
/// Она знает, где в основном приложении взять реальные экземпляры БД и клиента.
class ConfigurationDependenciesImpl implements IConfigurationDependencies {
  final Ref _ref;

  ConfigurationDependenciesImpl(this._ref);

  @override
  ConfigurationDao get configurationDao {
    final dbService = _ref.read(databaseServiceProvider);
    return ConfigurationDao(dbService);
  }

  @override
  SyncMetadataDao get syncMetadataDao {
    final dbService = _ref.read(databaseServiceProvider);
    return SyncMetadataDao(dbService.database);
  }

  @override
  Client get serverpodClient => _ref.read(serverpodClientProvider);
}