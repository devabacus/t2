import '../entities/task/task.dart';

abstract class ITaskRepository {
  Future<List<TaskEntity>> getTasks();
  Stream<List<TaskEntity>> watchTasks();
  Future<TaskEntity?> getTaskById(String id);
  Future<List<TaskEntity>> getTasksByIds(List<String> ids);
  Future<String> createTask(TaskEntity task);
  Future<bool> updateTask(TaskEntity task);
  Future<bool> deleteTask(String id);
  Future<void> syncWithServer();
  void initEventBasedSync();
  void dispose();
  
  Future<List<TaskEntity>> getTasksByCategoryId(String categoryId);
}

