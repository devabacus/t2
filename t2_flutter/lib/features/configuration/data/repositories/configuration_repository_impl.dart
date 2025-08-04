// manifest: entity
// === generated_start:base ===
import '../../domain/entities/extensions/configuration_entity_extension.dart';
import '../../data/datasources/local/tables/extensions/configuration_table_extension.dart';
import 'package:t2_client/t2_client.dart' as serverpod;

import '../../../../core/data/datasources/local/database.dart';
import '../../../../core/sync/base_sync_repository.dart';
import '../../domain/entities/configuration/configuration_entity.dart';
import '../../domain/repositories/configuration_repository.dart';
import '../../../../core/data/datasources/local/database_types.dart';
import '../datasources/local/interfaces/configuration_local_datasource_service.dart';
import '../../../../core/data/datasources/local/interfaces/sync_metadata_local_datasource_service.dart';
import '../datasources/remote/interfaces/configuration_remote_datasource_service.dart';
import '../models/extensions/configuration_model_extension.dart';

class ConfigurationRepositoryImpl extends BaseSyncRepository implements IConfigurationRepository {
  final IConfigurationLocalDataSource _localDataSource;
  final IConfigurationRemoteDataSource _remoteDataSource;

  @override
  String get entityTypeName => 'Configuration';
  @override
  String get entityType => 'categories_user_$userId';

  ConfigurationRepositoryImpl(
    this._localDataSource,
    this._remoteDataSource,
    ISyncMetadataLocalDataSource syncMetadataDataSource,
    int userId,
    String customerId,
  ) : super(
        userId,
        customerId,
        syncMetadataDataSource: syncMetadataDataSource,
      ) {
    print('✅ ConfigurationRepositoryImpl: Создан экземпляр для userId: $userId');
    initEventBasedSync();
  }

  @override
  Future<List<serverpod.Configuration>> getChangesFromServer(DateTime? since) {
    return _remoteDataSource.getConfigurationsSince(since);
  }

  @override
  Future<List<dynamic>> reconcileChanges(List<dynamic> serverChanges) async {
    return _localDataSource.reconcileServerChanges(
      serverChanges,
      userId: userId,
      customerId: customerId,
    );
  }

  @override
  Future<void> pushLocalChanges(List<dynamic> localChangesToPush) async {
    for (final localChange in localChangesToPush as List<ConfigurationTableData>) {
      if (localChange.isDeleted) {
        try {
          await _syncUpdateToServer(localChange.toModel().toEntity());
          await _localDataSource.physicallyDeleteConfiguration(
            localChange.id,
            userId: userId,
            customerId: customerId,
          );
          print(
            '    -> ✅ Удаление "${localChange.id}" синхронизировано с сервером.',
          );
        } catch (e) {
          print(
            '    -> ⚠️ Не удалось синхронизировать удаление ID: ${localChange.id}. Повторим позже.',
          );
        }
      } else if (localChange.syncStatus == SyncStatus.local) {
        try {
          final entity = localChange.toModel().toEntity();
          final serverRecord = await _remoteDataSource.getConfigurationById(
            serverpod.UuidValue.fromString(entity.id),
          );
          if (serverRecord != null && !serverRecord.isDeleted) {
            await _syncUpdateToServer(entity);
          } else {
            await _syncCreateToServer(entity);
          }
          print(
            '    -> ✅ Изменение "${localChange.id}" синхронизировано с сервером.',
          );
        } catch (e) {
          print(
            '    -> ⚠️ Не удалось синхронизировать изменение ID: ${localChange.id}. Повторим позже.',
          );
        }
      }
    }
  }

  @override
  Stream<serverpod.ConfigurationSyncEvent> watchEvents() =>
      _remoteDataSource.watchEvents();

  @override
  Future<void> handleSyncEvent(dynamic event) async {
    await _localDataSource.handleSyncEvent(
      event,
      userId: userId,
      customerId: customerId,
    );
  }

  @override
  Stream<List<ConfigurationEntity>> watchConfigurations() {
    return _localDataSource
        .watchConfigurations(userId: userId, customerId: customerId)
        .map((models) => models.toEntities());
  }

  @override
  Future<String> createConfiguration(ConfigurationEntity configuration) async {
    final configurationWithUser = configuration.copyWith(
      userId: userId,
      customerId: customerId,
      lastModified: DateTime.now().toUtc(),
    );
    final id = await _localDataSource.createConfiguration(configurationWithUser.toModel());
    syncWithServer().catchError(
      (e) => print('⚠️ Фоновая синхронизация после создания не удалась: $e'),
    );
    return id;
  }

  @override
  Future<bool> updateConfiguration(ConfigurationEntity configuration) async {
    final configurationWithUser = configuration.copyWith(
      userId: userId,
      customerId: customerId,
      lastModified: DateTime.now().toUtc(),
    );
    final result = await _localDataSource.updateConfiguration(configurationWithUser.toModel());
    syncWithServer().catchError(
      (e) => print('⚠️ Фоновая синхронизация после обновления не удалась: $e'),
    );
    return result;
  }

  @override
  Future<bool> deleteConfiguration(String id) async {
    final result = await _localDataSource.deleteConfiguration(
      id,
      userId: userId,
      customerId: customerId,
    );
    syncWithServer().catchError(
      (e) => print('⚠️ Фоновая синхронизация после удаления не удалась: $e'),
    );
    return result;
  }

  @override
  Future<List<ConfigurationEntity>> getConfigurations() async => _localDataSource
      .getConfigurations(userId: userId, customerId: customerId)
      .then((models) => models.toEntities());

  @override
  Future<ConfigurationEntity?> getConfigurationById(String id) async {
    final model = await _localDataSource.getConfigurationById(
      id,
      userId: userId,
      customerId: customerId,
    );
    return model?.toEntity();
  }

  @override
  Future<List<ConfigurationEntity>> getConfigurationsByIds(List<String> ids) async {
    ;
    final models = await _localDataSource.getConfigurationsByIds(
      ids,
      userId: userId,
      customerId: customerId,
    );
    return models.toEntities();
  }

  Future<void> _syncCreateToServer(ConfigurationEntity configuration) async {
    try {
      final serverConfiguration = configuration.toServerpodConfiguration();
      final syncedConfiguration = await _remoteDataSource.createConfiguration(serverConfiguration);
      await _localDataSource.insertOrUpdateFromServer(
        syncedConfiguration,
        SyncStatus.synced,
      );
    } catch (e) {
      rethrow;
    }
  }

  Future<void> _syncUpdateToServer(ConfigurationEntity configuration) async {
    try {
      final serverConfiguration = configuration.toServerpodConfiguration();
      await _remoteDataSource.updateConfiguration(serverConfiguration);
      await _localDataSource.insertOrUpdateFromServer(
        serverConfiguration,
        SyncStatus.synced,
      );
    } catch (e) {
      rethrow;
    }
  }
// === generated_end:base ===
@override
  Future<ConfigurationEntity?> getConfigurationByGroupAndKey(String group, String key) async {
    final model = await _localDataSource.getConfigurationByGroupAndKey(group, key, userId: userId, customerId: customerId);
    return model?.toEntity();
  }
}


