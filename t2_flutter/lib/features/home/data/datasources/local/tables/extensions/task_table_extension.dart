import 'package:drift/drift.dart';
import 'package:t2_client/t2_client.dart' as serverpod;

import '../../../../../../../core/database/local/database.dart';
import '../../../../models/task/task_model.dart';
import '../../../../../../../core/database/local/database_types.dart';

extension TaskTableDataExtensions on TaskTableData {
  TaskModel toModel() => TaskModel(id: id, userId: userId, customerId: customerId, createdAt: createdAt, lastModified: lastModified, isDeleted: isDeleted, title: title, categoryId: categoryId);
}

extension TaskTableDataListExtensions on List<TaskTableData> {
  List<TaskModel> toModels() => map((data)=> data.toModel()).toList();
}

extension ServerpodTaskTableExtensions on serverpod.Task {
  TaskTableCompanion toCompanion(SyncStatus status) =>
      TaskTableCompanion(
        id: Value(id.toString()),
        userId: Value(userId),
        customerId: Value(customerId.toString()),
        createdAt: Value(createdAt),
        lastModified: Value(lastModified),
        isDeleted: Value(isDeleted),
        syncStatus: Value(status),
        title: Value(title), categoryId: Value(categoryId.toString())
  );
}

