// manifest: entity
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../datasources/remote/interfaces/configuration_remote_datasource_service.dart';
import '../../datasources/remote/sources/configuration_remote_data_source.dart';
import '../../../../../core/providers/serverpod_client_provider.dart';

part 'configuration_remote_data_providers.g.dart';

@riverpod
IConfigurationRemoteDataSource configurationRemoteDataSource(Ref ref) {
  ref.keepAlive();
  final client = ref.watch(serverpodClientProvider);
  return ConfigurationRemoteDataSource(client); 
}

@riverpod
Future<bool> configurationRemoteConnectionCheck(Ref ref) async {
  final remoteDataSource = ref.watch(configurationRemoteDataSourceProvider);
  return await remoteDataSource.checkConnection();
}
