import '../../entities/task/task_entity.dart';
import '../../../data/models/task/task_model.dart';
import 'package:t2_client/t2_client.dart' as serverpod;

extension TaskEntityExtension on TaskEntity {
  TaskModel toModel() => TaskModel(
        id: id,
        userId: userId,
        customerId: customerId,
        createdAt: createdAt,
        lastModified: lastModified,
        isDeleted: isDeleted,
        title: title, categoryId: categoryId
      );
}

extension TaskEntityListExtension on List<TaskEntity> {
  List<TaskModel> toModels() => map((entity) => entity.toModel()).toList();
}

extension ServerpodTaskEntityExtensions on TaskEntity {
  serverpod.Task toServerpodTask() => serverpod.Task(
    id: serverpod.UuidValue.fromString(id),
    userId: userId,
    customerId: serverpod.UuidValue.fromString(customerId),
    createdAt: createdAt,
    lastModified: lastModified,
    isDeleted: isDeleted,
    title: title, categoryId: categoryId == null ? null : serverpod.UuidValue.fromString(categoryId!)
  );
  }
