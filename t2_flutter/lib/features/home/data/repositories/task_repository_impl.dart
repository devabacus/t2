import 'package:t2/features/home/data/datasources/local/tables/extensions/task_table_extension.dart';
import 'package:t2/features/home/domain/entities/extensions/task_entity_extension.dart';
import 'package:t2_client/t2_client.dart' as serverpod;

import '../../../../core/database/local/database.dart';
import '../../../../core/sync/base_sync_repository.dart';
import '../../domain/entities/task/task.dart';
import '../../domain/repositories/task_repository.dart';
import '../../../../core/database/local/database_types.dart';
import '../datasources/local/interfaces/task_local_datasource_service.dart';
import '../../../../core/database/local/interface/sync_metadata_local_datasource_service.dart';
import '../datasources/remote/interfaces/task_remote_datasource_service.dart';
import '../models/extensions/task_model_extension.dart';

class TaskRepositoryImpl extends BaseSyncRepository
    implements ITaskRepository {
  final ITaskLocalDataSource _localDataSource;
  final ITaskRemoteDataSource _remoteDataSource;
  

  @override
  String get entityTypeName => 'Task';
  @override
  String get entityType => 'tasks_user_$userId';

  TaskRepositoryImpl(
    this._localDataSource,
    this._remoteDataSource,
    ISyncMetadataLocalDataSource syncMetadataDataSource,
    int userId,
  ) : super(userId, syncMetadataDataSource: syncMetadataDataSource) {
    print('✅ TaskRepositoryImpl: Создан экземпляр для userId: $userId');
    initEventBasedSync();
  }

  @override
  Future<List<serverpod.Task>> getChangesFromServer(DateTime? since) {
    return _remoteDataSource.getTasksSince(since);
  }

  @override
  Future<List<dynamic>> reconcileChanges(
      List<dynamic> serverChanges) async {
    return _localDataSource.reconcileServerChanges(serverChanges, userId);
  }

  @override
  Future<void> pushLocalChanges(List<dynamic> localChangesToPush) async {
    for (final localChange in localChangesToPush as List<TaskTableData>) {
      if (localChange.syncStatus == SyncStatus.deleted) {
        try {
          await _syncDeleteToServer(localChange.id);
          await _localDataSource.physicallyDeleteTask(localChange.id,
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
              .getTaskById(serverpod.UuidValue.fromString(entity.id));
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
  Stream<serverpod.TaskSyncEvent> watchEvents() =>
      _remoteDataSource.watchEvents();

  @override
  Future<void> handleSyncEvent(dynamic event) async {
    await _localDataSource.handleSyncEvent(event, userId);
  }

  @override
  Stream<List<TaskEntity>> watchTasks() {
    return _localDataSource
        .watchTasks(userId: userId)
        .map((models) => models.toEntities());
  }

  @override
  Future<String> createTask(TaskEntity task) async {
    final taskWithUser = task.copyWith(userId: userId);
    final id = await _localDataSource.createTask(taskWithUser.toModel());
    syncWithServer().catchError(
        (e) => print('⚠️ Фоновая синхронизация после создания не удалась: $e'));
    return id;
  }

  @override
  Future<bool> updateTask(TaskEntity task) async {
    final taskWithUser =
        task.copyWith(userId: userId, lastModified: DateTime.now().toUtc());
    final result =
        await _localDataSource.updateTask(taskWithUser.toModel());
    syncWithServer().catchError(
        (e) => print('⚠️ Фоновая синхронизация после обновления не удалась: $e'));
    return result;
  }

  @override
  Future<bool> deleteTask(String id) async {
    final result = await _localDataSource.deleteTask(id, userId: userId);
    syncWithServer().catchError(
        (e) => print('⚠️ Фоновая синхронизация после удаления не удалась: $e'));
    return result;
  }

  @override
  Future<List<TaskEntity>> getTasks() async =>
      _localDataSource
          .getTasks(userId: userId)
          .then((models) => models.toEntities());

  @override
  Future<TaskEntity?> getTaskById(String id) async {
    final model = await _localDataSource.getTaskById(id, userId: userId);
    return model?.toEntity();
  }

  @override
  Future<List<TaskEntity>> getTasksByIds(List<String> ids) async {;
    final models = await _localDataSource.getTasksByIds(ids, userId: userId);
    return models.toEntities();
  }

  Future<void> _syncCreateToServer(TaskEntity task) async {
    try {
      final serverTask = task.toServerpodTask();
      final syncedTask =
          await _remoteDataSource.createTask(serverTask);
      await _localDataSource.insertOrUpdateFromServer(
          syncedTask, SyncStatus.synced);
    } catch (e) {
      rethrow;
    }
  }

  Future<void> _syncUpdateToServer(TaskEntity task) async {
    try {
      final serverTask = task.toServerpodTask();
      await _remoteDataSource.updateTask(serverTask);
      await _localDataSource.insertOrUpdateFromServer(
          serverTask, SyncStatus.synced);
    } catch (e) {
      rethrow;
    }
  }

  Future<void> _syncDeleteToServer(String id) async {
    try {
      await _remoteDataSource.deleteTask(serverpod.UuidValue.fromString(id));
    } catch (e) {
      rethrow;
    }
  }
    
  @override
  Future<List<TaskEntity>> getTasksByCategoryId(String categoryId) async {
    final tasks = await _localDataSource.getTasksByCategoryId(categoryId, userId: userId);
    return tasks.map((e) => e.toEntity()).toList();
  }
}


