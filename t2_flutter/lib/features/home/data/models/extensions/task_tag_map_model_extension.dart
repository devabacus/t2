
import 'package:drift/drift.dart';

import '../../../../../../../core/database/local/database.dart';
import 'package:t2_client/t2_client.dart' as serverpod;
import '../../../domain/entities/task_tag_map/task_tag_map.dart';
import '../../../../../core/database/local/database_types.dart';
import '../task_tag_map/task_tag_map_model.dart';

extension TaskTagMapModelExtension on TaskTagMapModel {
  TaskTagMapEntity toEntity() => TaskTagMapEntity(
        id: id,
        lastModified: lastModified,
        userId: userId,
         taskId: taskId, tagId: tagId
      );

  TaskTagMapTableCompanion toCompanion() => TaskTagMapTableCompanion(
        id: Value(id),
        lastModified: Value(lastModified), 
        userId: Value(userId),
        syncStatus: Value(SyncStatus.local), // По умолчанию новые записи требуют синхронизации
        taskId: Value(taskId), tagId: Value(tagId)

      );
  
  TaskTagMapTableCompanion toCompanionWithId() => toCompanion();
}

extension TaskTagMapModelListExtension on List<TaskTagMapModel> {
  List<TaskTagMapEntity> toEntities() =>
      map((model) => model.toEntity()).toList();
}

extension ServerpodTaskTagMapToModelExtension on serverpod.TaskTagMap {
  TaskTagMapModel toModel() => TaskTagMapModel(
        id: id.toString(),
        lastModified: lastModified ?? DateTime.now().toUtc(),
        userId: userId,
        taskId: taskId.toString(), tagId: tagId.toString()
      );
}


extension ServerpodTaskTagMapListToModelListExtension on List<serverpod.TaskTagMap> {
  List<TaskTagMapModel> toModels() =>
      map((serverpodModel) => serverpodModel.toModel()).toList();
}

  