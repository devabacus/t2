

import 'package:drift/drift.dart';
import 'package:t2_client/t2_client.dart' as serverpod;

import '../../../../../../../core/database/local/database.dart';
import '../../../../models/category/category_model.dart';
import '../../../../../../../core/database/local/database_types.dart';

extension CategoryTableDataExtensions on CategoryTableData {
  CategoryModel toModel() => CategoryModel(id: id, lastModified: lastModified, userId: userId, title: title);
}

extension CategoryTableDataListExtensions on List<CategoryTableData> {
  List<CategoryModel> toModels() => map((data)=> data.toModel()).toList();
}

extension ServerpodCategoryTableExtensions on serverpod.Category {
  CategoryTableCompanion toCompanion(SyncStatus status) =>
      CategoryTableCompanion(
        id: Value(id.toString()),
        lastModified: Value(lastModified),
        userId: Value(userId),
        syncStatus: Value(status),
        title: Value(title)
  );
}

