// manifest: entity

// === generated_start:base ===
import 'package:drift/drift.dart';
import 'package:t2_client/t2_client.dart' as serverpod;
import 'package:uuid/uuid_value.dart';

import '../../../../../../core/data/datasources/local/database.dart';
import '../tables/extensions/configuration_table_extension.dart';
import '../../../models/configuration/configuration_model.dart';
import '../../../models/extensions/configuration_model_extension.dart';
import '../../../../../../core/data/datasources/local/database_types.dart';
import '../daos/configuration/configuration_dao.dart';
import '../interfaces/configuration_local_datasource_service.dart';

class ConfigurationLocalDataSource implements IConfigurationLocalDataSource {
  final ConfigurationDao _configurationDao;

  ConfigurationLocalDataSource(this._configurationDao);

  @override
  Future<List<ConfigurationModel>> getConfigurations({
    required int userId,
    required String customerId,
  }) async {        
    final categories = await _configurationDao.getConfigurations(
      userId: userId,
      customerId: customerId,
    );
    return categories.toModels();
  }

  @override
  Stream<List<ConfigurationModel>> watchConfigurations({
    required int userId,
    required String customerId,
  }) {
    return _configurationDao
        .watchConfigurations(userId: userId, customerId: customerId)
        .map((list) => list.toModels());
  }

  @override
  Future<ConfigurationModel?> getConfigurationById(
    String id, {
    required int userId,
    required String customerId,
  }) async {
    try {
      final configuration = await _configurationDao.getConfigurationById(
        id,
        userId: userId,
        customerId: customerId,
      );
      return configuration?.toModel();
    } catch (e) {
      return null;
    }
  }

  @override
  Future<List<ConfigurationModel>> getConfigurationsByIds(
    List<String> ids, {
    required int userId,
    required String customerId,
  }) async {
    final categoriesData = await _configurationDao.getConfigurationsByIds(
      ids,
      userId: userId,
      customerId: customerId,
    );
    return categoriesData.toModels();
  }

  @override
  Future<String> createConfiguration(ConfigurationModel configuration) {
    final companion = configuration.toCompanion().copyWith(
      syncStatus: const Value(SyncStatus.local),
    );
    return _configurationDao.createConfiguration(companion);
  }

  @override
  Future<bool> updateConfiguration(ConfigurationModel configuration) {
    final companion = configuration.toCompanionWithId().copyWith(
      syncStatus: const Value(SyncStatus.local),
    );
    return _configurationDao.updateConfigurationById(
      configuration.id,
      companion,
      userId: configuration.userId,
      customerId: configuration.customerId,
    );
  }

  @override
  Future<bool> deleteConfiguration(
    String id, {
    required int userId,
    required String customerId,
  }) async {
    final companion = ConfigurationTableCompanion(
      isDeleted: Value(true),
      lastModified: Value(DateTime.now()),
      syncStatus: Value(SyncStatus.local),
    );
    final result = await _configurationDao.updateConfigurationById(
      id,
      companion,
      userId: userId,
      customerId: customerId,
    );
    return result;
  }

  @override
  Future<List<ConfigurationTableData>> getAllLocalChanges({
    required int userId,
    required String customerId,
  }) {
    return (_configurationDao.select(_configurationDao.configurationTable)..where(
      (t) =>
          (t.syncStatus.equals(SyncStatus.synced.name)).not() &
          t.userId.equals(userId) &
          t.customerId.equals(customerId),
    )).get();
  }

  @override
  Future<void> physicallyDeleteConfiguration(
    String id, {
    required int userId,
    required String customerId,
  }) async {
    await _configurationDao.physicallyDeleteConfiguration(
      id,
      userId: userId,
      customerId: customerId,
    );
  }

  @override
  Future<void> insertOrUpdateFromServer(
    dynamic serverChange,
    SyncStatus status,
  ) async {
    await _configurationDao.db
        .into(_configurationDao.configurationTable)
        .insertOnConflictUpdate(
          (serverChange as serverpod.Configuration).toCompanion(status),
        );
  }

  @override
  Future<List<ConfigurationTableData>> reconcileServerChanges(
    List<dynamic> serverChanges, {
    required int userId,
    required String customerId,
  }) async {
    final allLocalChanges = await getAllLocalChanges(
      userId: userId,
      customerId: customerId,
    );
    final localChangesMap = {for (var c in allLocalChanges) c.id: c};

    await _configurationDao.db.transaction(() async {
      for (final serverChange in serverChanges as List<serverpod.Configuration>) {
        if (serverChange.userId != userId ||
            serverChange.customerId.toString() != customerId) {
          continue;
        }

        final localRecord =
            await (_configurationDao.select(_configurationDao.configurationTable)..where(
              (t) =>
                  t.id.equals(serverChange.id.toString()) &
                  t.userId.equals(userId) &
                  t.customerId.equals(customerId),
            )).getSingleOrNull();

        if (localRecord == null) {
          if (!serverChange.isDeleted) {
            await insertOrUpdateFromServer(serverChange, SyncStatus.synced);
            print('    -> СОЗДАНО с сервера: "${serverChange.id}"');
          }
          continue;
        }

        final serverTime = serverChange.lastModified;
        final localTime = localRecord.lastModified;

        if (serverChange.isDeleted) {
          if (localTime.isAfter(serverTime) &&
              localRecord.syncStatus == SyncStatus.local) {
            print(
              '    -> КОНФЛИКТ: Локальная версия "${localRecord.id}" новее серверного "надгробия". Локальное изменение побеждает.',
            );
          } else {
            print(
              '    -> ✅ Серверное "надгробие" новее или нет локального конфликта. Удаляем локальную запись: ID=${localRecord.id}, Title="${localRecord.id}".',
            );
            await physicallyDeleteConfiguration(
              localRecord.id,
              userId: userId,
              customerId: customerId,
            );
            localChangesMap.remove(localRecord.id);
          }
        } else {
          if (localRecord.syncStatus == SyncStatus.local ||
              localRecord.isDeleted) {
            if (serverTime.isAfter(localTime)) {
              print(
                '    -> КОНФЛИКТ: Сервер новее для "${serverChange.id}". Применяем серверные изменения.',
              );
              await insertOrUpdateFromServer(serverChange, SyncStatus.synced);
              localChangesMap.remove(localRecord.id);
            } else {
              print(
                '    -> КОНФЛИКТ: Локальная версия новее для "${localRecord.id}". Она будет отправлена на сервер.',
              );
            }
          } else {
            await insertOrUpdateFromServer(serverChange, SyncStatus.synced);
            print('    -> ОБНОВЛЕНО с сервера: "${serverChange.id}"');
          }
        }
      }
    });
    return localChangesMap.values.toList();
  }

  @override
  Future<void> handleSyncEvent(
    dynamic event, {
    required int userId,
    required String customerId,
  }) async {
    if (event is! serverpod.ConfigurationSyncEvent) return;

    switch (event.type) {
      case serverpod.SyncEventType.create:
      case serverpod.SyncEventType.update:
        if (event.configuration != null &&
            event.configuration!.userId == userId &&
            event.configuration!.customerId == UuidValue.fromString(customerId)) {
          await insertOrUpdateFromServer(event.configuration!, SyncStatus.synced);
          print(
            '  -> (Real-time) СОЗДАНА/ОБНОВЛЕНА: "${event.configuration!.id}"',
          );
        }
        break;      
    }
  }
}
  
// === generated_end:base ===

// new method