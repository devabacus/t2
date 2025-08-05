import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../registry/setting_definition.dart';
import '../audio_settings.dart';
import '../profile_settings.dart';
import '../ui_settings.dart';

part 'groups_list.g.dart';

class SettingGroup {
  final String key;
  final String displayName;
  final List<SettingDefinition> Function() definitions;

  const SettingGroup({
    required this.key,
    required this.displayName,
    required this.definitions,
  });
}

@riverpod
List<SettingGroup> settingGroups(Ref ref) {
  return [
    SettingGroup(key: 'UI', displayName: 'Интерфейс', definitions: getUiSettings),
    SettingGroup(key: 'Profile', displayName: 'Профиль', definitions: getProfileSettings),
    SettingGroup(key: 'Audio', displayName: 'Аудио', definitions: getAudioSettings),
  ];
}