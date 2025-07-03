import 'package:t2/features/home/data/datasources/local/tables/extensions/tag_table_extension.dart';
import 'package:t2/features/home/domain/entities/extensions/tag_entity_extension.dart';
import 'package:t2_client/t2_client.dart' as serverpod;

import '../../../../core/database/local/database.dart';
import '../../../../core/sync/base_sync_repository.dart';
import '../../domain/entities/tag/tag.dart';
import '../../domain/repositories/tag_repository.dart';
import '../../../../core/database/local/database_types.dart';
import '../datasources/local/interfaces/tag_local_datasource_service.dart';
import '../../../../core/database/local/interface/sync_metadata_local_datasource_service.dart';
import '../datasources/remote/interfaces/tag_remote_datasource_service.dart';
import '../models/extensions/tag_model_extension.dart';

class TagRepositoryImpl extends BaseSyncRepository
    implements ITagRepository {
  final ITagLocalDataSource _localDataSource;
  final ITagRemoteDataSource _remoteDataSource;
  

  @override
  String get entityTypeName => 'Tag';
  @override
  String get entityType => 'tags_user_$userId';

  TagRepositoryImpl(
    this._localDataSource,
    this._remoteDataSource,
    ISyncMetadataLocalDataSource syncMetadataDataSource,
    int userId,
  ) : super(userId, syncMetadataDataSource: syncMetadataDataSource) {
    print('✅ TagRepositoryImpl: Создан экземпляр для userId: $userId');
    initEventBasedSync();
  }

  @override
  Future<List<serverpod.Tag>> getChangesFromServer(DateTime? since) {
    return _remoteDataSource.getTagsSince(since);
  }

  @override
  Future<List<dynamic>> reconcileChanges(
      List<dynamic> serverChanges) async {
    return _localDataSource.reconcileServerChanges(serverChanges, userId);
  }

  @override
  Future<void> pushLocalChanges(List<dynamic> localChangesToPush) async {
    for (final localChange in localChangesToPush as List<TagTableData>) {
      if (localChange.syncStatus == SyncStatus.deleted) {
        try {
          await _syncDeleteToServer(localChange.id);
          await _localDataSource.physicallyDeleteTag(localChange.id,
              userId: userId);
          print(
              '    -> ✅ Удаление "${localChange.id}" синхронизировано с сервером.');
        } catch (e) {
          print(
              '    -> ⚠️ Не удалось синхронизировать удаление ID: ${localChange.id}. Повторим позже.');
        }
      } else if (localChange.syncStatus == SyncStatus.local) {
        try {
          final entity = localChange.toModel().toEntity();
          final serverRecord = await _remoteDataSource
              .getTagById(serverpod.UuidValue.fromString(entity.id));
          if (serverRecord != null && !serverRecord.isDeleted) {
            await _syncUpdateToServer(entity);
          } else {
            await _syncCreateToServer(entity);
          }
          print(
              '    -> ✅ Изменение "${localChange.title}" синхронизировано с сервером.');
        } catch (e) {
          print(
              '    -> ⚠️ Не удалось синхронизировать изменение ID: ${localChange.id}. Повторим позже.');
        }
      }
    }
  }

  @override
  Stream<serverpod.TagSyncEvent> watchEvents() =>
      _remoteDataSource.watchEvents();

  @override
  Future<void> handleSyncEvent(dynamic event) async {
    await _localDataSource.handleSyncEvent(event, userId);
  }

  @override
  Stream<List<TagEntity>> watchTags() {
    return _localDataSource
        .watchTags(userId: userId)
        .map((models) => models.toEntities());
  }

  @override
  Future<String> createTag(TagEntity tag) async {
    final tagWithUser = tag.copyWith(userId: userId);
    final id = await _localDataSource.createTag(tagWithUser.toModel());
    syncWithServer().catchError(
        (e) => print('⚠️ Фоновая синхронизация после создания не удалась: $e'));
    return id;
  }

  @override
  Future<bool> updateTag(TagEntity tag) async {
    final tagWithUser =
        tag.copyWith(userId: userId, lastModified: DateTime.now().toUtc());
    final result =
        await _localDataSource.updateTag(tagWithUser.toModel());
    syncWithServer().catchError(
        (e) => print('⚠️ Фоновая синхронизация после обновления не удалась: $e'));
    return result;
  }

  @override
  Future<bool> deleteTag(String id) async {
    final result = await _localDataSource.deleteTag(id, userId: userId);
    syncWithServer().catchError(
        (e) => print('⚠️ Фоновая синхронизация после удаления не удалась: $e'));
    return result;
  }

  @override
  Future<List<TagEntity>> getTags() async =>
      _localDataSource
          .getTags(userId: userId)
          .then((models) => models.toEntities());

  @override
  Future<TagEntity?> getTagById(String id) async {
    final model = await _localDataSource.getTagById(id, userId: userId);
    return model?.toEntity();
  }

  @override
  Future<List<TagEntity>> getTagsByIds(List<String> ids) async {;
    final models = await _localDataSource.getTagsByIds(ids, userId: userId);
    return models.toEntities();
  }

  Future<void> _syncCreateToServer(TagEntity tag) async {
    try {
      final serverTag = tag.toServerpodTag();
      final syncedTag =
          await _remoteDataSource.createTag(serverTag);
      await _localDataSource.insertOrUpdateFromServer(
          syncedTag, SyncStatus.synced);
    } catch (e) {
      rethrow;
    }
  }

  Future<void> _syncUpdateToServer(TagEntity tag) async {
    try {
      final serverTag = tag.toServerpodTag();
      await _remoteDataSource.updateTag(serverTag);
      await _localDataSource.insertOrUpdateFromServer(
          serverTag, SyncStatus.synced);
    } catch (e) {
      rethrow;
    }
  }

  Future<void> _syncDeleteToServer(String id) async {
    try {
      await _remoteDataSource.deleteTag(serverpod.UuidValue.fromString(id));
    } catch (e) {
      rethrow;
    }
  }
    
}


