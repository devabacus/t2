
    import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../datasources/remote/interfaces/task_tag_map_remote_datasource_service.dart';
import '../../datasources/remote/sources/task_tag_map_remote_data_source.dart';
import '../../../../../core/database/local/interface/sync_metadata_local_datasource_service.dart';
import '../../../../../core/database/local/provider/database_provider.dart';
import '../../../../../core/database/local/sources/sync_metadata_local_data_source.dart';
import '../../../../../core/providers/serverpod_client_provider.dart';
import '../../../../../core/providers/session_manager_provider.dart';
import '../../../../../core/sync/sync_registry.dart';
import '../../../domain/repositories/task_tag_map_repository.dart';
import '../../datasources/local/dao/task_tag_map/task_tag_map_dao.dart';
import '../../datasources/local/interfaces/task_tag_map_local_datasource_service.dart';
import '../../datasources/local/sources/task_tag_map_local_data_source.dart';
import '../../repositories/task_tag_map_repository_impl.dart';
import '../../../../../core/database/local/daos/sync_metadata_dao.dart';
import '../tag/tag_data_providers.dart';

part 'task_tag_map_data_providers.g.dart';

@riverpod
TaskTagMapDao taskTagMapDao(Ref ref) {
  final databaseService = ref.read(databaseServiceProvider);
  return TaskTagMapDao(databaseService);
}

@riverpod
ITaskTagMapLocalDataSource taskTagMapLocalDataSource(Ref ref) {
  final dao = ref.read(taskTagMapDaoProvider);
  return TaskTagMapLocalDataSource(dao);
}

@riverpod
ITaskTagMapRemoteDataSource taskTagMapRemoteDataSource(Ref ref) {
  final client = ref.watch(serverpodClientProvider);
  return TaskTagMapRemoteDataSource(client);
}

@riverpod
ISyncMetadataLocalDataSource syncMetadataLocalDataSource(Ref ref) {
  final syncMetadataDao = ref.read(syncMetadataDaoProvider);
  return SyncMetadataLocalDataSource(syncMetadataDao);
}

@riverpod
SyncMetadataDao syncMetadataDao(Ref ref) {
  final databaseService = ref.read(databaseServiceProvider);
  return SyncMetadataDao(databaseService.database);
}

/// Семейный провайдер репозитория для конкретного пользователя
@riverpod
ITaskTagMapRepository taskTagMapRepository(Ref ref, int userId) {
  // Получаем все зависимости
  final localDataSource = ref.watch(taskTagMapLocalDataSourceProvider);
  final remoteDataSource = ref.watch(taskTagMapRemoteDataSourceProvider);
  final syncMetadataLocalDataSource = ref.watch(
    syncMetadataLocalDataSourceProvider,
  );
  final tagRepository = ref.watch(tagRepositoryProvider(userId));

  // Создаем репозиторий с фиксированным userId
  final repository = TaskTagMapRepositoryImpl(
    localDataSource,
    remoteDataSource,
    syncMetadataLocalDataSource,
    userId,
    tagRepository, //нужно для удаления task_tag_map при удалении task
  );

  // Регистрируем в реестре для автоматической синхронизации
  final registry = ref.read(syncRegistryProvider);
  final repoKey = 'task_tag_maps_$userId';
  registry.registerRepository(repoKey, repository);

  // При уничтожении провайдера удаляем репозиторий из реестра
  ref.onDispose(() {
    registry.unregisterRepository(repoKey);
    repository.dispose();
  });

  return repository;
}

@riverpod
ITaskTagMapRepository? currentUserTaskTagMapRepository(Ref ref) {
  final currentUser = ref.watch(currentUserProvider);

  if (currentUser?.id == null) {
    return null;
  }

  return ref.watch(taskTagMapRepositoryProvider(currentUser!.id!));
}
