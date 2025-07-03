import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../datasources/remote/interfaces/category_remote_datasource_service.dart';
import '../../datasources/remote/sources/category_remote_data_source.dart';
import '../../../../../core/providers/serverpod_client_provider.dart';

part 'category_remote_data_providers.g.dart';

@riverpod
ICategoryRemoteDataSource categoryRemoteDataSource(Ref ref) {
  ref.keepAlive();
  final client = ref.watch(serverpodClientProvider);
  return CategoryRemoteDataSource(client); 
}

@riverpod
Future<bool> categoryRemoteConnectionCheck(Ref ref) async {
  final remoteDataSource = ref.watch(categoryRemoteDataSourceProvider);
  return await remoteDataSource.checkConnection();
}
