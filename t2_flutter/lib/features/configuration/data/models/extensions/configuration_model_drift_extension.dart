import 'package:app_core/app_core.dart';
import 'package:drift/drift.dart';

import '../../../../../core/data/datasources/local/database.dart';
import '../configuration/configuration_model.dart';

extension ConfigurationModelDriftExtension on ConfigurationModel {
  ConfigurationTableCompanion toCompanion() => ConfigurationTableCompanion(
    id: Value(id),
    userId: Value(userId),
    customerId: Value(customerId),
    createdAt: Value(createdAt),
    lastModified: Value(lastModified),
    isDeleted: Value(isDeleted),
    syncStatus: Value(SyncStatus.local),
    group: Value(group),
    key: Value(key),
    value: Value(value),
  );
}