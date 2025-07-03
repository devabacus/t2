import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../../../core/database/local/provider/database_provider.dart';
import '../../../../../core/providers/session_manager_provider.dart';
import '../../../../../core/sync/sync_registry.dart';
import '../../../domain/repositories/task_repository.dart';
import '../../datasources/local/dao/task/task_dao.dart';
import '../../../../../core/database/local/daos/sync_metadata_dao.dart';
import '../../datasources/local/interfaces/task_local_datasource_service.dart';
import '../../../../../core/database/local/interface/sync_metadata_local_datasource_service.dart';
import '../../datasources/local/sources/task_local_data_source.dart';
import '../../../../../core/database/local/sources/sync_metadata_local_data_source.dart';
import '../../repositories/task_repository_impl.dart';
import 'task_remote_data_providers.dart';

part 'task_data_providers.g.dart';

@riverpod
TaskDao taskDao(Ref ref) {
  final databaseService = ref.read(databaseServiceProvider);
  return TaskDao(databaseService);
}

@riverpod
ITaskLocalDataSource taskLocalDataSource(Ref ref) {
  final taskDao = ref.read(taskDaoProvider);
  return TaskLocalDataSource(taskDao);
}

@riverpod
SyncMetadataDao syncMetadataDao(Ref ref) {
  final databaseService = ref.read(databaseServiceProvider);
  return SyncMetadataDao(databaseService.database);
}

@riverpod
ISyncMetadataLocalDataSource syncMetadataLocalDataSource(Ref ref) {
  final syncMetadataDao = ref.read(syncMetadataDaoProvider);
  return SyncMetadataLocalDataSource(syncMetadataDao);
}

/// Семейный провайдер репозитория для конкретного пользователя
/// Каждый userId получает свой изолированный экземпляр репозитория
@riverpod
ITaskRepository taskRepository(Ref ref, int userId) {
  // ref.keepAlive();
  
  // Получаем все зависимости
  final localDataSource = ref.watch(taskLocalDataSourceProvider);
  final remoteDataSource = ref.watch(taskRemoteDataSourceProvider);
  final syncMetadataLocalDataSource = ref.watch(syncMetadataLocalDataSourceProvider);

  // Создаем репозиторий с фиксированным userId
  final repository = TaskRepositoryImpl(
    localDataSource, 
    remoteDataSource, 
    syncMetadataLocalDataSource,
    userId, // Передаем userId в конструктор
  );

  // Автоматически регистрируем в реестре
  final registry = ref.read(syncRegistryProvider);
  registry.registerRepository('tasks_$userId', repository);
  
  ref.onDispose(() {
    registry.unregisterRepository('tasks_$userId');
    repository.dispose();
  });
  
  return repository;
}

/// Удобный провайдер для получения репозитория текущего пользователя
/// Автоматически следит за сменой пользователя и предоставляет соответствующий репозиторий
@riverpod
ITaskRepository? currentUserTaskRepository(Ref ref) {
  final currentUser = ref.watch(currentUserProvider);
  
  if (currentUser?.id == null) {
    // Если пользователь не авторизован, возвращаем null
    return null;
  }
  
  // Возвращаем репозиторий для текущего пользователя
  return ref.watch(taskRepositoryProvider(currentUser!.id!));
}
