// lib/features/admin/data/providers/organization_data_providers.dart

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:t2_admin/core/providers/serverpod_client_provider.dart';
import '../../domain/repositories/i_organization_repository.dart';
import '../../domain/repositories/organization_repository.dart';

part 'organization_data_providers.g.dart';

@riverpod
IOrganizationRepository organizationRepository(Ref ref) {
  final client = ref.watch(serverpodClientProvider);
  return OrganizationRepository(client);
}