// lib/features/admin/domain/repositories/i_organization_repository.dart

import 'package:t2_client/t2_client.dart';

abstract class IOrganizationRepository {
  Future<List<Customer>> getOrganizations();
  Future<Customer?> getOrganizationDetails(String organizationId);
  Future<void> createOrganization({
    required String organizationName,
    required String? organizationEmail,
    required String? organizationInfo,
  });
  Future<void> updateOrganization({required Customer customer});
  Future<void> deleteOrganization(String organizationId);
}