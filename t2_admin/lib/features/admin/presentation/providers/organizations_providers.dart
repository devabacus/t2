// lib/features/admin/presentation/providers/organizations_providers.dart

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:t2_client/t2_client.dart';
import '../../../../core/providers/serverpod_client_provider.dart';

part 'organizations_providers.g.dart';

@riverpod
Future<List<Customer>> organizationsList(Ref ref) async {
  final client = ref.read(serverpodClientProvider);
  try {
    return await client.superAdmin.saListCustomers();
  } catch (e) {
    throw Exception('Не удалось загрузить список организаций: $e');
  }
}

@riverpod
Future<void> createOrganization(Ref ref, {
  required String organizationName,
  required String? organizationEmail,
  required String? organizationInfo,
}) async {
  final client = ref.read(serverpodClientProvider);
  
  // Создаем организацию
  final customer = Customer(
    name: organizationName,
    email: organizationEmail,
    info: organizationInfo,
    createdAt: DateTime.now(),
    lastModified: DateTime.now(),
    isDeleted: false,
    userId: 0, // Будет установлен автоматически в SuperAdminEndpoint
  );
  
  await client.superAdmin.saSaveCustomer(customer);
  
  // Обновляем список организаций
  ref.invalidate(organizationsListProvider);
}

@riverpod
Future<void> deleteOrganization(Ref ref, String organizationId) async {
  final client = ref.read(serverpodClientProvider);
  
  final organizationUuid = UuidValue.fromString(organizationId);
  await client.superAdmin.saDeleteCustomer(organizationUuid);
  
  // Обновляем список организаций
  ref.invalidate(organizationsListProvider);
}

// НОВЫЙ ПРОВАЙДЕР для получения деталей одной организации
@riverpod
Future<Customer?> organizationDetails(Ref ref, String organizationId) async {
  final client = ref.read(serverpodClientProvider);
  try {
    // Вызываем новый эндпоинт, который мы добавили на сервере
    return await client.superAdmin.saGetCustomer(UuidValue.fromString(organizationId));
  } catch (e) {
    throw Exception('Не удалось загрузить данные организации: $e');
  }
}

// НОВЫЙ ПРОВАЙДЕР для обновления организации
@riverpod
Future<void> updateOrganization(Ref ref, {
  required Customer customer,
}) async {
  final client = ref.read(serverpodClientProvider);
  try {
    // Используем существующий эндпоинт для сохранения
    await client.superAdmin.saSaveCustomer(customer);
    
    // Обновляем кэш, чтобы списки и страницы обновились
    ref.invalidate(organizationsListProvider);
    ref.invalidate(organizationDetailsProvider(customer.id.toString()));
  } catch (e) {
    throw Exception('Не удалось обновить организацию: $e');
  }
}