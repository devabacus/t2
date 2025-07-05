
import 'package:drift/drift.dart';

import '../../../../../../../core/database/local/database.dart';
import 'package:t2_client/t2_client.dart' as serverpod;
import '../../../domain/entities/task/task_entity.dart';
import '../../../../../core/database/local/database_types.dart';
import '../task/task_model.dart';

extension TaskModelExtension on TaskModel {
  TaskEntity toEntity() => TaskEntity(
        id: id,
        userId: userId,
        customerId: customerId,
        createdAt: createdAt,
        lastModified: lastModified,
        isDeleted: isDeleted,
         title: title, categoryId: categoryId
      );

  TaskTableCompanion toCompanion() => TaskTableCompanion(
        id: Value(id),
        userId: Value(userId),
        customerId: Value(customerId),
        createdAt: Value(createdAt),
        lastModified: Value(lastModified),
        isDeleted: Value(isDeleted),
        syncStatus: Value(SyncStatus.local),
        title: Value(title), categoryId: Value(categoryId)

      );
  
  TaskTableCompanion toCompanionWithId() => toCompanion();
}

extension TaskModelListExtension on List<TaskModel> {
  List<TaskEntity> toEntities() =>
      map((model) => model.toEntity()).toList();
}

extension ServerpodTaskToModelExtension on serverpod.Task {
  TaskModel toModel() => TaskModel(
        id: id.toString(),
        userId: userId,
        customerId: customerId.toString(),
        createdAt: createdAt,
        lastModified: lastModified,
        isDeleted: isDeleted,
        title: title, categoryId: categoryId?.toString()
      );
}

extension ServerpodTaskListToModelListExtension on List<serverpod.Task> {
  List<TaskModel> toModels() =>
      map((serverpodModel) => serverpodModel.toModel()).toList();
}

  