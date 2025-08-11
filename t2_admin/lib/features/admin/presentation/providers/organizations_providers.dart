// lib/features/admin/presentation/providers/organizations_providers.dart

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:t2_client/t2_client.dart';

import '../../data/providers/admin_data_providers.dart';

part 'organizations_providers.g.dart';

@riverpod
Future<List<Customer>> organizationsList(Ref ref) async {
  // Вызываем метод репозитория вместо прямого вызова клиента
  return ref.watch(adminRepositoryProvider).getCustomers();
}

@riverpod
Future<void> createOrganization(Ref ref, {
  required String organizationName,
  required String? organizationEmail,
  required String? organizationInfo,
}) async {
  final repository = ref.read(adminRepositoryProvider);
  await repository.createOrganization(
    organizationName: organizationName,
    organizationEmail: organizationEmail,
    organizationInfo: organizationInfo,
  );
  // Обновляем список
  ref.invalidate(organizationsListProvider);
}

@riverpod
Future<void> deleteOrganization(Ref ref, String organizationId) async {
  await ref.read(adminRepositoryProvider).deleteOrganization(organizationId);
  // Обновляем список
  ref.invalidate(organizationsListProvider);
}

@riverpod
Future<Customer?> organizationDetails(Ref ref, String organizationId) async {
  return ref.watch(adminRepositoryProvider).getOrganizationDetails(organizationId);
}

@riverpod
Future<void> updateOrganization(Ref ref, {
  required Customer customer,
}) async {
  await ref.read(adminRepositoryProvider).updateOrganization(customer: customer);
  // Обновляем кэш
  ref.invalidate(organizationsListProvider);
  ref.invalidate(organizationDetailsProvider(customer.id.toString()));
}