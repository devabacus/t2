import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:t2_client/t2_client.dart';
import '../../../../core/providers/serverpod_client_provider.dart';

part 'dashboard_providers.g.dart';

@riverpod
Future<SuperAdminDashboard> dashboard(ref) async {
  final client = ref.read(serverpodClientProvider);
  try {
    return await client.superAdmin.saGetDashboard();
  } catch (e) {
    throw Exception('Не удалось загрузить данные для дашборда: $e');
  }
}