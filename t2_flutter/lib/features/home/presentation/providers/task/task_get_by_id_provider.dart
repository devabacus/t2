import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../../domain/entities/task/task.dart';
import '../../../domain/providers/task/task_usecase_providers.dart';
import 'task_state_providers.dart';

part 'task_get_by_id_provider.g.dart';

@riverpod
Future<TaskEntity?> getTaskById(Ref ref, String id) async {
  final tasksAsyncValue = ref.watch(tasksStreamProvider);

  if (tasksAsyncValue.hasValue) {
    final task = tasksAsyncValue.value?.firstWhere(
      (cat) => cat.id == id,
      orElse: () => TaskEntity(
        id: 'NOT_FOUND', 
        title: '', 
        lastModified: DateTime.now(), 
        userId: 0
      ), // Временный объект, если не найдено
    );
    // Если нашли реальный объект, возвращаем его
    if (task != null && task.id != 'NOT_FOUND') {
      return task;
    }
  }
  
  // Если в кеше нет или кеш еще не загружен, делаем прямой запрос к базе
  final getTaskByIdUseCase = ref.read(getTaskByIdUseCaseProvider);
  
  // Проверяем, что use case доступен (пользователь авторизован)
  if (getTaskByIdUseCase == null) {
    // Пользователь не авторизован
    return null;
  }
  
  final taskFromDb = await getTaskByIdUseCase(id);
  return taskFromDb;
}
  