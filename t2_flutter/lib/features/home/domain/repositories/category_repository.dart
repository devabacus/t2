import '../entities/category/category.dart';

abstract class ICategoryRepository {
  Future<List<CategoryEntity>> getCategories();
  Stream<List<CategoryEntity>> watchCategories();
  Future<CategoryEntity?> getCategoryById(String id);
  Future<List<CategoryEntity>> getCategoriesByIds(List<String> ids);
  Future<String> createCategory(CategoryEntity category);
  Future<bool> updateCategory(CategoryEntity category);
  Future<bool> deleteCategory(String id);
  Future<void> syncWithServer();
  void initEventBasedSync();
  void dispose();
  
}

