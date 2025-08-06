import 'package:app_core/app_core.dart';

import '../../domain/datasources/i_configuration_remote_data_source.dart';
import '../../domain/entities/configuration/configuration_entity.dart';
import '../../domain/entities/extensions/configuration_entity_extension.dart';
import '../../domain/repositories/configuration_repository.dart';
import '../datasources/local/interfaces/configuration_local_datasource_service.dart';
import '../models/configuration/configuration_model.dart';
import '../models/extensions/configuration_model_extension.dart';


class ConfigurationRepositoryImpl extends BaseSyncRepository implements IConfigurationRepository {
  final IConfigurationLocalDataSource _localDataSource;
  final IConfigurationRemoteDataSource _remoteDataSource; 

  @override
  String get entityTypeName => 'Configuration';
  @override
  String get entityType => 'configurations_user_$userId';

  ConfigurationRepositoryImpl(
    this._localDataSource,
    this._remoteDataSource,
    ISyncMetadataLocalDataSource syncMetadataDataSource,
    int userId,
    String customerId,
  ) : super(userId, customerId, syncMetadataDataSource: syncMetadataDataSource) {
    initEventBasedSync();
  }

  @override
  Future<List<dynamic>> getChangesFromServer(DateTime? since) {
    return _remoteDataSource.getConfigurationsSince(since);
  }

  @override
  Future<void> pushLocalChanges(List<dynamic> localChangesToPush) async {
    for (final localChange in localChangesToPush as List<ConfigurationModel>) {
      final entity = localChange.toEntity();
      try {
        if (localChange.isDeleted) {
          await _syncUpdateToServer(entity);
          await _localDataSource.physicallyDeleteConfiguration(entity.id, userId: userId, customerId: customerId);
        } else {
          await _syncCreateToServer(entity).catchError((e) {
            return _syncUpdateToServer(entity);
          });
        }
      } catch (e) {
        print('    -> ⚠️ Не удалось синхронизировать изменение ID: ${entity.id}. Повторим позже.');
      }
    }
  }
  
  Future<void> _syncCreateToServer(ConfigurationEntity configuration) async {
    final syncedEntity = await _remoteDataSource.createConfiguration(configuration);
    await _localDataSource.insertOrUpdateFromServer(syncedEntity, SyncStatus.synced);
  }

  Future<void> _syncUpdateToServer(ConfigurationEntity configuration) async {
    await _remoteDataSource.updateConfiguration(configuration);
    await _localDataSource.insertOrUpdateFromServer(configuration, SyncStatus.synced);
  }

  @override
  Stream<dynamic> watchEvents() => _remoteDataSource.watchEvents();
  
  @override
  Future<List<dynamic>> reconcileChanges(List<dynamic> serverChanges) async {
    return _localDataSource.reconcileServerChanges(
      serverChanges,
      userId: userId,
      customerId: customerId,
    );
  }

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
    final models = await _localDataSource.getConfigurationsByIds(
      ids,
      userId: userId,
      customerId: customerId,
    );
    return models.toEntities();
  }
  
  @override
  Future<ConfigurationEntity?> getConfigurationByGroupAndKey(String group, String key) async {
    final model = await _localDataSource.getConfigurationByGroupAndKey(group, key, userId: userId, customerId: customerId);
    return model?.toEntity();
  }
}