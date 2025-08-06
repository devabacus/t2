// manifest: startProject
import '../../../data/models/configuration/configuration_model.dart';
import '../../entities/configuration/configuration_entity.dart';

extension ConfigurationEntityExtension on ConfigurationEntity {
  ConfigurationModel toModel() => ConfigurationModel(
    id: id,
    userId: userId,
    customerId: customerId,
    createdAt: createdAt,
    lastModified: lastModified,
    isDeleted: isDeleted,
    // === generated_start:simpleFields ===
  group: group,
  key: key,
  value: value
// === generated_end:simpleFields ===
  );
}

extension ConfigurationEntityListExtension on List<ConfigurationEntity> {
  List<ConfigurationModel> toModels() => map((entity) => entity.toModel()).toList();
}

