import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../datasources/remote/interfaces/tag_remote_datasource_service.dart';
import '../../datasources/remote/sources/tag_remote_data_source.dart';
import '../../../../../core/providers/serverpod_client_provider.dart';

part 'tag_remote_data_providers.g.dart';

@riverpod
ITagRemoteDataSource tagRemoteDataSource(Ref ref) {
  ref.keepAlive();
  final client = ref.watch(serverpodClientProvider);
  return TagRemoteDataSource(client); 
}

@riverpod
Future<bool> tagRemoteConnectionCheck(Ref ref) async {
  final remoteDataSource = ref.watch(tagRemoteDataSourceProvider);
  return await remoteDataSource.checkConnection();
}
