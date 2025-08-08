// lib/features/admin/presentation/base/base_list_page.dart

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'base_list_page_state.dart';

/// Базовый класс для страниц со списками сущностей
/// T - тип сущности (User, Role, Permission, Customer)
abstract class BaseListPage<T> extends ConsumerStatefulWidget {
  const BaseListPage({super.key});

  @override
  ConsumerState<BaseListPage<T>> createState();
}

/// Базовое состояние для страниц со списками
abstract class BaseListPageState<T, W extends BaseListPage<T>>
    extends BaseListPageStateCore<T, W> {
  
  @override
  Widget build(BuildContext context) {
    final asyncData = ref.watch(listProvider);
    
    return Scaffold(
      appBar: buildAppBar(context),
      body: Column(
        children: [
          buildToolbar(),
          if (selectedItems.isNotEmpty) buildBulkActionsBar(),
          Expanded(
            child: asyncData.when(
              data: (items) => buildDataContent(items),
              loading: () => buildLoadingWidget(),
              error: (error, stack) => buildErrorWidget(error),
            ),
          ),
        ],
      ),
      floatingActionButton: buildFloatingActionButton(),
    );
  }

  PreferredSizeWidget buildAppBar(BuildContext context) {
    return AppBar(
      title: Text(pageTitle),
      backgroundColor: themeColor,
      foregroundColor: Colors.white,
      actions: [
        IconButton(
          icon: const Icon(Icons.refresh),
          onPressed: refreshList,
          tooltip: 'Обновить',
        ),
      ],
    );
  }

  Widget buildFloatingActionButton() {
    return FloatingActionButton.extended(
      onPressed: navigateToCreate,
      backgroundColor: themeColor,
      icon: const Icon(Icons.add),
      label: Text('Добавить $entityNameSingular'),
    );
  }

  Widget buildLoadingWidget() {
    return const Center(
      child: CircularProgressIndicator(),
    );
  }
}