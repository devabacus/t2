// lib/features/admin/data/repositories/organization_repository.dart

import 'package:serverpod_auth_client/serverpod_auth_client.dart';
import 'package:t2_client/t2_client.dart';
import '../../domain/repositories/i_organization_repository.dart';

class OrganizationRepository implements IOrganizationRepository {
  final Client _client;
  final UserInfo? _currentUser; // <-- Добавьте поле

  // Обновите конструктор
  OrganizationRepository(this._client, this._currentUser);

  // Добавьте геттер для проверки
  bool get _isSuperAdmin => _currentUser?.id == 1;


  @override
  Future<List<Customer>> getOrganizations() async {
    // ✨ Добавьте условную логику ✨
    if (_isSuperAdmin) {
      try {
        return await _client.superAdmin.saListCustomers();
      } catch (e) {
        throw Exception('Не удалось загрузить список организаций: $e');
      }
    } else {
      // Для обычного админа возвращаем пустой список, т.к. у него нет прав
      // видеть все организации. В идеале, кнопку "Организации"
      // нужно скрыть для таких пользователей в UI.
      return [];
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