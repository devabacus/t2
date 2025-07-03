

import 'package:drift/drift.dart';
import 'package:t2_client/t2_client.dart' as serverpod;

import '../../../../../../../core/database/local/database.dart';
import '../../../../models/tag/tag_model.dart';
import '../../../../../../../core/database/local/database_types.dart';

extension TagTableDataExtensions on TagTableData {
  TagModel toModel() => TagModel(id: id, lastModified: lastModified, userId: userId, title: title);
}

extension TagTableDataListExtensions on List<TagTableData> {
  List<TagModel> toModels() => map((data)=> data.toModel()).toList();
}

extension ServerpodTagTableExtensions on serverpod.Tag {
  TagTableCompanion toCompanion(SyncStatus status) =>
      TagTableCompanion(
        id: Value(id.toString()),
        lastModified: Value(lastModified ?? DateTime.now().toUtc()),
        userId: Value(userId),
        syncStatus: Value(status),
        title: Value(title)
  );
}

