import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:uuid/uuid.dart';

import '../../../../core/providers/session_manager_provider.dart';
import '../../data/providers/task_tag_map/task_tag_map_data_providers.dart';
import '../../domain/entities/category/category_entity.dart';
import '../../domain/entities/task/task_entity.dart';
import '../../domain/entities/tag/tag_entity.dart';
import '../../domain/providers/category/category_usecase_providers.dart';
import '../../domain/providers/task/task_usecase_providers.dart';
import '../../domain/providers/tag/tag_usecase_providers.dart';
import '../../domain/providers/task_tag_map/task_tag_map_usecase_providers.dart';
import '../providers/category/category_state_providers.dart';
import '../providers/task/task_state_providers.dart';
import '../providers/tag/tag_state_providers.dart';
import '../providers/task_tag_map/task_tag_map_state_providers.dart';

class HomePage extends ConsumerStatefulWidget {
  const HomePage({super.key});

  @override
  ConsumerState<HomePage> createState() => _HomePageState();
}

class _HomePageState extends ConsumerState<HomePage> {
  final TextEditingController _categoryController = TextEditingController();
  final TextEditingController _taskController = TextEditingController();
  final TextEditingController _tagController = TextEditingController();
  String? _selectedCategoryId;
  String? _selectedTaskId;
  String? _selectedTagId;

