// manifest: startProject
import 'package:flutter/material.dart';
import '../models/settings_screen_model.dart';
import '../models/setting_view_model.dart';

/// Колбэк для уведомления об изменении значения настройки.
typedef OnSettingChanged = void Function(String key, dynamic value);

/// Колбэк для уведомления о том, что пользователь выбрал группу для перехода.
typedef OnGroupSelected = void Function(String groupKey);

/// Универсальный виджет, который отрисовывает экран настроек
/// на основе декларативной модели [screenModel].
class SettingsScreenWidget extends StatelessWidget {
  final SettingsScreenModel screenModel;
  final OnSettingChanged onSettingChanged;
  final OnGroupSelected? onGroupSelected;

  const SettingsScreenWidget({
    super.key,
    required this.screenModel,
    required this.onSettingChanged,
    this.onGroupSelected,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(screenModel.title),
      ),
      body: ListView.builder(
        itemCount: screenModel.sections.length,
        itemBuilder: (context, index) {
          final section = screenModel.sections[index];
          return _SettingsSectionWidget(
            section: section,
            onSettingChanged: onSettingChanged,
            onGroupSelected: onGroupSelected,
          );
        },
      ),
    );
  }
}

/// Внутренний виджет для отрисовки одной секции настроек.
class _SettingsSectionWidget extends StatelessWidget {
  final SettingsSectionModel section;
  final OnSettingChanged onSettingChanged;
  final OnGroupSelected? onGroupSelected;

  const _SettingsSectionWidget({
    required this.section,
    required this.onSettingChanged,
    this.onGroupSelected,
  });

  @override
  Widget build(BuildContext context) {
    // Не рисуем ничего, если в секции нет настроек
    if (section.settings.isEmpty) {
      return const SizedBox.shrink();
    }
    
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(16, 24, 16, 8),
          child: Text(
            section.title,
            style: Theme.of(context).textTheme.titleSmall?.copyWith(
                  color: Theme.of(context).colorScheme.primary,
                  fontWeight: FontWeight.bold,
                ),
          ),
        ),
        ...section.settings.map((setting) => _buildSettingTile(context, setting)),
        const Divider(height: 1),
      ],
    );
  }

  /// Метод-фабрика, который создает виджет для конкретной настройки,
  /// используя паттерн-матчинг из Freezed.
  Widget _buildSettingTile(BuildContext context, SettingViewModel model) {
    return model.when(
      boolean: (key, displayName, group, value) => SwitchListTile(
        title: Text(displayName),
        value: value,
        onChanged: (newValue) => onSettingChanged(key, newValue),
      ),
      options: (key, displayName, group, currentValue, options) => ListTile(
        title: Text(displayName),
        subtitle: Text(currentValue),
        trailing: const Icon(Icons.arrow_drop_down),
        onTap: () async {
          final selected = await showDialog<String>(
            context: context,
            builder: (BuildContext context) {
              return SimpleDialog(
                title: Text('Выбрать "$displayName"'),
                children: options.map((option) {
                  return SimpleDialogOption(
                    onPressed: () {
                      Navigator.pop(context, option);
                    },
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8.0),
                      child: Text(option),
                    ),
                  );
                }).toList(),
              );
            },
          );
          if (selected != null) {
            onSettingChanged(key, selected);
          }
        },
      ),
      string: (key, displayName, group, value) => ListTile(
        title: Text(displayName),
        subtitle: Text(value),
        trailing: const Icon(Icons.edit),
        onTap: () async {
          final textController = TextEditingController(text: value);
          final newValue = await showDialog<String>(
            context: context,
            builder: (context) => AlertDialog(
              title: Text('Изменить "$displayName"'),
              content: TextField(controller: textController, autofocus: true),
              actions: [
                TextButton(onPressed: () => Navigator.pop(context), child: const Text('Отмена')),
                ElevatedButton(onPressed: () => Navigator.pop(context, textController.text), child: const Text('Сохранить')),
              ],
            ),
          );
          if (newValue != null && newValue.isNotEmpty) {
            onSettingChanged(key, newValue);
          }
        },
      ),
      group: (key, displayName, group) => ListTile(
        title: Text(displayName),
        trailing: const Icon(Icons.arrow_forward_ios, size: 16),
        onTap: () => onGroupSelected?.call(key),
      ),
      unsupported: (key, displayName, group) => ListTile(
        title: Text(displayName, style: TextStyle(color: Theme.of(context).disabledColor)),
        subtitle: Text('Неподдерживаемый тип: $key'),
        leading: Icon(Icons.warning_amber, color: Colors.orange.shade300),
      ),
    );
  }
}