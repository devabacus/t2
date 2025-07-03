
import 'package:drift/drift.dart';

import '../../../../../../../core/database/local/database.dart';
import 'package:t2_client/t2_client.dart' as serverpod;
import '../../../domain/entities/task/task.dart';
import '../../../../../core/database/local/database_types.dart';
import '../task/task_model.dart';

extension TaskModelExtension on TaskModel {
  TaskEntity toEntity() => TaskEntity(
        id: id,
        lastModified: lastModified,
        userId: userId,
         title: title, categoryId: categoryId
      );

  TaskTableCompanion toCompanion() => TaskTableCompanion(
        id: Value(id),
        lastModified: Value(lastModified), 
        userId: Value(userId),
        syncStatus: Value(SyncStatus.local), // По умолчанию новые записи требуют синхронизации
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
        lastModified: lastModified ?? DateTime.now().toUtc(),
        userId: userId,
        title: title, categoryId: categoryId.toString()
      );
}


extension ServerpodTaskListToModelListExtension on List<serverpod.Task> {
  List<TaskModel> toModels() =>
      map((serverpodModel) => serverpodModel.toModel()).toList();
}

  