  @override
  void dispose() {
    _categoryController.dispose();
    _taskController.dispose();
    _tagController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final currentUser = ref.watch(currentUserProvider);

    if (currentUser == null) {
      return Scaffold(
        appBar: AppBar(title: const Text('Тест синхронизации')),
        body: const Center(child: Text('Войдите в систему')),
      );
    }
    //  подписываемся на стримы
    final categoriesAsync = ref.watch(categoriesStreamProvider);
    final tasksAsync = ref.watch(tasksStreamProvider);
    final tagsAsync = ref.watch(tagsStreamProvider);
    ref.watch(
      currentUserTaskTagMapRepositoryProvider,
    ); //нужно для инициализации иначе не работает подписка

    // final  = ref.watch(tagsStreamProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Тест синхронизации TaskTagMap'),
        actions: [
          IconButton(
            icon: const Icon(Icons.logout),
            onPressed: () async {
              final sessionManager = ref.read(sessionManagerProvider);
              await sessionManager.signOutDevice();
            },
          ),
        ],  
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // === БЛОК СОЗДАНИЯ ДАННЫХ ===
            _buildCreationSection(),
            const SizedBox(height: 20),

            // === БЛОК РАБОТЫ СО СВЯЗЯМИ ===
            _buildRelationSection(),
            const SizedBox(height: 20),

            // === БЛОК ОТОБРАЖЕНИЯ ДАННЫХ ===
            _buildDataDisplaySection(categoriesAsync, tasksAsync, tagsAsync),
          ],
        ),
      ),
    );
  }

  Widget _buildCreationSection() {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              '🔧 Создание данных',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),

            // Создание категории
            Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _categoryController,
                    decoration: const InputDecoration(
                      labelText: 'Название категории',
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
                const SizedBox(width: 8),
                ElevatedButton(
                  onPressed: _createCategory,
                  child: const Text('+ Категория'),
                ),
              ],
            ),
            const SizedBox(height: 12),

            // Создание задачи
            Row(
              children: [
                Expanded(
                  flex: 2,
                  child: TextField(
                    controller: _taskController,
                    decoration: const InputDecoration(
                      labelText: 'Название задачи',
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
                const SizedBox(width: 8),
                Expanded(flex: 1, child: _buildCategorySelector()),
                const SizedBox(width: 8),
                ElevatedButton(
                  onPressed: _createTask,
                  child: const Text('+ Задача'),
                ),
              ],
            ),
            const SizedBox(height: 12),

            // Создание тега
            Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _tagController,
                    decoration: const InputDecoration(
                      labelText: 'Название тега',
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
                const SizedBox(width: 8),
                ElevatedButton(
                  onPressed: _createTag,
                  child: const Text('+ Тег'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildRelationSection() {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              '🔗 Управление связями Task ↔ Tag',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),

            // Селекторы
            Row(
              children: [
                Expanded(child: _buildTaskSelector()),
                const SizedBox(width: 8),
                Expanded(child: _buildTagSelector()),
              ],
            ),
            const SizedBox(height: 12),

            // Кнопки действий
            Wrap(
              spacing: 8,
              runSpacing: 8,
              children: [
                ElevatedButton.icon(
                  onPressed:
                      (_selectedTaskId != null && _selectedTagId != null)
                          ? _addTagToTask
                          : null,
                  icon: const Icon(Icons.add, size: 16),
                  label: const Text('Связать', style: TextStyle(fontSize: 12)),
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 12,
                      vertical: 8,
                    ),
                    minimumSize: const Size(0, 32),
                  ),
                ),
                ElevatedButton.icon(
                  onPressed:
                      (_selectedTaskId != null && _selectedTagId != null)
                          ? _removeTagFromTask
                          : null,
                  icon: const Icon(Icons.remove, size: 16),
                  label: const Text(
                    'Разорвать',
                    style: TextStyle(fontSize: 12),
                  ),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.red[100],
                    padding: const EdgeInsets.symmetric(
                      horizontal: 12,
                      vertical: 8,
                    ),
                    minimumSize: const Size(0, 32),
                  ),
                ),
                ElevatedButton.icon(
                  onPressed:
                      _selectedTaskId != null ? _removeAllTagsFromTask : null,
                  icon: const Icon(Icons.clear_all, size: 16),
                  label: const Text('Очистить', style: TextStyle(fontSize: 12)),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.orange[100],
                    padding: const EdgeInsets.symmetric(
                      horizontal: 12,
                      vertical: 8,
                    ),
                    minimumSize: const Size(0, 32),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),

            // Отображение связей для выбранной задачи
            if (_selectedTaskId != null) ...[
              const Text(
                'Теги выбранной задачи:',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8),
              _buildRelatedTagsDisplay(_selectedTaskId!),
            ],
          ],
        ),
      ),
    );
  }

  Widget _buildTaskSelector() {
    final tasksAsync = ref.watch(tasksStreamProvider);

    return tasksAsync.when(
      data:
          (tasks) => DropdownButtonFormField<String>(
            value: _selectedTaskId,
            decoration: const InputDecoration(
              labelText: 'Задача',
              border: OutlineInputBorder(),
              contentPadding: EdgeInsets.symmetric(horizontal: 8, vertical: 8),
              labelStyle: TextStyle(fontSize: 12),
            ),
            style: const TextStyle(fontSize: 14, color: Colors.black87),
            isExpanded: true,
            items:
                tasks
                    .map(
                      (task) => DropdownMenuItem(
                        value: task.id,
                        child: Text(
                          task.title,
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(
                            fontSize: 14,
                            color: Colors.black87,
                          ),
                        ),
                      ),
                    )
                    .toList(),
            onChanged: (value) => setState(() => _selectedTaskId = value),
          ),
      loading:
          () => const SizedBox(
            height: 48,
            child: Center(child: CircularProgressIndicator()),
          ),
      error:
          (e, s) => Container(
            height: 48,
            child: Center(
              child: Text(
                'Ошибка: $e',
                style: const TextStyle(fontSize: 10, color: Colors.black87),
              ),
            ),
          ),
    );
  }

  Widget _buildTagSelector() {
    final tagsAsync = ref.watch(tagsStreamProvider);

    return tagsAsync.when(
      data:
          (tags) => DropdownButtonFormField<String>(
            value: _selectedTagId,
            decoration: const InputDecoration(
              labelText: 'Тег',
              border: OutlineInputBorder(),
              contentPadding: EdgeInsets.symmetric(horizontal: 8, vertical: 8),
              labelStyle: TextStyle(fontSize: 12),
            ),
            style: const TextStyle(fontSize: 14, color: Colors.black87),
            isExpanded: true,
            items:
                tags
                    .map(
                      (tag) => DropdownMenuItem(
                        value: tag.id,
                        child: Text(
                          tag.title,
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(
                            fontSize: 14,
                            color: Colors.black87,
                          ),
                        ),
                      ),
                    )
                    .toList(),
            onChanged: (value) => setState(() => _selectedTagId = value),
          ),
      loading:
          () => const SizedBox(
            height: 48,
            child: Center(child: CircularProgressIndicator()),
          ),
      error:
          (e, s) => Container(
            height: 48,
            child: Center(
              child: Text(
                'Ошибка: $e',
                style: const TextStyle(fontSize: 10, color: Colors.black87),
              ),
            ),
          ),
    );
  }

  Widget _buildRelatedTagsDisplay(String taskId) {
    final relatedTagsAsync = ref.watch(relatedTagsForTaskProvider(taskId));

    return relatedTagsAsync.when(
      data:
          (tags) => Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              border: Border.all(color: Colors.grey[300]!),
              borderRadius: BorderRadius.circular(8),
            ),
            child:
                tags.isEmpty
                    ? const Text('Нет связанных тегов')
                    : Wrap(
                      spacing: 8,
                      children:
                          tags
                              .map(
                                (tag) => Chip(
                                  label: Text(tag.title),
                                  backgroundColor: Colors.blue[100],
                                  onDeleted:
                                      () => _removeSpecificTagFromTask(tag.id),
                                ),
                              )
                              .toList(),
                    ),
          ),
      loading: () => const CircularProgressIndicator(),
      error: (e, s) => Text('Ошибка связей: $e'),
    );
  }

  Widget _buildDataDisplaySection(
    AsyncValue<List<CategoryEntity>> categoriesAsync,
    AsyncValue<List<TaskEntity>> tasksAsync,
    AsyncValue<List<TagEntity>> tagsAsync,
  ) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          '📊 Данные',
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 16),

        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Колонка категорий
            Expanded(
              child: Card(
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Категории',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(height: 8),
                      categoriesAsync.when(
                        data:
                            (categories) => Column(
                              children:
                                  categories
                                      .map(
                                        (cat) => Container(
                                          margin: const EdgeInsets.only(
                                            bottom: 4,
                                          ),
                                          padding: const EdgeInsets.all(8),
                                          decoration: BoxDecoration(
                                            border: Border.all(
                                              color: Colors.grey[300]!,
                                            ),
                                            borderRadius: BorderRadius.circular(
                                              4,
                                            ),
                                          ),
                                          child: Row(
                                            children: [
                                              Expanded(
                                                child: Text(
                                                  cat.title,
                                                  style: const TextStyle(
                                                    fontSize: 14,
                                                  ),
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                ),
                                              ),
                                              IconButton(
                                                icon: const Icon(
                                                  Icons.delete,
                                                  size: 16,
                                                ),
                                                onPressed:
                                                    () =>
                                                        _deleteCategory(cat.id),
                                                constraints:
                                                    const BoxConstraints(
                                                      minWidth: 32,
                                                      minHeight: 32,
                                                    ),
                                                padding: const EdgeInsets.all(
                                                  4,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      )
                                      .toList(),
                            ),
                        loading: () => const CircularProgressIndicator(),
                        error: (e, s) => Text('Ошибка: $e'),
                      ),
                    ],
                  ),
                ),
              ),
            ),

            // Колонка задач
            Expanded(
              child: Card(
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Задачи',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(height: 8),
                      tasksAsync.when(
                        data:
                            (tasks) => Column(
                              children:
                                  tasks
                                      .map(
                                        (task) => Container(
                                          margin: const EdgeInsets.only(
                                            bottom: 4,
                                          ),
                                          padding: const EdgeInsets.all(8),
                                          decoration: BoxDecoration(
                                            border: Border.all(
                                              color: Colors.grey[300]!,
                                            ),
                                            borderRadius: BorderRadius.circular(
                                              4,
                                            ),
                                            color:
                                                _selectedTaskId == task.id
                                                    ? Colors.blue[50]
                                                    : null,
                                          ),
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Row(
                                                children: [
                                                  Expanded(
                                                    child: Text(
                                                      task.title,
                                                      style: const TextStyle(
                                                        fontSize: 14,
                                                        fontWeight:
                                                            FontWeight.w500,
                                                      ),
                                                      overflow:
                                                          TextOverflow.ellipsis,
                                                    ),
                                                  ),
                                                  IconButton(
                                                    icon: const Icon(
                                                      Icons.delete,
                                                      size: 16,
                                                    ),
                                                    onPressed:
                                                        () => _deleteTask(
                                                          task.id,
                                                        ),
                                                    constraints:
                                                        const BoxConstraints(
                                                          minWidth: 32,
                                                          minHeight: 32,
                                                        ),
                                                    padding:
                                                        const EdgeInsets.all(4),
                                                  ),
                                                ],
                                              ),
                                              Text(
                                                'ID: ${task.id.substring(0, 8)}...',
                                                style: TextStyle(
                                                  fontSize: 10,
                                                  color: Colors.grey[600],
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      )
                                      .toList(),
                            ),
                        loading: () => const CircularProgressIndicator(),
                        error: (e, s) => Text('Ошибка: $e'),
                      ),
                    ],
                  ),
                ),
              ),
            ),

            // Колонка тегов
            Expanded(
              child: Card(
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Теги',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(height: 8),
                      tagsAsync.when(
                        data:
                            (tags) => Column(
                              children:
                                  tags
                                      .map(
                                        (tag) => Container(
                                          margin: const EdgeInsets.only(
                                            bottom: 4,
                                          ),
                                          padding: const EdgeInsets.all(8),
                                          decoration: BoxDecoration(
                                            border: Border.all(
                                              color: Colors.grey[300]!,
                                            ),
                                            borderRadius: BorderRadius.circular(
                                              4,
                                            ),
                                            color:
                                                _selectedTagId == tag.id
                                                    ? Colors.green[50]
                                                    : null,
                                          ),
                                          child: Row(
                                            children: [
                                              Expanded(
                                                child: Text(
                                                  tag.title,
                                                  style: const TextStyle(
                                                    fontSize: 14,
                                                  ),
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                ),
                                              ),
                                              IconButton(
                                                icon: const Icon(
                                                  Icons.delete,
                                                  size: 16,
                                                ),
                                                onPressed:
                                                    () => _deleteTag(tag.id),
                                                constraints:
                                                    const BoxConstraints(
                                                      minWidth: 32,
                                                      minHeight: 32,
                                                    ),
                                                padding: const EdgeInsets.all(
                                                  4,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      )
                                      .toList(),
                            ),
                        loading: () => const CircularProgressIndicator(),
                        error: (e, s) => Text('Ошибка: $e'),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }

  // === МЕТОДЫ СОЗДАНИЯ ===
  Future<void> _createCategory() async {
    if (_categoryController.text.trim().isEmpty) return;

    final currentUser = ref.read(currentUserProvider);
    final currentCustomerId = ref.read(currentCustomerIdProvider);

    if (currentUser?.id == null || currentCustomerId == null) return;

    try {
      // вызываем usecase который дергаем метод в репозитории категорий
      final useCase = ref.read(createCategoryUseCaseProvider);
      if (useCase == null) return;

      final category = CategoryEntity(
        id: const Uuid().v7(),        
        userId: currentUser!.id!,
        customerId: currentCustomerId,
        createdAt: DateTime.now(),
        lastModified: DateTime.now(),
        title: _categoryController.text.trim(),
      );

      await useCase(category);
      _categoryController.clear();
      print('✅ Категория создана: ${category.title}');
      await Future.delayed(const Duration(milliseconds: 150));
    } catch (e) {
      print('❌ Ошибка создания категории: $e');
    }
  }

  Future<void> _createTask() async {
    if (_taskController.text.trim().isEmpty) return;

    final currentUser = ref.read(currentUserProvider);
final currentCustomerId = ref.read(currentCustomerIdProvider);

    if (currentUser?.id == null || currentCustomerId == null) return;

    try {
      final useCase = ref.read(createTaskUseCaseProvider);
      if (useCase == null) return;

      final task = TaskEntity(
        id: const Uuid().v7(),
        userId: currentUser!.id!,
        customerId: currentCustomerId,
        createdAt: DateTime.now(),
        lastModified: DateTime.now(),
        title: _taskController.text.trim(),
        categoryId: _selectedCategoryId,
      );

      await useCase(task);
      _taskController.clear();
      print('✅ Задача создана: ${task.title}');
      await Future.delayed(const Duration(milliseconds: 150));
    } catch (e) {
      print('❌ Ошибка создания задачи: $e');
    }
  }

  Future<void> _createTag() async {
    if (_tagController.text.trim().isEmpty) return;

    final currentUser = ref.read(currentUserProvider);
final currentCustomerId = ref.read(currentCustomerIdProvider);

    if (currentUser?.id == null || currentCustomerId == null) return;


    try {
      final useCase = ref.read(createTagUseCaseProvider);
      if (useCase == null) return;

      final tag = TagEntity(
        id: const Uuid().v7(),
        userId: currentUser!.id!,
        customerId: currentCustomerId,
        createdAt: DateTime.now(),
        lastModified: DateTime.now(),
        title: _tagController.text.trim(),
      );

      await useCase(tag);
      _tagController.clear();
      print('✅ Тег создан: ${tag.title}');
      await Future.delayed(const Duration(milliseconds: 150));
    } catch (e) {
      print('❌ Ошибка создания тега: $e');
    }
  }

  // === МЕТОДЫ УДАЛЕНИЯ ===
  Future<void> _deleteCategory(String id) async {
    try {
      final useCase = ref.read(deleteCategoryUseCaseProvider);
      if (useCase == null) return;

      await useCase(id);
      print('✅ Категория удалена: $id');
    } catch (e) {
      print('❌ Ошибка удаления категории: $e');
    }
  }

  Future<void> _deleteTask(String id) async {
    try {
      final useCase = ref.read(deleteTaskUseCaseProvider);
      if (useCase == null) return;

      await useCase(id);
      print('✅ Задача удалена: $id');
    } catch (e) {
      print('❌ Ошибка удаления задачи: $e');
    }
  }

  Future<void> _deleteTag(String id) async {
    try {
      final useCase = ref.read(deleteTagUseCaseProvider);
      if (useCase == null) return;

      await useCase(id);
      print('✅ Тег удален: $id');
    } catch (e) {
      print('❌ Ошибка удаления тега: $e');
    }
  }

  // === МЕТОДЫ РАБОТЫ СО СВЯЗЯМИ ===
  Future<void> _addTagToTask() async {
    if (_selectedTaskId == null || _selectedTagId == null) return;

    try {
      final notifier = ref.read(
        relatedTagsForTaskProvider(_selectedTaskId!).notifier,
      );
      await notifier.addTag(tagId: _selectedTagId!);
      print('✅ Тег $_selectedTagId добавлен к задаче $_selectedTaskId');
      await Future.delayed(const Duration(milliseconds: 150));
    } catch (e) {
      print('❌ Ошибка добавления тега к задаче: $e');
    }
  }

  Future<void> _removeTagFromTask() async {
    if (_selectedTaskId == null || _selectedTagId == null) return;

    try {
      final notifier = ref.read(
        relatedTagsForTaskProvider(_selectedTaskId!).notifier,
      );
      await notifier.removeTag(tagId: _selectedTagId!);
      print('✅ Тег $_selectedTagId удален из задачи $_selectedTaskId');
      await Future.delayed(const Duration(milliseconds: 150));
    } catch (e) {
      print('❌ Ошибка удаления тега из задачи: $e');
    }
  }

  Future<void> _removeSpecificTagFromTask(String tagId) async {
    if (_selectedTaskId == null) return;

    print('🔍 Удаляем тег $tagId из задачи $_selectedTaskId');

    try {
      final notifier = ref.read(
        relatedTagsForTaskProvider(_selectedTaskId!).notifier,
      );
      await notifier.removeTag(tagId: tagId);

      print('✅ Тег $tagId удален из задачи $_selectedTaskId');
      await Future.delayed(const Duration(milliseconds: 200));
    } catch (e) {
      print('❌ Ошибка удаления тега из задачи: $e');
    }
  }

  Future<void> _removeAllTagsFromTask() async {
    if (_selectedTaskId == null) return;

    try {
      // 1. Получаем UseCase через провайдер
      final useCase = ref.read(removeAllTagsFromTaskUseCaseProvider);
      if (useCase == null) return;

      // 2. Вызываем UseCase с ID выбранной задачи
      await useCase(_selectedTaskId!);
      print('✅ Запрошена очистка всех тегов для задачи $_selectedTaskId');

      // 3. Обновляем UI, перезагрузив связанные теги
      // Notifier сам обновит свое состояние, когда данные в базе изменятся,
      // но для мгновенного отклика можно сделать так:
      ref.invalidate(relatedTagsForTaskProvider(_selectedTaskId!));

      await Future.delayed(const Duration(milliseconds: 150));
    } catch (e) {
      print('❌ Ошибка удаления всех тегов из задачи: $e');
    }
  }

  Widget _buildCategorySelector() {
    final categoriesAsync = ref.watch(categoriesStreamProvider);

    return categoriesAsync.when(
      data:
          (categories) => DropdownButtonFormField<String>(
            value: _selectedCategoryId,
            decoration: const InputDecoration(
              labelText: 'Категория',
              border: OutlineInputBorder(),
              contentPadding: EdgeInsets.symmetric(horizontal: 8, vertical: 8),
              labelStyle: TextStyle(fontSize: 12),
            ),
            style: const TextStyle(fontSize: 14, color: Colors.black87),
            isExpanded: true, // Важно для предотвращения переполнения
            items: [
              const DropdownMenuItem(
                value: null,
                child: Text('Без категории', style: TextStyle(fontSize: 14)),
              ),
              ...categories.map(
                (category) => DropdownMenuItem(
                  value: category.id,
                  child: Text(
                    category.title,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(fontSize: 14, color: Colors.black87),
                  ),
                ),
              ),
            ],
            onChanged: (value) => setState(() => _selectedCategoryId = value),
          ),
      loading:
          () => const SizedBox(
            height: 48, // Уменьшаем высоту
            child: Center(child: CircularProgressIndicator()),
          ),
      error:
          (e, s) => Container(
            height: 48, // Уменьшаем высоту
            padding: const EdgeInsets.all(4),
            decoration: BoxDecoration(
              border: Border.all(color: Colors.red),
              borderRadius: BorderRadius.circular(4),
            ),
            child: Center(
              child: Text(
                'Ошибка: $e',
                style: const TextStyle(fontSize: 10, color: Colors.black87),
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ),
    );
  }
}
