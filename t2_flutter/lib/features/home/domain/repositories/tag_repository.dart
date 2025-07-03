import '../entities/tag/tag.dart';

abstract class ITagRepository {
  Future<List<TagEntity>> getTags();
  Stream<List<TagEntity>> watchTags();
  Future<TagEntity?> getTagById(String id);
  Future<List<TagEntity>> getTagsByIds(List<String> ids);
  Future<String> createTag(TagEntity tag);
  Future<bool> updateTag(TagEntity tag);
  Future<bool> deleteTag(String id);
  Future<void> syncWithServer();
  void initEventBasedSync();
  void dispose();
  
}

