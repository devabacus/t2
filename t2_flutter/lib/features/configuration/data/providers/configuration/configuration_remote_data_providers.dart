// lib/features/configuration/data/providers/configuration/configuration_remote_data_providers.dart

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:t2/features/configuration/domain/datasources/i_configuration_remote_data_source.dart';
import 'package:t2/features/configuration/domain/providers/configuration/configuration_dependencies_provider.dart';

part 'configuration_remote_data_providers.g.dart';

// Этот провайдер теперь просто пробрасывает зависимость из "моста".
@riverpod
IConfigurationRemoteDataSource configurationRemoteDataSource(Ref ref) {
  return ref.watch(configurationDependenciesProvider).remoteDataSource;
}

// Провайдер для проверки соединения больше не нужен здесь, так как
// он относится к конкретной реализации (Serverpod). Его можно удалить
// или перенести в `core`. Для чистоты - удалим.