import '../../../../../../core/database/local/database.dart';
import '../../../../../../core/database/local/database_types.dart';
import '../../../models/task_tag_map/task_tag_map_model.dart';

abstract class ITaskTagMapLocalDataSource {
  // === Основные CRUD-операции ===
  Future<String> createTaskTagMap(TaskTagMapModel model);
  Future<bool> updateTaskTagMap(TaskTagMapModel model);
  Future<bool> softDeleteTaskTagMapById(String id, {required int userId});
  Future<int> softDeleteRelationsByTaskId(String taskId, {required int userId});

  Future<TaskTagMapModel?> getRelationById(String id, {required int userId});
  Future<TaskTagMapModel?> getRelationByTaskAndTag(String taskId, String tagId, {required int userId});
  Stream<List<TaskTagMapModel>> watchAllRelations({required int userId});

  Future<List<TaskTagMapTableData>> getAllLocalChanges(int userId);
  Future<List<TaskTagMapTableData>> reconcileServerChanges(List<dynamic> serverChanges, int userId);
  Future<int> physicallyDeleteTaskTagMap(String id, {required int userId});
  Future<void> insertOrUpdateFromServer(dynamic serverChange, SyncStatus status);
  Future<void> handleSyncEvent(dynamic event, int userId);
}
