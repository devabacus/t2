
import 'package:drift/drift.dart';
import '../../../../../../../core/database/local/interface/i_database_service.dart';
import '../../../../../../../core/database/local/database.dart';
import '../../../../../../../core/database/local/database_types.dart';
import '../../tables/task_table.dart';

part 'task_dao.g.dart';

@DriftAccessor(tables: [TaskTable])
class TaskDao extends DatabaseAccessor<AppDatabase>
    with _$TaskDaoMixin {
  TaskDao(IDatabaseService databaseService)
    : super(databaseService.database);

  AppDatabase get db => attachedDatabase;

  Future<List<TaskTableData>> getTasks({int? userId}) =>
    (select(taskTable)
      ..where((t) => t.syncStatus.equals(SyncStatus.deleted.name).not())
      ..where((t) => userId != null ? t.userId.equals(userId) : const Constant(true)))
    .get();     

  Stream<List<TaskTableData>> watchTasks({int? userId}) =>
    (select(taskTable)
      ..where((t) => t.syncStatus.equals(SyncStatus.deleted.name).not())
      ..where((t) => userId != null ? t.userId.equals(userId) : const Constant(true)))
    .watch();

  Future<TaskTableData> getTaskById(String id, {required int userId}) =>
      (select(taskTable)
        ..where((t) => t.id.equals(id) & t.userId.equals(userId)))
      .getSingle();

  Future<List<TaskTableData>> getTasksByIds(List<String> ids, {required int userId}) {
    if (ids.isEmpty) {
      return Future.value([]); // Возвращаем пустой список, если нет ID
    }
    return (select(taskTable)
          ..where((t) => t.id.isIn(ids) & t.userId.equals(userId) & t.syncStatus.equals(SyncStatus.deleted.name).not()))
        .get();
  }

  Future<String> createTask(TaskTableCompanion companion) async {
    final id = companion.id.value;
    try {
      final existingTask =
          await (select(taskTable)
            ..where((t) => t.id.equals(id))).getSingleOrNull();

      if (existingTask != null) {
        throw StateError('task with ID $id exists');
      }

      await into(taskTable).insert(companion);
      return id;
    } catch (e) {
      print('fail of creating task: $e');
      rethrow;
    }
  }

Future<bool> updateTask(TaskTableCompanion companion, {required int userId}) async {    
    final idToUpdate = companion.id.value;
    final updatedRows = await (update(taskTable)
      ..where((t) => t.id.equals(idToUpdate) & t.userId.equals(userId))) 
      .write(companion); 
    return updatedRows > 0;
}

  Future<bool> softDeleteTask(String id, {required int userId}) async {
    
    final companion = TaskTableCompanion(
      syncStatus: Value(SyncStatus.deleted),
      lastModified: Value(DateTime.now()), 
    );
    
    final updatedRows = await (update(taskTable)
      ..where((t) => t.id.equals(id) & t.userId.equals(userId)))
      .write(companion);
    
    return updatedRows > 0;
  }

  Future<int> physicallyDeleteTask(String id, {required int userId}) async {
    return (delete(taskTable)
      ..where((t) => t.id.equals(id) & t.userId.equals(userId)))
      .go();
  }

  Future<bool> taskExists(String id) async {
    if (id.isEmpty) return false;

    final task =
        await (select(taskTable)
          ..where((t) => t.id.equals(id))).getSingleOrNull();

    return task != null;
  }

  Future<int> getTasksCount({int? userId}) async {
    final countQuery = selectOnly(taskTable)
      ..addColumns([taskTable.id.count()])
      ..where(userId != null ? taskTable.userId.equals(userId) : const Constant(true));

    final result = await countQuery.getSingle();
    return result.read(taskTable.id.count()) ?? 0;
  }

  Future<void> insertTasks(List<TaskTableCompanion> companions) async {
    await batch((batch) {
      batch.insertAll(taskTable, companions);
    });
  }

  Future<int> deleteAllTasks({int? userId}) {
    if (userId != null) {
      return (delete(taskTable)..where((t) => t.userId.equals(userId))).go();
    } else {
      return delete(taskTable).go();
    }
  }
  
  Future<List<TaskTableData>> getTasksByCategoryId(String categoryId, {required int userId}) =>
    (select(taskTable)
      ..where((t) => t.categoryId.equals(categoryId) & t.userId.equals(userId) & t.syncStatus.equals(SyncStatus.deleted.name).not()))
    .get();
}
