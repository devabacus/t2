// lib/features/admin/presentation/pages/organizations_page.dart

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:t2_client/t2_client.dart';

import '../base/base_list_page.dart';
import '../providers/organizations_providers.dart';
import '../routings/organizations_routes_constants.dart';

class OrganizationsPage extends BaseListPage<Customer> {
  const OrganizationsPage({super.key});

  @override
  ConsumerState<OrganizationsPage> createState() => _OrganizationsPageState();
}

class _OrganizationsPageState
    extends BaseListPageState<Customer, OrganizationsPage> {
  @override
  String get pageTitle => 'Управление организациями';

  @override
  String get entityNameSingular => 'Организацию';

  @override
  String get entityNamePlural => 'Организации';

  @override
  IconData get entityIcon => Icons.business;

  @override
  Color get themeColor => Colors.orange;

  @override
  AutoDisposeFutureProvider<List<Customer>> get listProvider =>
      organizationsListProvider;

  @override
  String getItemId(Customer item) => item.id.toString();

  @override
  String getItemDisplayName(Customer item) => item.name;

  @override
  List<DataColumn> getColumns() {
    return [
      const DataColumn(label: Text('Название')),
      const DataColumn(label: Text('Email')),
      const DataColumn(label: Text('Описание')),
      const DataColumn(label: Text('ID')),
    ];
  }

  @override
  DataRow buildDataRow(Customer item) {
    return DataRow(
      cells: [
        DataCell(Text(item.name)),
        DataCell(Text(item.email ?? '-')),
        DataCell(Text(item.info ?? '-')),
        DataCell(Text(item.id.toString())),
      ],
    );
  }

  @override
  void navigateToCreate() {
    context.push(OrganizationsRoutes.createOrganizationPath);
  }

  @override
  void navigateToEdit(Customer item) {
    context.push('${OrganizationsRoutes.editOrganizationPath}/${item.id}');
  }

  @override
  Future<void> deleteItem(Customer item) async {
    // Внимание: перед удалением базовый класс покажет стандартный диалог подтверждения.
    // Если вам нужен кастомный диалог (как был раньше, с предупреждением об удалении пользователей),
    // вам нужно будет переопределить метод `showDeleteConfirmation` из `BaseListPageState`.
    await ref.read(deleteOrganizationProvider(item.id.toString()).future);
  }

  @override
  bool canEdit(Customer item) => true; // Редактирование пока не реализовано
}
