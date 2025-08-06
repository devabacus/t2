import 'package:app_core/app_core.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../../../core/data/datasources/local/daos/sync_metadata_dao.dart';
import '../../../../../core/data/datasources/local/datasources/sync_metadata_local_data_source.dart';
import '../../../domain/providers/configuration/configuration_dependencies_provider.dart';
import '../../../domain/repositories/configuration_repository.dart';
import '../../datasources/local/daos/configuration/configuration_dao.dart';
import '../../datasources/local/datasources/configuration_local_data_source.dart';
import '../../datasources/local/interfaces/configuration_local_datasource_service.dart';
import '../../repositories/configuration_repository_impl.dart';
import 'configuration_remote_data_providers.dart';

part 'configuration_data_providers.g.dart';

@riverpod
ConfigurationDao configurationDao(Ref ref) {
  // Получаем зависимость через "мост"
  return ref.watch(configurationDependenciesProvider).configurationDao;
}


@riverpod
IConfigurationLocalDataSource configurationLocalDataSource(Ref ref) {
  final configurationDao = ref.read(configurationDaoProvider);
  return ConfigurationLocalDataSource(configurationDao);
}

@riverpod
SyncMetadataDao syncMetadataDao(Ref ref) {
  // Получаем зависимость через "мост"
  return ref.watch(configurationDependenciesProvider).syncMetadataDao;
}

@riverpod
ISyncMetadataLocalDataSource syncMetadataLocalDataSource(Ref ref) {
  final syncMetadataDao = ref.read(syncMetadataDaoProvider);
  return SyncMetadataLocalDataSource(syncMetadataDao);
}

/// Семейный провайдер репозитория для конкретного пользователя
/// Каждый userId получает свой изолированный экземпляр репозитория
@riverpod
IConfigurationRepository configurationRepository(Ref ref, {required int userId, required String customerId}) {
  // ref.keepAlive();
  
  // Получаем все зависимости
  final localDataSource = ref.watch(configurationLocalDataSourceProvider);
  final remoteDataSource = ref.watch(configurationRemoteDataSourceProvider);
  final syncMetadataLocalDataSource = ref.watch(syncMetadataLocalDataSourceProvider);

  // Создаем репозиторий с фиксированным userId
  final repository = ConfigurationRepositoryImpl(
    localDataSource, 
    remoteDataSource, 
    syncMetadataLocalDataSource,
    userId,
    customerId,
  );

    // Автоматически регистрируем в реестре
  final registry = ref.read(syncRegistryProvider);
  // ИСПРАВЛЕНО: Уникальный ключ для репозитория конфигурации
  final repoKey = 'configurations_${userId}_$customerId';
  registry.registerRepository(repoKey, repository);
  
  ref.onDispose(() {
    // ИСПРАВЛЕНО: Удаляем регистрацию по правильному ключу
    registry.unregisterRepository(repoKey);
    repository.dispose();
  });
  
  return repository;
}

/// Удобный провайдер для получения репозитория текущего пользователя
/// Автоматически следит за сменой пользователя и предоставляет соответствующий репозиторий
@riverpod
IConfigurationRepository? currentUserConfigurationRepository(Ref ref) {
  final currentUser = ref.watch(currentUserProvider);
  final currentCustomerId = ref.watch(currentCustomerIdProvider);
  
  if (currentUser?.id == null || currentCustomerId == null) {
    // Если пользователь не авторизован, возвращаем null
    return null;
  }
  
  // Возвращаем репозиторий для текущего пользователя
  return ref.watch(configurationRepositoryProvider(userId: currentUser!.id!, customerId: currentCustomerId.toString()));
}
