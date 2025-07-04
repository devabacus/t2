
import 'package:t2/core/database/local/database.dart';

import '../../../models/category/category_model.dart';
import '../../../../../../core/database/local/database_types.dart';

abstract class ICategoryLocalDataSource {
  Future<List<CategoryModel>> getCategories({int? userId});
  Stream<List<CategoryModel>> watchCategories({int? userId});
  Future<CategoryModel?> getCategoryById(String id, {required int userId, required String customerId});
  Future<List<CategoryModel>> getCategoriesByIds(List<String> ids, {required int userId});
  Future<String> createCategory(CategoryModel category);
  Future<bool> updateCategory(CategoryModel category);
  Future<bool> deleteCategory(String id, {required int userId});
  Future<List<CategoryTableData>> getAllLocalChanges(int userId);
  Future<List<CategoryTableData>> reconcileServerChanges(
    List<dynamic> serverChanges,
    int userId,
  );
  Future<void> physicallyDeleteCategory(String id, {required int userId});
  Future<void> insertOrUpdateFromServer(
    dynamic serverChange,
    SyncStatus status,
  );
  Future<void> handleSyncEvent(dynamic event, int userId);

}

