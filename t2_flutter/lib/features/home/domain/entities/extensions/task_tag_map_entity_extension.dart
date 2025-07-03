import '../../entities/task_tag_map/task_tag_map.dart';
import '../../../data/models/task_tag_map/task_tag_map_model.dart';
import 'package:t2_client/t2_client.dart' as serverpod;

extension TaskTagMapEntityExtension on TaskTagMapEntity {
  TaskTagMapModel toModel() => TaskTagMapModel(
        id: id,
        lastModified: lastModified,
        userId: userId,
        taskId: taskId, tagId: tagId
      );
}

extension TaskTagMapEntityListExtension on List<TaskTagMapEntity> {
  List<TaskTagMapModel> toModels() => map((entity) => entity.toModel()).toList();
}

extension ServerpodTaskTagMapEntityExtensions on TaskTagMapEntity {
  serverpod.TaskTagMap toServerpodTaskTagMap() => serverpod.TaskTagMap(
    id: serverpod.UuidValue.fromString(id),
    lastModified: lastModified,
    userId: userId,
    isDeleted: false,
    taskId: serverpod.UuidValue.fromString(taskId), tagId: serverpod.UuidValue.fromString(tagId)
  );
  }
