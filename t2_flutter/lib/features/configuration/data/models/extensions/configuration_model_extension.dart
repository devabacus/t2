// manifest: startProject
import 'package:app_core/app_core.dart';
import 'package:drift/drift.dart';

import '../../../../../core/data/datasources/local/database.dart';
import '../../../domain/entities/configuration/configuration_entity.dart';
import '../configuration/configuration_model.dart';

extension ConfigurationModelExtension on ConfigurationModel {
  ConfigurationEntity toEntity() => ConfigurationEntity(
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

  ConfigurationTableCompanion toCompanion() => ConfigurationTableCompanion(
    id: Value(id),
    userId: Value(userId),
    customerId: Value(customerId),
    createdAt: Value(createdAt),
    lastModified: Value(lastModified),
    isDeleted: Value(isDeleted),
    syncStatus: Value(SyncStatus.local),

    // === generated_start:valueWrappedFields ===
  group: Value(group),
  key: Value(key),
  value: Value(value)
// === generated_end:valueWrappedFields ===
  );

  ConfigurationTableCompanion toCompanionWithId() => toCompanion();
}

extension ConfigurationModelListExtension on List<ConfigurationModel> {
  List<ConfigurationEntity> toEntities() =>
      map((model) => model.toEntity()).toList();
}

