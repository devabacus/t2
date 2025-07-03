
import 'package:t2/core/database/local/database.dart';

import '../../../models/task/task_model.dart';
import '../../../../../../core/database/local/database_types.dart';

abstract class ITaskLocalDataSource {
  Future<List<TaskModel>> getTasks({int? userId});
  Stream<List<TaskModel>> watchTasks({int? userId});
  Future<TaskModel?> getTaskById(String id, {required int userId});
  Future<List<TaskModel>> getTasksByIds(List<String> ids, {required int userId});
  Future<String> createTask(TaskModel task);
  Future<bool> updateTask(TaskModel task);
  Future<bool> deleteTask(String id, {required int userId});
  Future<List<TaskTableData>> getAllLocalChanges(int userId);
  Future<List<TaskTableData>> reconcileServerChanges(
    List<dynamic> serverChanges,
    int userId,
  );
  Future<void> physicallyDeleteTask(String id, {required int userId});
  Future<void> insertOrUpdateFromServer(
    dynamic serverChange,
    SyncStatus status,
  );
  Future<void> handleSyncEvent(dynamic event, int userId);

  Future<List<TaskModel>> getTasksByCategoryId(String categoryId, {required int userId}); 
}

