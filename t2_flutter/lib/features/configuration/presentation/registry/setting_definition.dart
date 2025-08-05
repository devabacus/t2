// manifest: startProject
import 'package:t2/features/configuration/domain/entities/configuration/configuration_entity.dart';
import 'package:t2/features/configuration/presentation/models/setting_view_model.dart';

// Функция-маппер, которая преобразует сырые данные в ViewModel
typedef SettingViewModelMapper = SettingViewModel? Function(
  SettingDefinition definition,
  ConfigurationEntity? config,
  Map<String, ConfigurationEntity> allConfigs,
);

/// Абстрактный базовый класс для всех "чертежей" настроек.
abstract class SettingDefinition {
  final String key;
  final String group;
  final String displayName;
  final String defaultValue;

  SettingDefinition({
    required this.key,
    required this.group,
    required this.displayName,
    required this.defaultValue,
  });

  /// Главный метод, который создает ViewModel.
  /// Логика его реализации будет уникальной для каждого типа настройки.
  SettingViewModel? buildViewModel(
    ConfigurationEntity? config,
    Map<String, ConfigurationEntity> allConfigs,
  );
}

/// "Чертёж" для булевой настройки (переключатель).
class BooleanSettingDefinition extends SettingDefinition {
  BooleanSettingDefinition({
    required super.key,
    required super.group,
    required super.displayName,
    required bool defaultValue, // 1. Принимаем как обычный bool
  }) : super(defaultValue: defaultValue.toString()); // 2. Преобразуем в строку здесь

  @override
  SettingViewModel? buildViewModel(
    ConfigurationEntity? config,
    Map<String, ConfigurationEntity> allConfigs,
  ) {
    final value = config?.value ?? defaultValue;
    return BooleanSettingViewModel(
      key: key,
      displayName: displayName,
      group: group,
      value: value == 'true',
    );
  }
}

/// "Чертёж" для настройки с выбором из списка.
class OptionsSettingDefinition extends SettingDefinition {
  final String optionsKey; // Ключ, по которому хранятся сами опции
  final List<String> defaultOptions;

  OptionsSettingDefinition({
    required super.key,
    required super.group,
    required super.displayName,
    required super.defaultValue,
    required this.optionsKey,
    this.defaultOptions = const [],
  });

  @override
  SettingViewModel? buildViewModel(
    ConfigurationEntity? config,
    Map<String, ConfigurationEntity> allConfigs,
  ) {
    final optionsConfig = allConfigs[optionsKey];
    return OptionsSettingViewModel(
      key: key,
      displayName: displayName,
      group: group,
      currentValue: config?.value ?? defaultValue,
      options: optionsConfig?.value.split(';') ?? defaultOptions,
    );
  }
}

/// "Чертёж" для текстовой настройки.
class StringSettingDefinition extends SettingDefinition {
  StringSettingDefinition({
    required super.key,
    required super.group,
    required super.displayName,
    required super.defaultValue,
  });

  @override
  SettingViewModel? buildViewModel(
    ConfigurationEntity? config,
    Map<String, ConfigurationEntity> allConfigs,
  ) {
    return StringSettingViewModel(
      key: key,
      displayName: displayName,
      group: group,
      value: config?.value ?? defaultValue,
    );
  }
}

// --- НОВЫЙ ТИП: ВЫБОР НЕСКОЛЬКИХ ОПЦИЙ ---
/// "Чертёж" для настройки с выбором нескольких значений.
class MultiSelectSettingDefinition extends SettingDefinition {
  final String optionsKey; // Ключ, где хранятся все возможные варианты
  final List<String> defaultOptions;

  MultiSelectSettingDefinition({
    required super.key,
    required super.group,
    required super.displayName,
    required super.defaultValue, // Значения по умолчанию через ";"
    required this.optionsKey,
    this.defaultOptions = const [],
  });

  @override
  SettingViewModel? buildViewModel(
    ConfigurationEntity? config,
    Map<String, ConfigurationEntity> allConfigs,
  ) {
    final optionsConfig = allConfigs[optionsKey];
    final currentValue = config?.value ?? defaultValue;

    return MultiSelectSettingViewModel(
      key: key,
      displayName: displayName,
      group: group,
      // Преобразуем строку "a;b;c" в список
      currentValues: currentValue.isEmpty ? {} : currentValue.split(';').toSet(),
      // Получаем все возможные варианты
      options: optionsConfig?.value.split(';') ?? defaultOptions,
    );
  }
}

// --- НОВЫЙ ТИП: ВВОД ЧИСЛА ---
/// "Чертёж" для числовой настройки.
class NumberSettingDefinition extends SettingDefinition {
  NumberSettingDefinition({
    required super.key,
    required super.group,
    required super.displayName,
    required num defaultValue,
  }) : super(defaultValue: defaultValue.toString());

  @override
  SettingViewModel? buildViewModel(
    ConfigurationEntity? config,
    Map<String, ConfigurationEntity> allConfigs,
  ) {
    final value = num.tryParse(config?.value ?? defaultValue);
    if (value == null) return null; // Валидация

    return NumberSettingViewModel(
      key: key,
      displayName: displayName,
      group: group,
      value: value,
    );
  }
}


class SliderSettingDefinition extends SettingDefinition {
  final double min;
  final double max;
  final int? divisions; // Количество шагов на слайдере

  SliderSettingDefinition({
    required super.key,
    required super.group,
    required super.displayName,
    required double defaultValue,
    this.min = 0.0,
    this.max = 100.0,
    this.divisions,
  }) : super(defaultValue: defaultValue.toString());

  @override
  SettingViewModel? buildViewModel(
    ConfigurationEntity? config,
    Map<String, ConfigurationEntity> allConfigs,
  ) {
    final value = double.tryParse(config?.value ?? defaultValue);
    if (value == null) return null; // Валидация

    return SliderSettingViewModel(
      key: key,
      displayName: displayName,
      group: group,
      value: value,
      min: min,
      max: max,
      divisions: divisions,
    );
  }
}