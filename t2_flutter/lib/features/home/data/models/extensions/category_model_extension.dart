
import 'package:drift/drift.dart';

import '../../../../../../../core/database/local/database.dart';
import 'package:t2_client/t2_client.dart' as serverpod;
import '../../../domain/entities/category/category_entity.dart';
import '../../../../../core/database/local/database_types.dart';
import '../category/category_model.dart';

extension CategoryModelExtension on CategoryModel {
  CategoryEntity toEntity() => CategoryEntity(
        id: id,
        userId: userId,
        customerId: customerId,
        createdAt: createdAt,
        lastModified: lastModified,
        isDeleted: isDeleted,
         title: title
      );

  CategoryTableCompanion toCompanion() => CategoryTableCompanion(
        id: Value(id),
        userId: Value(userId),
        customerId: Value(customerId),
        createdAt: Value(createdAt),
        lastModified: Value(lastModified),
        isDeleted: Value(isDeleted),
        syncStatus: Value(SyncStatus.local),
        title: Value(title)

      );
  
  CategoryTableCompanion toCompanionWithId() => toCompanion();
}

extension CategoryModelListExtension on List<CategoryModel> {
  List<CategoryEntity> toEntities() =>
      map((model) => model.toEntity()).toList();
}

extension ServerpodCategoryToModelExtension on serverpod.Category {
  CategoryModel toModel() => CategoryModel(
        id: id.toString(),
        userId: userId,
        customerId: customerId.toString(),
        createdAt: createdAt,
        lastModified: lastModified,
        isDeleted: isDeleted,
        title: title
      );
}

extension ServerpodCategoryListToModelListExtension on List<serverpod.Category> {
  List<CategoryModel> toModels() =>
      map((serverpodModel) => serverpodModel.toModel()).toList();
}

  