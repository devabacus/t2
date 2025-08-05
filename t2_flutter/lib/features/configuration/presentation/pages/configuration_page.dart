// manifest: startProject
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:uuid/uuid.dart';
import '../../../../core/providers/session_manager_provider.dart';
import '../../domain/entities/configuration/configuration_entity.dart';
import '../../domain/providers/configuration/configuration_usecase_providers.dart';
import '../models/setting_view_model.dart';
import '../providers/configuration/configuration_state_providers.dart';
import '../providers/settings_mapper.dart';
import '../widgets/settings_screen_widget.dart';

class ConfigurationPage extends ConsumerWidget {
  const ConfigurationPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final configurationsAsync = ref.watch(configurationsStreamProvider);
    final mapper = ref.watch(settingsMapperProvider);

    return configurationsAsync.when(
      data: (configs) {
        // 1. Преобразуем данные в модель экрана
        final screenModel = mapper.mapToScreen(configs);

        // 2. Определяем, что делать при изменении настройки
        onSettingChanged(String key, dynamic value) {
          final useCase = ref.read(updateConfigurationUseCaseProvider);
          final config = configs.firstWhere((c) => c.key == key, orElse: () => throw Exception('Config not found'));
          if (useCase != null) {
            useCase(config.copyWith(value: value.toString()));
          }
        }

        // 3. Отображаем наш переиспользуемый виджет
        return SettingsScreenWidget(
          screenModel: screenModel,
          onSettingChanged: onSettingChanged,
        );
      },
      loading: () => const Scaffold(body: Center(child: CircularProgressIndicator())),
      error: (e, s) => Scaffold(body: Center(child: Text('Ошибка загрузки: $e'))),
    );
  }

  Widget _buildSettingTile(BuildContext context, WidgetRef ref, SettingViewModel model) {
    // Используем pattern-matching (when) из Freezed для безопасной отрисовки
    return model.when(
      boolean: (key, displayName, group, value) => SwitchListTile(
        title: Text(displayName),
        value: value,
        onChanged: (newValue) {
          final useCase = ref.read(updateConfigurationUseCaseProvider);
          final config = ref.watch(configurationsStreamProvider).value?.firstWhere((c) => c.key == key);
          if (useCase != null && config != null) {
            useCase(config.copyWith(value: newValue.toString()));
          }
        },
      ),
      options: (key, displayName, group, currentValue, options) => ListTile(
        title: Text(displayName),
        subtitle: Text(currentValue),
        trailing: const Icon(Icons.arrow_drop_down),
        onTap: () async {
          final selectedValue = await showDialog<String>(
            context: context,
            builder: (context) => SimpleDialog(
              title: Text(displayName),
              children: options.map((option) => SimpleDialogOption(
                onPressed: () => Navigator.pop(context, option),
                child: Text(option),
              )).toList(),
            ),
          );
          if (selectedValue != null) {
            final useCase = ref.read(updateConfigurationUseCaseProvider);
            final config = ref.watch(configurationsStreamProvider).value?.firstWhere((c) => c.key == key);
            if (useCase != null && config != null) {
              useCase(config.copyWith(value: selectedValue));
            }
          }
        },
      ),
      string: (key, displayName, group, value) => ListTile(
        title: Text(displayName),
        subtitle: Text(value),
        trailing: const Icon(Icons.edit),
        onTap: () async {
            // --- НАЧАЛО ИЗМЕНЕНИЙ ---
            final textController = TextEditingController(text: value);
            final newValue = await showDialog<String>(
              context: context,
              builder: (context) => AlertDialog(
                title: Text('Изменить "$displayName"'),
                content: TextField(
                  controller: textController,
                  autofocus: true,
                ),
                actions: [
                  TextButton(
                    onPressed: () => Navigator.pop(context),
                    child: const Text('Отмена'),
                  ),
                  ElevatedButton(
                    onPressed: () => Navigator.pop(context, textController.text),
                    child: const Text('Сохранить'),
                  ),
                ],
              ),
            );

            if (newValue != null && newValue.isNotEmpty) {
              final useCase = ref.read(updateConfigurationUseCaseProvider);
              final config = ref.watch(configurationsStreamProvider).value?.firstWhere((c) => c.key == key);
              if (useCase != null && config != null) {
                useCase(config.copyWith(value: newValue));
              }
            }
            // --- КОНЕЦ ИЗМЕНЕНИЙ ---
        },
      ),
      unsupported: (key, displayName, group) => ListTile(
        title: Text(displayName),
        subtitle: Text('Ключ: $key'),
        leading: const Icon(Icons.warning_amber, color: Colors.orange),
      ),
    );
  }
  
  // Временный метод для создания настроек для тестирования
  void _createTestSettings(WidgetRef ref) {
    final createUseCase = ref.read(createConfigurationUseCaseProvider);
    if (createUseCase == null) return;
    
    // Получаем текущего пользователя для привязки настроек
    final currentUser = ref.read(currentUserProvider);
    final customerId = ref.read(currentCustomerIdProvider);
    if(currentUser == null || customerId == null) return;

    // Используем Future.wait для асинхронного создания
    Future.wait([
        createUseCase(ConfigurationEntity(id: const Uuid().v7(), userId: currentUser.id!, customerId: customerId, createdAt: DateTime.now(), lastModified: DateTime.now(), group: 'UI', key: 'themeMode', value: 'system')),
        createUseCase(ConfigurationEntity(id: const Uuid().v7(), userId: currentUser.id!, customerId: customerId, createdAt: DateTime.now(), lastModified: DateTime.now(), group: 'UI', key: 'themeOptions', value: 'system;light;dark')),
        createUseCase(ConfigurationEntity(id: const Uuid().v7(), userId: currentUser.id!, customerId: customerId, createdAt: DateTime.now(), lastModified: DateTime.now(), group: 'UI', key: 'enableAnimations', value: 'true')),
        createUseCase(ConfigurationEntity(id: const Uuid().v7(), userId: currentUser.id!, customerId: customerId, createdAt: DateTime.now(), lastModified: DateTime.now(), group: 'Profile', key: 'username', value: 'Test User')),
    ]);
  }
}  