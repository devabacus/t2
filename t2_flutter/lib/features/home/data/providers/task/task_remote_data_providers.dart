import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../datasources/remote/interfaces/task_remote_datasource_service.dart';
import '../../datasources/remote/sources/task_remote_data_source.dart';
import '../../../../../core/providers/serverpod_client_provider.dart';

part 'task_remote_data_providers.g.dart';

@riverpod
ITaskRemoteDataSource taskRemoteDataSource(Ref ref) {
  ref.keepAlive();
  final client = ref.watch(serverpodClientProvider);
  return TaskRemoteDataSource(client); 
}

@riverpod
Future<bool> taskRemoteConnectionCheck(Ref ref) async {
  final remoteDataSource = ref.watch(taskRemoteDataSourceProvider);
  return await remoteDataSource.checkConnection();
}
