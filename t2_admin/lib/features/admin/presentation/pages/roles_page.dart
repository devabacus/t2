// lib/features/admin/presentation/pages/roles_page.dart

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:t2_client/t2_client.dart';

import '../base/base_list_page.dart';
import '../providers/roles_providers.dart';
import '../providers/users_providers.dart';
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
  List<DataColumn> getColumns() {
    return [
      const DataColumn(label: Text('Название')),
      const DataColumn(label: Text('Описание')),
      const DataColumn(label: Text('Организация')), // Предполагается, что вы добавите получение Customer в Role
      const DataColumn(label: Text('ID')),
    ];
  }

  @override
  DataRow buildDataRow(Role role) {
    // ПРИМЕЧАНИЕ: На сервере необходимо будет добавить `include: Role.include(customer: Customer.include())`
    // в эндпоинт `saListAllRoles`, чтобы поле `customer` не было null.
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
    // TODO: Реализовать страницу редактирования ролей
    // context.push('${RolesRoutes.editRolePath}/${item.id}');
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Редактирование ролей пока не реализовано')),
    );
  }

  @override
  Future<void> deleteItem(Role item) async {
    await ref.read(deleteRoleProvider(item.id.toString()).future);
  }
  
  @override
  bool canEdit(Role item) => false; // Временно отключаем редактирование
}