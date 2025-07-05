import '../entities/task/task_entity.dart';

abstract class ITaskRepository {
  Future<List<TaskEntity>> getTasks();
  Stream<List<TaskEntity>> watchTasks();
  Future<TaskEntity?> getTaskById(String id, String customerId);
  Future<List<TaskEntity>> getTasksByIds(List<String> ids);
  Future<String> createTask(TaskEntity task);
  Future<bool> updateTask(TaskEntity task);
  Future<bool> deleteTask(String id);
  Future<void> syncWithServer();
  void initEventBasedSync();
  void dispose();
  
  Future<List<TaskEntity>> getTasksByCategoryId(String categoryId);
}

