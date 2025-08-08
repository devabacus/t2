// lib/features/admin/presentation/pages/user_page.dart

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:serverpod_auth_client/serverpod_auth_client.dart';
import 'package:t2_client/t2_client.dart';

import '../base/base_list_page.dart';
import '../providers/users_providers.dart';
import '../routings/user_routes_constants.dart';

class UsersPage extends BaseListPage<UserDetails> {
  const UsersPage({super.key});

  @override
  ConsumerState<UsersPage> createState() => _UsersPageState();
}

class _UsersPageState extends BaseListPageState<UserDetails, UsersPage> {
  @override
  String get pageTitle => 'Управление пользователями';

  @override
  String get entityNameSingular => 'Пользователя';

  @override
  String get entityNamePlural => 'Пользователи';

  @override
  IconData get entityIcon => Icons.people;

  @override
  Color get themeColor => Colors.blue;

  @override
  AutoDisposeFutureProvider<List<UserDetails>> get listProvider => usersListProvider;

  @override
  String getItemId(UserDetails item) => item.userInfo.id.toString();

  @override
  String getItemDisplayName(UserDetails item) => item.userInfo.userName ?? 'N/A';

  @override
  List<DataColumn> getColumns() {
    return [
      const DataColumn(label: Text('Имя')),
      const DataColumn(label: Text('Email')),
      const DataColumn(label: Text('Роль')),
      const DataColumn(label: Text('Статус')),
    ];
  }

  @override
  DataRow buildDataRow(UserDetails item) {
    final user = item.userInfo;
    final roleName = item.role?.name ?? 'Не назначена';

    return DataRow(
      cells: [
        DataCell(Text(user.userName ?? '')),
        DataCell(Text(user.email ?? '')),
        DataCell(Text(roleName)),
        DataCell(
          Text(
            user.blocked ? 'Заблокирован' : 'Активен',
            style: TextStyle(
              color: user.blocked ? Colors.red : Colors.green,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ],
    );
  }

  @override
  void navigateToCreate() {
    context.push(UsersRoutes.createUserPath);
  }

  @override
  void navigateToEdit(UserDetails item) {
    context.push(UsersRoutes.editUserPathWithId(item.userInfo.id.toString()));
  }

  @override
  Future<void> deleteItem(UserDetails item) async {
    await ref.read(deleteUserProvider(item.userInfo.id!).future);
  }

  @override
  List<Widget> getAdditionalActions(UserDetails item) {
    final user = item.userInfo;
    return [
      IconButton(
        icon: Icon(
          user.blocked ? Icons.lock_open : Icons.lock,
          color: user.blocked ? Colors.green : Colors.orange,
          size: 20,
        ),
        tooltip: user.blocked ? 'Разблокировать' : 'Заблокировать',
        onPressed: () => _showBlockUserDialog(context, ref, user, !user.blocked),
      ),
    ];
  }

  // --- Вспомогательные методы, специфичные для этой страницы ---

  void _showBlockUserDialog(
    BuildContext context,
    WidgetRef ref,
    UserInfo user,
    bool willBlock,
  ) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(willBlock ? 'Заблокировать пользователя' : 'Разблокировать пользователя'),
        content: Text(
          willBlock
              ? 'Вы уверены, что хотите заблокировать пользователя "${user.userName}"? Он не сможет войти в систему.'
              : 'Вы уверены, что хотите разблокировать пользователя "${user.userName}"?'
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: const Text('Отмена'),
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: willBlock ? Colors.orange : Colors.green,
              foregroundColor: Colors.white,
            ),
            onPressed: () async {
              Navigator.of(context).pop();
              try {
                await ref.read(blockUserProvider(user.id!, willBlock).future);
                if (mounted) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text(
                        'Пользователь "${user.userName}" ${willBlock ? "заблокирован" : "разблокирован"}'
                      ),
                      backgroundColor: willBlock ? Colors.orange : Colors.green,
                    ),
                  );
                }
                refreshList(); // Обновляем список для отображения изменений
              } catch (e) {
                if (mounted) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text('Ошибка: $e'),
                      backgroundColor: Colors.red,
                    ),
                  );
                }
              }
            },
            child: Text(willBlock ? 'Заблокировать' : 'Разблокировать'),
          ),
        ],
      ),
    );
  }
}