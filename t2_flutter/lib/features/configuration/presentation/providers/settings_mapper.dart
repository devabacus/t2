// manifest: startProject
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:t2/features/configuration/domain/entities/configuration/configuration_entity.dart';
import '../models/setting_view_model.dart';
import '../models/settings_screen_model.dart';

part 'settings_mapper.g.dart';

/// Ключи настроек для избежания "магических строк".
/// Каждому ключу также сопоставлена его группа.
enum SettingKey {
  themeMode('themeMode', 'UI'),
  themeOptions('themeOptions', 'UI'),
  enableAnimations('enableAnimations', 'UI'),
  username('username', 'Profile');

  const SettingKey(this.key, this.group);
  final String key;
  final String group;
}

/// Класс, отвечающий за преобразование "сырых" данных о конфигурации
/// в готовые модели представления (ViewModel) для UI.
class SettingsMapper {
  /// Главный метод-фабрика для создания модели экрана.
  /// Принимает список всех конфигураций и необязательный ключ группы.
  /// Если [groupKey] не указан, создает корневой экран со списком групп.
  /// Если [groupKey] указан, создает экран с настройками для этой группы.
  SettingsScreenModel mapToScreen(List<ConfigurationEntity> configs, {String? groupKey}) {
    if (groupKey == null) {
      return _mapToRootScreen(configs);
    } else {
      return _mapToGroupScreen(configs, groupKey);
    }
  }

  /// Создает модель для корневого экрана настроек (список групп).
  SettingsScreenModel _mapToRootScreen(List<ConfigurationEntity> configs) {
    // Находим все уникальные группы в конфигурациях
    final groups = configs.map((c) => c.group).toSet();

    // Преобразуем каждую группу в ViewModel для навигации
    final groupViewModels = groups.map((groupKey) {
      return SettingViewModel.group(
        key: groupKey,
        displayName: _getGroupDisplayName(groupKey),
        group: 'root', // Указываем, что это элемент корневого экрана
      );
    }).toList();

    return SettingsScreenModel(
      title: 'Настройки',
      sections: [
        SettingsSectionModel(title: 'Категории', settings: groupViewModels),
      ],
    );
  }

  /// Создает модель для экрана конкретной группы настроек.
  SettingsScreenModel _mapToGroupScreen(List<ConfigurationEntity> configs, String groupKey) {
    // Фильтруем настройки, относящиеся только к выбранной группе
    final settingsForGroup = configs.where((c) => c.group == groupKey).toList();
    // Преобразуем их в конкретные ViewModel (Switch, Options и т.д.)
    final viewModels = _mapEntitiesToViewModels(settingsForGroup);

    return SettingsScreenModel(
      title: _getGroupDisplayName(groupKey),
      sections: [
        SettingsSectionModel(title: 'Параметры', settings: viewModels),
      ],
    );
  }

  /// Преобразует список ConfigurationEntity в список конкретных SettingViewModel.
  List<SettingViewModel> _mapEntitiesToViewModels(List<ConfigurationEntity> configs) {
    final configMap = {for (var c in configs) c.key: c};
    final viewModels = <SettingViewModel>[];

    // Проходимся по всем известным ключам и пытаемся создать для них ViewModel
    for (final settingKey in SettingKey.values) {
      final config = configMap[settingKey.key];
      if (config != null) {
        final vm = _mapSingle(config, configMap);
        if (vm != null) {
          viewModels.add(vm);
        }
      }
    }
    
    return viewModels;
  }

  /// Преобразует одну сущность `ConfigurationEntity` в `SettingViewModel`.
  /// Здесь происходит основная логика валидации и определения типа.
  SettingViewModel? _mapSingle(ConfigurationEntity config, Map<String, ConfigurationEntity> allConfigs) {
    switch (config.key) {
      case 'themeMode':
        final optionsConfig = allConfigs[SettingKey.themeOptions.key];
        // Валидация: убеждаемся, что значение опций существует
        final options = optionsConfig?.value.split(';') ?? ['system', 'light', 'dark'];
        return OptionsSettingViewModel(
          key: config.key,
          displayName: 'Тема приложения',
          group: config.group,
          currentValue: config.value,
          options: options,
        );
      
      case 'enableAnimations':
        // Валидация: значение должно быть 'true' или 'false'
        if (config.value != 'true' && config.value != 'false') {
          return null; // Возвращаем null, если данные некорректны
        }
        return BooleanSettingViewModel(
          key: config.key,
          displayName: 'Включить анимации',
          group: config.group,
          value: config.value == 'true',
        );

      case 'username':
        return StringSettingViewModel(
          key: config.key,
          displayName: 'Имя пользователя',
          group: config.group,
          value: config.value,
        );

      // 'themeOptions' - это служебная настройка, она не должна отображаться как отдельный элемент
      case 'themeOptions':
        return null; 
        
      default:
        // Если ключ неизвестен, возвращаем неподдерживаемый тип
        return UnsupportedSettingViewModel(
          key: config.key, 
          displayName: 'Неизвестная настройка',
          group: config.group
        );
    }
  }
  
  /// Вспомогательный метод для получения человеко-читаемых названий групп.
  String _getGroupDisplayName(String groupKey) {
    switch (groupKey) {
      case 'UI':
        return 'Интерфейс';
      case 'Profile':
        return 'Профиль';
      case 'Audio':
        return 'Звук';
      default:
        return groupKey; // Возвращаем как есть, если нет совпадения
    }
  }
}

/// Провайдер Riverpod для доступа к экземпляру SettingsMapper.
@riverpod
SettingsMapper settingsMapper(SettingsMapperRef ref) {
  return SettingsMapper();
}