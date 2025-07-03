
import 'package:drift/drift.dart';
import '../../../../../../../core/database/local/interface/i_database_service.dart';
import '../../../../../../../core/database/local/database.dart';
import '../../../../../../../core/database/local/database_types.dart';
import '../../tables/category_table.dart';

part 'category_dao.g.dart';

@DriftAccessor(tables: [CategoryTable])
class CategoryDao extends DatabaseAccessor<AppDatabase>
    with _$CategoryDaoMixin {
  CategoryDao(IDatabaseService databaseService)
    : super(databaseService.database);

  AppDatabase get db => attachedDatabase;

  Future<List<CategoryTableData>> getCategories({int? userId}) =>
    (select(categoryTable)
      ..where((t) => t.syncStatus.equals(SyncStatus.deleted.name).not())
      ..where((t) => userId != null ? t.userId.equals(userId) : const Constant(true)))
    .get();     

  Stream<List<CategoryTableData>> watchCategories({int? userId}) =>
    (select(categoryTable)
      ..where((t) => t.syncStatus.equals(SyncStatus.deleted.name).not())
      ..where((t) => userId != null ? t.userId.equals(userId) : const Constant(true)))
    .watch();

  Future<CategoryTableData> getCategoryById(String id, {required int userId}) =>
      (select(categoryTable)
        ..where((t) => t.id.equals(id) & t.userId.equals(userId)))
      .getSingle();

  Future<List<CategoryTableData>> getCategoriesByIds(List<String> ids, {required int userId}) {
    if (ids.isEmpty) {
      return Future.value([]); // Возвращаем пустой список, если нет ID
    }
    return (select(categoryTable)
          ..where((t) => t.id.isIn(ids) & t.userId.equals(userId) & t.syncStatus.equals(SyncStatus.deleted.name).not()))
        .get();
  }

  Future<String> createCategory(CategoryTableCompanion companion) async {
    final id = companion.id.value;
    try {
      final existingCategory =
          await (select(categoryTable)
            ..where((t) => t.id.equals(id))).getSingleOrNull();

      if (existingCategory != null) {
        throw StateError('category with ID $id exists');
      }

      await into(categoryTable).insert(companion);
      return id;
    } catch (e) {
      print('fail of creating category: $e');
      rethrow;
    }
  }

Future<bool> updateCategory(CategoryTableCompanion companion, {required int userId}) async {    
    final idToUpdate = companion.id.value;
    final updatedRows = await (update(categoryTable)
      ..where((t) => t.id.equals(idToUpdate) & t.userId.equals(userId))) 
      .write(companion); 
    return updatedRows > 0;
}

  Future<bool> softDeleteCategory(String id, {required int userId}) async {
    
    final companion = CategoryTableCompanion(
      syncStatus: Value(SyncStatus.deleted),
      lastModified: Value(DateTime.now()), 
    );
    
    final updatedRows = await (update(categoryTable)
      ..where((t) => t.id.equals(id) & t.userId.equals(userId)))
      .write(companion);
    
    return updatedRows > 0;
  }

  Future<int> physicallyDeleteCategory(String id, {required int userId}) async {
    return (delete(categoryTable)
      ..where((t) => t.id.equals(id) & t.userId.equals(userId)))
      .go();
  }

  Future<bool> categoryExists(String id) async {
    if (id.isEmpty) return false;

    final category =
        await (select(categoryTable)
          ..where((t) => t.id.equals(id))).getSingleOrNull();

    return category != null;
  }

  Future<int> getCategoriesCount({int? userId}) async {
    final countQuery = selectOnly(categoryTable)
      ..addColumns([categoryTable.id.count()])
      ..where(userId != null ? categoryTable.userId.equals(userId) : const Constant(true));

    final result = await countQuery.getSingle();
    return result.read(categoryTable.id.count()) ?? 0;
  }

  Future<void> insertCategories(List<CategoryTableCompanion> companions) async {
    await batch((batch) {
      batch.insertAll(categoryTable, companions);
    });
  }

  Future<int> deleteAllCategories({int? userId}) {
    if (userId != null) {
      return (delete(categoryTable)..where((t) => t.userId.equals(userId))).go();
    } else {
      return delete(categoryTable).go();
    }
  }
  
}
