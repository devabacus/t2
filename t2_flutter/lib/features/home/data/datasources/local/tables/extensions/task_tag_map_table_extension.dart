

import 'package:drift/drift.dart';
import 'package:t2_client/t2_client.dart' as serverpod;

import '../../../../../../../core/database/local/database.dart';
import '../../../../models/task_tag_map/task_tag_map_model.dart';
import '../../../../../../../core/database/local/database_types.dart';

extension TaskTagMapTableDataExtensions on TaskTagMapTableData {
  TaskTagMapModel toModel() => TaskTagMapModel(id: id, lastModified: lastModified, userId: userId, taskId: taskId, tagId: tagId);
}

extension TaskTagMapTableDataListExtensions on List<TaskTagMapTableData> {
  List<TaskTagMapModel> toModels() => map((data)=> data.toModel()).toList();
}

extension ServerpodTaskTagMapTableExtensions on serverpod.TaskTagMap {
  TaskTagMapTableCompanion toCompanion(SyncStatus status) =>
      TaskTagMapTableCompanion(
        id: Value(id.toString()),
        lastModified: Value(lastModified),
        userId: Value(userId),
        syncStatus: Value(status),
        taskId: Value(taskId.toString()), tagId: Value(tagId.toString())
  );
}

