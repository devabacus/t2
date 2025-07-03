
import 'package:drift/drift.dart';

import '../../../../../../../core/database/local/database.dart';
import 'package:t2_client/t2_client.dart' as serverpod;
import '../../../domain/entities/category/category.dart';
import '../../../../../core/database/local/database_types.dart';
import '../category/category_model.dart';

extension CategoryModelExtension on CategoryModel {
  CategoryEntity toEntity() => CategoryEntity(
        id: id,
        lastModified: lastModified,
        userId: userId,
         title: title
      );

  CategoryTableCompanion toCompanion() => CategoryTableCompanion(
        id: Value(id),
        lastModified: Value(lastModified), 
        userId: Value(userId),
        syncStatus: Value(SyncStatus.local), // По умолчанию новые записи требуют синхронизации
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
        lastModified: lastModified ?? DateTime.now().toUtc(),
        userId: userId,
        title: title
      );
}


extension ServerpodCategoryListToModelListExtension on List<serverpod.Category> {
  List<CategoryModel> toModels() =>
      map((serverpodModel) => serverpodModel.toModel()).toList();
}

  