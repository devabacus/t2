import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../../domain/entities/tag/tag_entity.dart';
import '../../../domain/providers/tag/tag_usecase_providers.dart';
import 'tag_state_providers.dart';

part 'tag_get_by_id_provider.g.dart';

@riverpod
Future<TagEntity?> getTagById(Ref ref, String id) async {
  final tagsAsyncValue = ref.watch(tagsStreamProvider);

  if (tagsAsyncValue.hasValue) {
    final tag = tagsAsyncValue.value?.firstWhere(
      (cat) => cat.id == id,
      orElse: () => TagEntity(
        id: 'NOT_FOUND', 
        title: '', 
        lastModified: DateTime.now(), 
        userId: 0
      ), // Временный объект, если не найдено
    );
    // Если нашли реальный объект, возвращаем его
    if (tag != null && tag.id != 'NOT_FOUND') {
      return tag;
    }
  }
  
  // Если в кеше нет или кеш еще не загружен, делаем прямой запрос к базе
  final getTagByIdUseCase = ref.read(getTagByIdUseCaseProvider);
  
  // Проверяем, что use case доступен (пользователь авторизован)
  if (getTagByIdUseCase == null) {
    // Пользователь не авторизован
    return null;
  }
  
  final tagFromDb = await getTagByIdUseCase(id);
  return tagFromDb;
}
  