import 'package:drift/drift.dart';
import 'package:t2_client/t2_client.dart' as serverpod;
import 'package:uuid/uuid_value.dart';

import '../../../../../../core/database/local/database.dart';
import '../../../datasources/local/tables/extensions/tag_table_extension.dart';
import '../../../models/tag/tag_model.dart';
import '../../../models/extensions/tag_model_extension.dart';
import '../../../../../../core/database/local/database_types.dart';
import '../dao/tag/tag_dao.dart';
import '../interfaces/tag_local_datasource_service.dart';

class TagLocalDataSource implements ITagLocalDataSource {
  final TagDao _tagDao;

  TagLocalDataSource(this._tagDao);

  @override
  Future<List<TagModel>> getTags({
    required int userId,
    required String customerId,
  }) async {
    final categories = await _tagDao.getTags(
      userId: userId,
      customerId: customerId,
    );
    return categories.toModels();
  }

  @override
  Stream<List<TagModel>> watchTags({
    required int userId,
    required String customerId,
  }) {
    return _tagDao
        .watchTags(userId: userId, customerId: customerId)
        .map((list) => list.toModels());
  }

  @override
  Future<TagModel?> getTagById(
    String id, {
    required int userId,
    required String customerId,
  }) async {
    try {
      final tag = await _tagDao.getTagById(
        id,
        userId: userId,
        customerId: customerId,
      );
      return tag?.toModel();
    } catch (e) {
      return null;
    }
  }

  @override
  Future<List<TagModel>> getTagsByIds(
    List<String> ids, {
    required int userId,
    required String customerId,
  }) async {
    final tagsData = await _tagDao.getTagsByIds(
      ids,
      userId: userId,
      customerId: customerId,
    );
    return tagsData.toModels();
  }

  @override
  Future<String> createTag(TagModel tag) {
    final companion = tag.toCompanion().copyWith(
      syncStatus: const Value(SyncStatus.local),
    );
    return _tagDao.createTag(companion);
  }

  @override
  Future<bool> updateTag(TagModel tag) {
    final companion = tag.toCompanionWithId().copyWith(
      syncStatus: const Value(SyncStatus.local),
    );
    return _tagDao.updateTag(
      companion,
      userId: tag.userId,
      customerId: tag.customerId,
    );
  }

  @override
  Future<bool> deleteTag(
    String id, {
    required int userId,
    required String customerId,
  }) async {
    return _tagDao.softDeleteTag(id, userId: userId, customerId: customerId);
  }

  @override
  Future<List<TagTableData>> getAllLocalChanges({
    required int userId,
    required String customerId,
  }) {
    return (_tagDao.select(_tagDao.tagTable)..where(
      (t) =>
          (t.syncStatus.equals(SyncStatus.synced.name)).not() &
          t.userId.equals(userId) &
          t.customerId.equals(customerId),
    )).get();
  }

  @override
  Future<void> physicallyDeleteTag(
    String id, {
    required int userId,
    required String customerId,
  }) async {
    await _tagDao.physicallyDeleteTag(
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
    await _tagDao.db
        .into(_tagDao.tagTable)
        .insertOnConflictUpdate(
          (serverChange as serverpod.Tag).toCompanion(status),
        );
  }

  @override
  Future<List<TagTableData>> reconcileServerChanges(
    List<dynamic> serverChanges, {
    required int userId,
    required String customerId,
  }) async {
    final allLocalChanges = await getAllLocalChanges(
      userId: userId,
      customerId: customerId,
    );
    final localChangesMap = {for (var c in allLocalChanges) c.id: c};

    await _tagDao.db.transaction(() async {
      for (final serverChange in serverChanges as List<serverpod.Tag>) {
        if (serverChange.userId != userId ||
            serverChange.customerId.toString() != customerId){
          continue;
        }

        final localRecord =
            await (_tagDao.select(_tagDao.tagTable)..where(
              (t) =>
                  t.id.equals(serverChange.id.toString()) &
                  t.userId.equals(userId) &
                  t.customerId.equals(customerId),
            )).getSingleOrNull();

        if (localRecord == null) {
          if (!serverChange.isDeleted) {
            await insertOrUpdateFromServer(serverChange, SyncStatus.synced);
            print('    -> СОЗДАНО с сервера: "${serverChange.title}"');
          }
          continue;
        }

        final serverTime = serverChange.lastModified;
        final localTime = localRecord.lastModified;

        if (serverChange.isDeleted) {
          if (localTime.isAfter(serverTime) &&
              localRecord.syncStatus == SyncStatus.local) {
            print(
              '    -> КОНФЛИКТ: Локальная версия "${localRecord.title}" новее серверного "надгробия". Локальное изменение побеждает.',
            );
          } else {
            print(
              '    -> ✅ Серверное "надгробие" новее или нет локального конфликта. Удаляем локальную запись: ID=${localRecord.id}, Title="${localRecord.title}".',
            );
            await physicallyDeleteTag(
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
                '    -> КОНФЛИКТ: Сервер новее для "${serverChange.title}". Применяем серверные изменения.',
              );
              await insertOrUpdateFromServer(serverChange, SyncStatus.synced);
              localChangesMap.remove(localRecord.id);
            } else {
              print(
                '    -> КОНФЛИКТ: Локальная версия новее для "${localRecord.title}". Она будет отправлена на сервер.',
              );
            }
          } else {
            await insertOrUpdateFromServer(serverChange, SyncStatus.synced);
            print('    -> ОБНОВЛЕНО с сервера: "${serverChange.title}"');
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
    if (event is! serverpod.TagSyncEvent) return;

    switch (event.type) {
      case serverpod.SyncEventType.create:
      case serverpod.SyncEventType.update:
        if (event.tag != null &&
            event.tag!.userId == userId &&
            event.tag!.customerId == UuidValue.fromString(customerId)) {
          await insertOrUpdateFromServer(event.tag!, SyncStatus.synced);
          print('  -> (Real-time) СОЗДАНА/ОБНОВЛЕНА: "${event.tag!.title}"');
        }
        break;
      case serverpod.SyncEventType.delete:
        if (event.id != null) {
          final localRecord =
              await (_tagDao.select(_tagDao.tagTable)..where(
                (t) => t.id.equals(event.id!.toString()),
              )).getSingleOrNull();
          if (localRecord?.userId == userId &&
              localRecord?.customerId == customerId) {
            await physicallyDeleteTag(
              event.id!.toString(),
              userId: userId,
              customerId: customerId,
            );
            print('  -> (Real-time) УДАЛЕНА ID: "${event.id}"');
          }
        }
        break;
    }
  }
  
}
  