
import 'package:drift/drift.dart';
import '../../../../../../../core/database/local/interface/i_database_service.dart';
import '../../../../../../../core/database/local/database.dart';
import '../../../../../../../core/database/local/database_types.dart';
import '../../tables/tag_table.dart';

part 'tag_dao.g.dart';

@DriftAccessor(tables: [TagTable])
class TagDao extends DatabaseAccessor<AppDatabase>
    with _$TagDaoMixin {
  TagDao(IDatabaseService databaseService)
    : super(databaseService.database);

  AppDatabase get db => attachedDatabase;

  Future<List<TagTableData>> getTags({int? userId}) =>
    (select(tagTable)
      ..where((t) => t.syncStatus.equals(SyncStatus.deleted.name).not())
      ..where((t) => userId != null ? t.userId.equals(userId) : const Constant(true)))
    .get();     

  Stream<List<TagTableData>> watchTags({int? userId}) =>
    (select(tagTable)
      ..where((t) => t.syncStatus.equals(SyncStatus.deleted.name).not())
      ..where((t) => userId != null ? t.userId.equals(userId) : const Constant(true)))
    .watch();

  Future<TagTableData> getTagById(String id, {required int userId}) =>
      (select(tagTable)
        ..where((t) => t.id.equals(id) & t.userId.equals(userId)))
      .getSingle();

  Future<List<TagTableData>> getTagsByIds(List<String> ids, {required int userId}) {
    if (ids.isEmpty) {
      return Future.value([]); // Возвращаем пустой список, если нет ID
    }
    return (select(tagTable)
          ..where((t) => t.id.isIn(ids) & t.userId.equals(userId) & t.syncStatus.equals(SyncStatus.deleted.name).not()))
        .get();
  }

  Future<String> createTag(TagTableCompanion companion) async {
    final id = companion.id.value;
    try {
      final existingTag =
          await (select(tagTable)
            ..where((t) => t.id.equals(id))).getSingleOrNull();

      if (existingTag != null) {
        throw StateError('tag with ID $id exists');
      }

      await into(tagTable).insert(companion);
      return id;
    } catch (e) {
      print('fail of creating tag: $e');
      rethrow;
    }
  }

Future<bool> updateTag(TagTableCompanion companion, {required int userId}) async {    
    final idToUpdate = companion.id.value;
    final updatedRows = await (update(tagTable)
      ..where((t) => t.id.equals(idToUpdate) & t.userId.equals(userId))) 
      .write(companion); 
    return updatedRows > 0;
}

  Future<bool> softDeleteTag(String id, {required int userId}) async {
    
    final companion = TagTableCompanion(
      syncStatus: Value(SyncStatus.deleted),
      lastModified: Value(DateTime.now()), 
    );
    
    final updatedRows = await (update(tagTable)
      ..where((t) => t.id.equals(id) & t.userId.equals(userId)))
      .write(companion);
    
    return updatedRows > 0;
  }

  Future<int> physicallyDeleteTag(String id, {required int userId}) async {
    return (delete(tagTable)
      ..where((t) => t.id.equals(id) & t.userId.equals(userId)))
      .go();
  }

  Future<bool> tagExists(String id) async {
    if (id.isEmpty) return false;

    final tag =
        await (select(tagTable)
          ..where((t) => t.id.equals(id))).getSingleOrNull();

    return tag != null;
  }

  Future<int> getTagsCount({int? userId}) async {
    final countQuery = selectOnly(tagTable)
      ..addColumns([tagTable.id.count()])
      ..where(userId != null ? tagTable.userId.equals(userId) : const Constant(true));

    final result = await countQuery.getSingle();
    return result.read(tagTable.id.count()) ?? 0;
  }

  Future<void> insertTags(List<TagTableCompanion> companions) async {
    await batch((batch) {
      batch.insertAll(tagTable, companions);
    });
  }

  Future<int> deleteAllTags({int? userId}) {
    if (userId != null) {
      return (delete(tagTable)..where((t) => t.userId.equals(userId))).go();
    } else {
      return delete(tagTable).go();
    }
  }
  
  Future<List<TagTableData>> getTagsByCustomerId(String customerId, {required int userId}) =>
    (select(tagTable)
      ..where((t) => t.customerId.equals(customerId) & t.userId.equals(userId) & t.syncStatus.equals(SyncStatus.deleted.name).not()))
    .get();
}
