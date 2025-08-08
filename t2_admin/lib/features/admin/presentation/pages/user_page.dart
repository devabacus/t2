import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:t2_client/t2_client.dart';

import '../base/base_list_page.dart';
import '../providers/users_providers.dart';
import '../routings/user_routes_constants.dart';
import '../widgets/dialogs/user_dialogs.dart'; // <-- 1. Импортируем наш новый файл

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
        onPressed: () {
          // 2. Вызываем новую функцию
          showBlockUserDialog(
            context: context,
            ref: ref,
            user: user,
            onSuccess: refreshList, // 3. Передаем метод для обновления списка
          );
        },
      ),
    ];
  }
  
  // 4. Метод _showBlockUserDialog отсюда полностью удален
}