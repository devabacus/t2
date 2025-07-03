import '../../entities/tag/tag.dart';
import '../../../data/models/tag/tag_model.dart';
import 'package:t2_client/t2_client.dart' as serverpod;

extension TagEntityExtension on TagEntity {
  TagModel toModel() => TagModel(
        id: id,
        lastModified: lastModified,
        userId: userId,
        title: title
      );
}

extension TagEntityListExtension on List<TagEntity> {
  List<TagModel> toModels() => map((entity) => entity.toModel()).toList();
}

extension ServerpodTagEntityExtensions on TagEntity {
  serverpod.Tag toServerpodTag() => serverpod.Tag(
    id: serverpod.UuidValue.fromString(id),
    lastModified: lastModified,
    userId: userId,
    isDeleted: false,
    title: title
  );
  }
