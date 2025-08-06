import 'package:app_core/app_core.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../../../core/data/datasources/local/providers/database_provider.dart';
import '../../../../../core/providers/session_manager_provider.dart';
import '../../../domain/repositories/task_repository.dart';
import '../../datasources/local/daos/task/task_dao.dart';
import '../../../../../core/data/datasources/local/daos/sync_metadata_dao.dart';
import '../../datasources/local/interfaces/task_local_datasource_service.dart';
import '../../datasources/local/datasources/task_local_data_source.dart';
import '../../../../../core/data/datasources/local/datasources/sync_metadata_local_data_source.dart';
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
ITaskRepository taskRepository(Ref ref, {required int userId, required String customerId}) {
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
    userId,
    customerId,
  );

  // Автоматически регистрируем в реестре
  final registry = ref.read(syncRegistryProvider);
  registry.registerRepository('tasks_${userId}_$customerId', repository);
  
  ref.onDispose(() {
    registry.unregisterRepository('tasks_${userId}_$customerId');
    repository.dispose();
  });
  
  return repository;
}

/// Удобный провайдер для получения репозитория текущего пользователя
/// Автоматически следит за сменой пользователя и предоставляет соответствующий репозиторий
@riverpod
ITaskRepository? currentUserTaskRepository(Ref ref) {
  final currentUser = ref.watch(currentUserProvider);
  final currentCustomerId = ref.watch(currentCustomerIdProvider);
  
  if (currentUser?.id == null || currentCustomerId == null) {
    // Если пользователь не авторизован, возвращаем null
    return null;
  }
  
  // Возвращаем репозиторий для текущего пользователя
  return ref.watch(taskRepositoryProvider(userId: currentUser!.id!, customerId: currentCustomerId.toString()));
}
