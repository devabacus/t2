import '../../entities/task/task.dart';
import '../../../data/models/task/task_model.dart';
import 'package:t2_client/t2_client.dart' as serverpod;

extension TaskEntityExtension on TaskEntity {
  TaskModel toModel() => TaskModel(
        id: id,
        lastModified: lastModified,
        userId: userId,
        title: title, categoryId: categoryId
      );
}

extension TaskEntityListExtension on List<TaskEntity> {
  List<TaskModel> toModels() => map((entity) => entity.toModel()).toList();
}

extension ServerpodTaskEntityExtensions on TaskEntity {
  serverpod.Task toServerpodTask() => serverpod.Task(
    id: serverpod.UuidValue.fromString(id),
    lastModified: lastModified,
    userId: userId,
    isDeleted: false,
    title: title, categoryId: categoryId == null ? null : serverpod.UuidValue.fromString(categoryId!)
  );
  }
