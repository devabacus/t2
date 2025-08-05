// manifest: startProject
import 'package:flutter/material.dart';
import '../models/settings_screen_model.dart';
import '../models/setting_view_model.dart';

// Тип для колбэка, который будет вызываться при изменении настройки
typedef OnSettingChanged = void Function(String key, dynamic value);

class SettingsScreenWidget extends StatelessWidget {
  final SettingsScreenModel screenModel;
  final OnSettingChanged onSettingChanged;

  const SettingsScreenWidget({
    super.key,
    required this.screenModel,
    required this.onSettingChanged,
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
          );
        },
      ),
    );
  }
}

// Внутренний виджет для секции
class _SettingsSectionWidget extends StatelessWidget {
  final SettingsSectionModel section;
  final OnSettingChanged onSettingChanged;

  const _SettingsSectionWidget({required this.section, required this.onSettingChanged});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Text(
            section.title,
            style: Theme.of(context).textTheme.titleLarge?.copyWith(
              color: Theme.of(context).colorScheme.primary,
            ),
          ),
        ),
        ...section.settings.map((setting) => _buildSettingTile(context, setting)),
        const Divider(),
      ],
    );
  }

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
          // --- НАЧАЛО ИСПРАВЛЕНИЯ ---
          final selected = await showDialog<String>(
            context: context, // Добавлен обязательный context
            builder: (BuildContext context) { // Добавлен обязательный builder
              return SimpleDialog(
                title: Text('Выбрать "$displayName"'),
                children: options.map((option) {
                  return SimpleDialogOption(
                    onPressed: () {
                      Navigator.pop(context, option);
                    },
                    child: Text(option),
                  );
                }).toList(),
              );
            },
          );
          // --- КОНЕЦ ИСПРАВЛЕНИЯ ---
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
           // Логика диалога редактирования текста
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
      unsupported: (key, displayName, group) => ListTile(
        title: Text(displayName, style: TextStyle(color: Colors.grey)),
        subtitle: Text('Неподдерживаемый тип: $key'),
        leading: const Icon(Icons.warning_amber, color: Colors.orange),
      ),
    );
  }
}