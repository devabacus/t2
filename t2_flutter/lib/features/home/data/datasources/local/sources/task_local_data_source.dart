import 'package:drift/drift.dart';
import 'package:t2_client/t2_client.dart' as serverpod;

import '../../../../../../core/database/local/database.dart';
import '../../../datasources/local/tables/extensions/task_table_extension.dart';
import '../../../models/task/task_model.dart';
import '../../../models/extensions/task_model_extension.dart';
import '../../../../../../core/database/local/database_types.dart';
import '../dao/task/task_dao.dart';
import '../interfaces/task_local_datasource_service.dart'; // Предполагается, что интерфейс находится здесь

class TaskLocalDataSource implements ITaskLocalDataSource {
  final TaskDao _taskDao;

  TaskLocalDataSource(this._taskDao);

  @override
  Future<List<TaskModel>> getTasks({int? userId}) async {
    final categories = await _taskDao.getTasks(userId: userId);
    return categories.toModels();
  }

  @override     
  Stream<List<TaskModel>> watchTasks({int? userId}) {
    return _taskDao
        .watchTasks(userId: userId)
        .map((list) => list.toModels());
  }

  @override
  Future<TaskModel?> getTaskById(String id,
      {required int userId}) async {
    try {
      final task = await _taskDao.getTaskById(id, userId: userId);
      return task.toModel();
    } catch (e) {
      return null;
    }
  }

  @override
  Future<List<TaskModel>> getTasksByIds(List<String> ids, {required int userId}) async {
    final tasksData = await _taskDao.getTasksByIds(ids, userId: userId);
    return tasksData.toModels();
  }

  @override
  Future<String> createTask(TaskModel task) {
    final companion =
        task.toCompanion().copyWith(syncStatus: const Value(SyncStatus.local));
    return _taskDao.createTask(companion);
  }

  @override
  Future<bool> updateTask(TaskModel task) {
    final companion = task
        .toCompanionWithId()
        .copyWith(syncStatus: const Value(SyncStatus.local));
    return _taskDao.updateTask(companion, userId: task.userId);
  }

  @override
  Future<bool> deleteTask(String id, {required int userId}) async {
    return _taskDao.softDeleteTask(id, userId: userId);
  }

  @override
  Future<List<TaskTableData>> getAllLocalChanges(int userId) {
    return (_taskDao.select(_taskDao.taskTable)
          ..where((t) =>
              (t.syncStatus.equals(SyncStatus.synced.name)).not() &
              t.userId.equals(userId)))
        .get();
  }

  @override
  Future<void> physicallyDeleteTask(String id, {required int userId}) async {
    await _taskDao.physicallyDeleteTask(id, userId: userId);
  }

  @override
  Future<void> insertOrUpdateFromServer(
      dynamic serverChange, SyncStatus status) async {
    await _taskDao.db
        .into(_taskDao.taskTable)
        .insertOnConflictUpdate(
          (serverChange as serverpod.Task).toCompanion(status),
        );
  }

  @override
  Future<List<TaskTableData>> reconcileServerChanges(
      List<dynamic> serverChanges, int userId) async {
    final allLocalChanges = await getAllLocalChanges(userId);
    final localChangesMap = {for (var c in allLocalChanges) c.id: c};

    await _taskDao.db.transaction(() async {
      for (final serverChange in serverChanges as List<serverpod.Task>) {
        if (serverChange.userId != userId) continue;

        final localRecord = await (_taskDao.select(_taskDao.taskTable)
              ..where((t) => t.id.equals(serverChange.id.toString())))
            .getSingleOrNull();

        if (localRecord == null) {
          if (!serverChange.isDeleted) {
            await insertOrUpdateFromServer(serverChange, SyncStatus.synced);
            print('    -> СОЗДАНО с сервера: "${serverChange.title}"');
          }
          continue;
        }

        final serverTime =
            serverChange.lastModified ?? DateTime.fromMicrosecondsSinceEpoch(0);
        final localTime = localRecord.lastModified;

        if (serverChange.isDeleted) {
          if (localTime.isAfter(serverTime) &&
              localRecord.syncStatus == SyncStatus.local) {
            print(
                '    -> КОНФЛИКТ: Локальная версия "${localRecord.title}" новее серверного "надгробия". Локальное изменение побеждает.');
          } else {
            print(
                '    -> ✅ Серверное "надгробие" новее или нет локального конфликта. Удаляем локальную запись: ID=${localRecord.id}, Title="${localRecord.title}".');
            await physicallyDeleteTask(localRecord.id, userId: userId);
            localChangesMap.remove(localRecord.id);
          }
        } else {
          if (localRecord.syncStatus == SyncStatus.local ||
              localRecord.syncStatus == SyncStatus.deleted) {
            if (serverTime.isAfter(localTime)) {
              print(
                  '    -> КОНФЛИКТ: Сервер новее для "${serverChange.title}". Применяем серверные изменения.');
              await insertOrUpdateFromServer(serverChange, SyncStatus.synced);
              localChangesMap.remove(localRecord.id);
            } else {
              print(
                  '    -> КОНФЛИКТ: Локальная версия новее для "${localRecord.title}". Она будет отправлена на сервер.');
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
  Future<void> handleSyncEvent(dynamic event, int userId) async {
    if (event is! serverpod.TaskSyncEvent) return;

    switch (event.type) {
      case serverpod.SyncEventType.create:
      case serverpod.SyncEventType.update:
        if (event.task != null && event.task!.userId == userId) {
          await insertOrUpdateFromServer(event.task!, SyncStatus.synced);
          print(
              '  -> (Real-time) СОЗДАНА/ОБНОВЛЕНА: "${event.task!.title}"');
        }
        break;
      case serverpod.SyncEventType.delete:
        if (event.id != null) {
          final localRecord = await (_taskDao.select(_taskDao.taskTable)
                ..where((t) => t.id.equals(event.id!.toString())))
              .getSingleOrNull();
          if (localRecord?.userId == userId) {
            await physicallyDeleteTask(event.id!.toString(), userId: userId);
            print('  -> (Real-time) УДАЛЕНА ID: "${event.id}"');
          }
        }
        break;
    }
  }
  
  @override
  Future<List<TaskModel>> getTasksByCategoryId(String categoryId, {required int userId}) async {
    final tasks = await _taskDao.getTasksByCategoryId(categoryId, userId: userId);
    return tasks.toModels();
  }
}
  