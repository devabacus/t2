// lib/features/admin/presentation/pages/roles_page.dart

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:t2_client/t2_client.dart';

import '../base/base_list_page.dart';
import '../providers/roles_providers.dart';
import '../providers/users_providers.dart'; // Для получения списка организаций
import '../routings/roles_routes_constants.dart';

class RolesPage extends BaseListPage<Role> {
  const RolesPage({super.key});

  @override
  ConsumerState<RolesPage> createState() => _RolesPageState();
}

class _RolesPageState extends BaseListPageState<Role, RolesPage> {
  @override
  String get pageTitle => 'Управление ролями';

  @override
  String get entityNameSingular => 'Роль';

  @override
  String get entityNamePlural => 'Роли';

  @override
  IconData get entityIcon => Icons.security;

  @override
  Color get themeColor => Colors.green;

  @override
  AutoDisposeFutureProvider<List<Role>> get listProvider => rolesListProvider;

  @override
  String getItemId(Role item) => item.id.toString();

  @override
  String getItemDisplayName(Role item) => item.name;

  @override
  Comparable<dynamic> getComparableValue(Role item, int columnIndex) {
    switch (columnIndex) {
      case 0: // Название
        return item.name.toLowerCase();
      // Организацию сложно сортировать на клиенте, так как это асинхронный запрос.
      // Лучше всего делать это на сервере. Пока мы ее не сортируем.
      case 3: // ID
        return item.id.toString();
      default:
        return item.createdAt ?? DateTime(1970);
    }
  }

  @override
  List<DataColumn> getColumns() {
    return [
      DataColumn(label: const Text('Название'), onSort: onSort),
      const DataColumn(label: Text('Описание')),
      const DataColumn(label: Text('Организация')), // Несортируемая колонка
      DataColumn(label: const Text('ID'), onSort: onSort),
    ];
  }

  @override
  DataRow buildDataRow(Role role) {
    // Получаем имя организации для отображения
    final customerName = ref.watch(customersListProvider).when(
      data: (customers) {
        try {
          return customers.firstWhere((c) => c.id == role.customerId).name;
        } catch (e) {
          return 'Не найдена';
        }
      },
      loading: () => 'Загрузка...',
      error: (_, __) => 'Ошибка',
    );

    return DataRow(
      cells: [
        DataCell(Text(role.name)),
        DataCell(Text(role.description ?? '-')),
        DataCell(Text(customerName)),
        DataCell(Text(role.id.toString())),
      ],
    );
  }

  @override
  void navigateToCreate() {
    context.push(RolesRoutes.createRolePath);
  }

  @override   
  void navigateToEdit(Role item) {
    context.push('${RolesRoutes.editRolePath}/${item.id}');
  }

  @override
  Future<void> deleteItem(Role item) async {
    await ref.read(deleteRoleProvider(item.id.toString()).future);
    ref.invalidate(rolesListProvider);
  }
  
  @override
  bool canEdit(Role item) => true;
}