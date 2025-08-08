// lib/features/admin/data/repositories/organization_repository.dart

import 'package:t2_client/t2_client.dart';
import '../../domain/repositories/i_organization_repository.dart';

class OrganizationRepository implements IOrganizationRepository {
  final Client _client;

  OrganizationRepository(this._client);

  @override
  Future<List<Customer>> getOrganizations() async {
    try {
      return await _client.superAdmin.saListCustomers();
    } catch (e) {
      // Здесь можно добавить логирование или обработку специфических ошибок
      throw Exception('Не удалось загрузить список организаций: $e');
    }
  }

  @override
  Future<Customer?> getOrganizationDetails(String organizationId) async {
    try {
      return await _client.superAdmin.saGetCustomer(UuidValue.fromString(organizationId));
    } catch (e) {
      throw Exception('Не удалось загрузить данные организации: $e');
    }
  }

  @override
  Future<void> createOrganization({
    required String organizationName,
    required String? organizationEmail,
    required String? organizationInfo,
  }) async {
    final customer = Customer(
      name: organizationName,
      email: organizationEmail,
      info: organizationInfo,
      createdAt: DateTime.now(),
      lastModified: DateTime.now(),
      isDeleted: false,
      userId: 0, // Будет установлен на сервере
    );
    await _client.superAdmin.saSaveCustomer(customer);
  }

  @override
  Future<void> updateOrganization({required Customer customer}) async {
    try {
      await _client.superAdmin.saSaveCustomer(customer);
    } catch (e) {
      throw Exception('Не удалось обновить организацию: $e');
    }
  }

  @override
  Future<void> deleteOrganization(String organizationId) async {
    try {
      await _client.superAdmin.saDeleteCustomer(UuidValue.fromString(organizationId));
    } catch (e) {
      throw Exception('Не удалось удалить организацию: $e');
    }
  }
}