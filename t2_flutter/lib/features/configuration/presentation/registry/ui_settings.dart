// manifest: startProject
import 'setting_definition.dart';

/// Возвращает список всех определений настроек для группы "UI".
List<SettingDefinition> getUiSettings() {
  return [
    // Настройка темы
    OptionsSettingDefinition(
      key: 'themeMode',
      group: 'UI',
      displayName: 'Тема приложения',
      defaultValue: 'system',
      optionsKey: 'themeOptions', // Указываем, где искать опции
      defaultOptions: ['system', 'light', 'dark'],
    ),
    
    // Настройка анимаций
    BooleanSettingDefinition(
      key: 'enableAnimations',
      group: 'UI',
      displayName: 'Включить анимации',
      defaultValue: true,
    ),

    BooleanSettingDefinition(
      key: 'newBooleanSettings',
      group: 'UI',
      displayName: 'Новая булева настройка',
      defaultValue: false,
    ),
  ];
}