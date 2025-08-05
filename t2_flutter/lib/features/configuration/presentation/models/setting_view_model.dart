// manifest: startProject
import 'package:freezed_annotation/freezed_annotation.dart';

part 'setting_view_model.freezed.dart';

@freezed
sealed class SettingViewModel with _$SettingViewModel {
  const factory SettingViewModel.boolean({
    required String key,
    required String displayName,
    required String group,
    required bool value,
  }) = BooleanSettingViewModel;

  const factory SettingViewModel.options({
    required String key,
    required String displayName,
    required String group,
    required String currentValue,
    required List<String> options,
  }) = OptionsSettingViewModel;

  const factory SettingViewModel.string({
    required String key,
    required String displayName,
    required String group,
    required String value,
  }) = StringSettingViewModel;

   const factory SettingViewModel.group({
    required String key,
    required String displayName,
    required String group, // 'root' или другая родительская группа
  }) = GroupSettingViewModel;
 
  const factory SettingViewModel.unsupported({
    required String key,
    required String displayName,
    required String group,
  }) = UnsupportedSettingViewModel;
}