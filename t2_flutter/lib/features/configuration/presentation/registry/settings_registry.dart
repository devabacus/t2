// manifest: startProject
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'audio_settings.dart';
import 'setting_definition.dart';
import 'ui_settings.dart';
import 'profile_settings.dart';

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
  // При первом создании провайдера создаем и наполняем реестр
  final registry = SettingsRegistry();
  registry.registerAll(getUiSettings());
  registry.registerAll(getProfileSettings());
  registry.registerAll(getAudioSettings());
  // В будущем вы просто добавите сюда вызов register... для новых групп
  return registry;
}