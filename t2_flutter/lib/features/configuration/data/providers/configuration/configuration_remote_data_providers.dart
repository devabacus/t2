// lib/features/configuration/data/providers/configuration/configuration_remote_data_providers.dart

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:t2/features/configuration/domain/providers/configuration/configuration_dependencies_provider.dart';

import '../../datasources/remote/interfaces/configuration_remote_datasource_service.dart';
import '../../datasources/remote/sources/configuration_remote_data_source.dart';

part 'configuration_remote_data_providers.g.dart';

@riverpod
IConfigurationRemoteDataSource configurationRemoteDataSource(Ref ref) {
  // Получаем зависимость через "мост"
  final client = ref.watch(configurationDependenciesProvider).serverpodClient;
  return ConfigurationRemoteDataSource(client);
}

@riverpod
Future<bool> configurationRemoteConnectionCheck(Ref ref) async {
  final remoteDataSource = ref.watch(configurationRemoteDataSourceProvider);
  return await remoteDataSource.checkConnection();
}