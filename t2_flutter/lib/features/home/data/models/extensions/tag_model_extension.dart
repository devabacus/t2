
import 'package:drift/drift.dart';

import '../../../../../../../core/database/local/database.dart';
import 'package:t2_client/t2_client.dart' as serverpod;
import '../../../domain/entities/tag/tag.dart';
import '../../../../../core/database/local/database_types.dart';
import '../tag/tag_model.dart';

extension TagModelExtension on TagModel {
  TagEntity toEntity() => TagEntity(
        id: id,
        lastModified: lastModified,
        userId: userId,
         title: title
      );

  TagTableCompanion toCompanion() => TagTableCompanion(
        id: Value(id),
        lastModified: Value(lastModified), 
        userId: Value(userId),
        syncStatus: Value(SyncStatus.local), // По умолчанию новые записи требуют синхронизации
        title: Value(title)

      );
  
  TagTableCompanion toCompanionWithId() => toCompanion();
}

extension TagModelListExtension on List<TagModel> {
  List<TagEntity> toEntities() =>
      map((model) => model.toEntity()).toList();
}

extension ServerpodTagToModelExtension on serverpod.Tag {
  TagModel toModel() => TagModel(
        id: id.toString(),
        lastModified: lastModified ?? DateTime.now().toUtc(),
        userId: userId,
        title: title
      );
}


extension ServerpodTagListToModelListExtension on List<serverpod.Tag> {
  List<TagModel> toModels() =>
      map((serverpodModel) => serverpodModel.toModel()).toList();
}

  