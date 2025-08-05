// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'groups_list.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$settingGroupsHash() => r'bb35607883fa920be6a07178df47f61806cfceec';

/// Централизованный список всех групп настроек в приложении.
/// Это единственное место, которое нужно изменить, чтобы добавить или удалить группу.
///
/// Copied from [settingGroups].
@ProviderFor(settingGroups)
final settingGroupsProvider = AutoDisposeProvider<List<SettingGroup>>.internal(
  settingGroups,
  name: r'settingGroupsProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product')
          ? null
          : _$settingGroupsHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef SettingGroupsRef = AutoDisposeProviderRef<List<SettingGroup>>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
