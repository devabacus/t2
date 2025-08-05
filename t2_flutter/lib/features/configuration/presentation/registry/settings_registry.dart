// manifest: startProject
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'setting_definition.dart';
import '../user_settings/groups/groups_list.dart';

part 'settings_registry.g.dart';

/// Центральный реестр для всех определений настроек в приложении.
class SettingsRegistry {
  final Map<String, SettingDefinition> _definitions = {};

  /// Регистрирует один "чертёж" настройки.
  void register(SettingDefinition definition) {
    if (_definitions.containsKey(definition.key)) {
      // Можно добавить логирование для отладки дубликатов
      return;
    }
    _definitions[definition.key] = definition;
  }
  
  /// Регистрирует список "чертежей".
  void registerAll(List<SettingDefinition> definitions) {
    for (final def in definitions) {
      register(def);
    }
  }

  /// Находит "чертёж" по ключу.
  SettingDefinition? find(String key) => _definitions[key];

  /// Возвращает все "чертежи".
  List<SettingDefinition> getAll() => _definitions.values.toList();
}

@Riverpod(keepAlive: true)
SettingsRegistry settingsRegistry(Ref ref) {
  final registry = SettingsRegistry();
  final groups = ref.watch(settingGroupsProvider);
  for (final group in groups) {
    registry.registerAll(group.definitions());
  }
  return registry;
}