import 'package:drift/drift.dart';

import '../../../../../../../core/database/local/database.dart';
import '../../../../../../../core/database/local/interface/i_database_service.dart';
import '../../tables/task_tag_map_table.dart';

part 'task_tag_map_dao.g.dart';

@DriftAccessor(tables: [TaskTagMapTable])
class TaskTagMapDao extends DatabaseAccessor<AppDatabase>
    with _$TaskTagMapDaoMixin {
  TaskTagMapDao(IDatabaseService databaseService)
    : super(databaseService.database);

  AppDatabase get db => attachedDatabase;

  /// Создает новую связь Task-Tag.
  /// Вставляет или заменяет запись, если она уже существует.
  Future<String> createTaskTagMap(TaskTagMapTableCompanion companion) async {
    final id = companion.id.value;
    await into(
      taskTagMapTable,
    ).insert(companion, mode: InsertMode.insertOrReplace);
    return id;
  }

  /// Обновляет существующую связь (например, для изменения syncStatus).
  Future<bool> updateTaskTagMap(
    TaskTagMapTableCompanion companion, {
    required int userId,
    required String customerId,
  }) async {
    final idToUpdate = companion.id.value;
    final updatedRows = await (update(taskTagMapTable)..where(
      (t) =>
          t.id.equals(idToUpdate) &
          t.userId.equals(userId) &
          t.customerId.equals(customerId),
    )).write(companion);
    return updatedRows > 0;
  }

  /// "Мягко" удаляет связь по ее ID, помечая ее как удаленную.
  Future<bool> softDeleteTaskTagMapById(
    String id, {
    required int userId,
    required String customerId,
  }) async {
    final companion = TaskTagMapTableCompanion(
      isDeleted: Value(true),
      lastModified: Value(DateTime.now().toUtc()),
    );
    final updatedRows = await (update(taskTagMapTable)..where(
      (t) =>
          t.id.equals(id) &
          t.userId.equals(userId) &
          t.customerId.equals(customerId),
    )).write(companion);
    return updatedRows > 0;
  }

  Future<int> softDeleteRelationsByTaskId(
    String taskId, {
    required int userId,
    required String customerId,
  }) async {
    final companion = TaskTagMapTableCompanion(
      isDeleted: Value(true),
      lastModified: Value(DateTime.now().toUtc()),
    );
    // Обновляем все записи, где taskId и userId совпадают
    final updatedRows = await (update(taskTagMapTable)..where(
      (t) =>
          t.taskId.equals(taskId) &
          t.userId.equals(userId) &
          t.customerId.equals(customerId),
    )).write(companion);

    print('DAO: Мягко удалено $updatedRows связей для задачи $taskId');
    return updatedRows;
  }

  /// Физически удаляет связь из базы данных. Используется после синхронизации.
  Future<int> physicallyDeleteTaskTagMap(
    String id, {
    required int userId,
    required String customerId,
  }) async {
    return (delete(taskTagMapTable)..where(
      (t) =>
          t.id.equals(id) &
          t.userId.equals(userId) &
          t.customerId.equals(customerId),
    )).go();
  }

  /// Получает одну конкретную связь по ее уникальному ID.
  Future<TaskTagMapTableData?> getRelationById(
    String id, {
    required int userId,
    required String customerId,
  }) {
    return (select(taskTagMapTable)..where(
      (t) =>
          t.id.equals(id) &
          t.userId.equals(userId) &
          t.customerId.equals(customerId),
    )).getSingleOrNull();
  }

  /// Получает связь по taskId и tagId.
  Future<TaskTagMapTableData?> getRelationByTaskAndTag(
    String taskId,
    String tagId, {
    required int userId,
    required String customerId,
  }) {
    return (select(taskTagMapTable)..where(
      (t) =>
          t.taskId.equals(taskId) &
          t.tagId.equals(tagId) &
          t.userId.equals(userId) &
          t.customerId.equals(customerId),
    )).getSingleOrNull();
  }

  /// Отслеживает все активные (не удаленные) связи для указанного пользователя.
  Stream<List<TaskTagMapTableData>> watchAllRelations({
    required int userId,
    required String customerId,
  }) {
    return (select(taskTagMapTable)..where(
      (t) =>
          t.userId.equals(userId) &
          t.customerId.equals(customerId) &
          t.isDeleted.equals(false),
    )).watch();
  }
}

