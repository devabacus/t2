
    import 'package:t2/features/home/data/datasources/local/tables/extensions/task_tag_map_table_extension.dart';
import 'package:t2/features/home/domain/entities/extensions/task_tag_map_entity_extension.dart';
import 'package:t2_client/t2_client.dart' as serverpod;
import 'package:uuid/uuid.dart';

import '../../../../core/database/local/database.dart';
import '../../../../core/database/local/database_types.dart';
import '../../../../core/database/local/interface/sync_metadata_local_datasource_service.dart';
import '../../../../core/sync/base_sync_repository.dart';
import '../../domain/entities/tag/tag.dart';
import '../../domain/entities/task/task.dart';
import '../../domain/entities/task_tag_map/task_tag_map.dart';
import '../../domain/repositories/tag_repository.dart';
import '../../domain/repositories/task_tag_map_repository.dart';
import '../datasources/local/interfaces/task_tag_map_local_datasource_service.dart';
import '../datasources/remote/interfaces/task_tag_map_remote_datasource_service.dart';
import '../models/extensions/task_model_extension.dart';
import '../models/extensions/task_tag_map_model_extension.dart';

class TaskTagMapRepositoryImpl extends BaseSyncRepository
    implements ITaskTagMapRepository {
  final ITaskTagMapLocalDataSource _localDataSource;
  final ITaskTagMapRemoteDataSource _remoteDataSource;
  final ITagRepository _tagRepository;

  @override
  String get entityTypeName => 'TaskTagMap';
  @override
  String get entityType => 'task_tag_maps_user_$userId';

  TaskTagMapRepositoryImpl(
    this._localDataSource,
    this._remoteDataSource,
    ISyncMetadataLocalDataSource syncMetadataDataSource,
    int userId,
    this._tagRepository,
  ) : super(userId, syncMetadataDataSource: syncMetadataDataSource) {
    print('✅ TaskTagMapRepositoryImpl: Создан экземпляр для userId: $userId');
    initEventBasedSync();
  }

  @override
  Stream<List<TaskTagMapEntity>> watchTaskTagMaps() {
    return _localDataSource
        .watchAllRelations(userId: userId)
        .map((models) => models.toEntities());
  }

  @override
  Future<String> createTaskTagMap(TaskTagMapEntity taskTagMap) async {
    final id = await _localDataSource.createTaskTagMap(taskTagMap.toModel());
    syncWithServer().catchError(
      (e) =>
          print('⚠️ Фоновая синхронизация после создания связи не удалась: $e'),
    );
    return id;
  }

  @override
  Future<bool> deleteTaskTagMap(String id) async {
    final result = await _localDataSource.softDeleteTaskTagMapById(
      id,
      userId: userId,
    );
    syncWithServer().catchError(
      (e) =>
          print('⚠️ Фоновая синхронизация после удаления связи не удалась: $e'),
    );
    return result;
  }

  @override
  Future<void> addTagToTask({
    required String taskId,
    required String tagId,
  }) async {
    final newRelation = TaskTagMapEntity(
      id: const Uuid().v7(),
      userId: userId,
      lastModified: DateTime.now().toUtc(),
      taskId: taskId,
      tagId: tagId,
    );
    await createTaskTagMap(newRelation);
  }

  @override
  Future<void> removeTagFromTask({
    required String taskId,
    required String tagId,
  }) async {
    try {
      // Находим связь по taskId и tagId
      final relation = await _localDataSource.getRelationByTaskAndTag(
        taskId,
        tagId,
        userId: userId,
      );

      if (relation != null) {
        // Удаляем связь по найденному ID
        await deleteTaskTagMap(relation.id);
        print('✅ Связь найдена и удалена: Task($taskId) ↔ Tag($tagId)');
      } else {
        print('⚠️ Связь не найдена: Task($taskId) ↔ Tag($tagId)');
      }
    } catch (e) {
      print('❌ Ошибка удаления связи Task($taskId) ↔ Tag($tagId): $e');
      rethrow;
    }
  }

  @override
  Future<void> removeAllTagsFromTask(String taskId) async {
    try {
      await _localDataSource.softDeleteRelationsByTaskId(
        taskId,
        userId: userId,
      );
      print('✅ Все связи для источника $taskId помечены для удаления локально.');
      // Запускаем фоновую синхронизацию, чтобы сервер узнал об удалениях
      syncWithServer().catchError(
        (e) => print(
          '⚠️ Фоновая синхронизация после очистки тегов не удалась: $e',
        ),
      );
    } catch (e) {
      print('❌ Ошибка при удалении всех записей $taskId: $e');
      rethrow;
    }
  }

  @override
  Future<List<TagEntity>> getTagsForTask(String taskId) async {
    final allRelations =
        await _localDataSource.watchAllRelations(userId: userId).first;

    final tagIdsForTask =
        allRelations
            .where((relation) => relation.taskId == taskId)
            .map((relation) => relation.tagId)
            .toList();

    if (tagIdsForTask.isEmpty) {
      return [];
    }
    return _tagRepository.getTagsByIds(tagIdsForTask);
  }

  @override
  Future<List<TaskEntity>> getTasksForTag(String tagId) async {
    final serverTasks = await _remoteDataSource.getTasksForTag(
      serverpod.UuidValue.fromString(tagId),
    );
    return serverTasks.toModels().toEntities();
  }

  @override
  Future<List<dynamic>> getChangesFromServer(DateTime? since) {
    return _remoteDataSource.getTaskTagMapsSince(since);
  }

  @override
  Future<List<dynamic>> reconcileChanges(List<dynamic> serverChanges) {
    return _localDataSource.reconcileServerChanges(serverChanges, userId);
  }

  @override
  Future<void> pushLocalChanges(List<dynamic> localChangesToPush) async {
    for (final localChange in localChangesToPush as List<TaskTagMapTableData>) {
      if (localChange.syncStatus == SyncStatus.deleted) {
        try {
          // Вместо удаления по локальному ID, удаляем по бизнес-ключу
          await _syncDeleteByTaskAndTag(localChange.taskId, localChange.tagId);
          await _localDataSource.physicallyDeleteTaskTagMap(
            localChange.id,
            userId: userId,
          );
          print(
            '    -> ✅ Удаление связи для Task ${localChange.taskId.substring(0, 8)}... синхронизировано с сервером.',
          );
        } catch (e) {
          print(
            '    -> ⚠️ Не удалось синхронизировать удаление связи для Task: ${localChange.taskId}. Повторим позже. Ошибка: $e',
          );
        }
      } else if (localChange.syncStatus == SyncStatus.local) {
        try {
          final syncedEntity = await _syncCreateToServer(
            localChange.toModel().toEntity(),
          );
          await _localDataSource.insertOrUpdateFromServer(
            syncedEntity,
            SyncStatus.synced,
          );
          print(
            '    -> ✅ Создание/обновление связи ID ${localChange.id.substring(0, 8)}... синхронизировано с сервером.',
          );
        } catch (e) {
          print(
            '    -> ⚠️ Не удалось синхронизировать создание/обновление связи ID: ${localChange.id}. Повторим позже. Ошибка: $e',
          );
        }
      }
    }
  }

  // Новый вспомогательный метод для вызова удаления по Task и Tag ID
  Future<void> _syncDeleteByTaskAndTag(String taskId, String tagId) async {
    await _remoteDataSource.deleteTaskTagMapByTaskAndTag(
      serverpod.UuidValue.fromString(taskId),
      serverpod.UuidValue.fromString(tagId),
    );
  }

  Future<serverpod.TaskTagMap> _syncCreateToServer(
    TaskTagMapEntity entity,
  ) async {
    return await _remoteDataSource.createTaskTagMap(
      taskId: serverpod.UuidValue.fromString(entity.taskId),
      tagId: serverpod.UuidValue.fromString(entity.tagId),
    );
  }

  @override
  Stream<dynamic> watchEvents() => _remoteDataSource.watchEvents();

  @override
  Future<void> handleSyncEvent(dynamic event) async {
    await _localDataSource.handleSyncEvent(event, userId);
  }

  @override
  Future<TaskTagMapEntity?> getTaskTagMapById(String id) async {
    final model = await _localDataSource.getRelationById(id, userId: userId);
    return model?.toEntity();
  }

  @override
  Future<bool> updateTaskTagMap(TaskTagMapEntity taskTagMap) async {
    final result = await _localDataSource.updateTaskTagMap(
      taskTagMap.toModel(),
    );
    syncWithServer().catchError(
      (e) => print(
        '⚠️ Фоновая синхронизация после обновления связи не удалась: $e',
      ),
    );
    return result;
  }
}

    