import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../../domain/entities/category/category_entity.dart';
import '../../../domain/providers/category/category_usecase_providers.dart';
import 'category_state_providers.dart';

part 'category_get_by_id_provider.g.dart';

@riverpod
Future<CategoryEntity?> getCategoryById(Ref ref, String id) async {
  final categoriesAsyncValue = ref.watch(categoriesStreamProvider);

  if (categoriesAsyncValue.hasValue) {
    final category = categoriesAsyncValue.value?.firstWhere(
      (cat) => cat.id == id,
      orElse: () => CategoryEntity(
        id: 'NOT_FOUND', 
        title: '', 
        lastModified: DateTime.now(), 
        userId: 0
      ), // Временный объект, если не найдено
    );
    // Если нашли реальный объект, возвращаем его
    if (category != null && category.id != 'NOT_FOUND') {
      return category;
    }
  }
  
  // Если в кеше нет или кеш еще не загружен, делаем прямой запрос к базе
  final getCategoryByIdUseCase = ref.read(getCategoryByIdUseCaseProvider);
  
  // Проверяем, что use case доступен (пользователь авторизован)
  if (getCategoryByIdUseCase == null) {
    // Пользователь не авторизован
    return null;
  }
  
  final categoryFromDb = await getCategoryByIdUseCase(id);
  return categoryFromDb;
}
  