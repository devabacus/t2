
import 'package:t2/core/database/local/database.dart';

import '../../../models/tag/tag_model.dart';
import '../../../../../../core/database/local/database_types.dart';

abstract class ITagLocalDataSource {
  Future<List<TagModel>> getTags({int? userId});
  Stream<List<TagModel>> watchTags({int? userId});
  Future<TagModel?> getTagById(String id, {required int userId});
  Future<List<TagModel>> getTagsByIds(List<String> ids, {required int userId});
  Future<String> createTag(TagModel tag);
  Future<bool> updateTag(TagModel tag);
  Future<bool> deleteTag(String id, {required int userId});
  Future<List<TagTableData>> getAllLocalChanges(int userId);
  Future<List<TagTableData>> reconcileServerChanges(
    List<dynamic> serverChanges,
    int userId,
  );
  Future<void> physicallyDeleteTag(String id, {required int userId});
  Future<void> insertOrUpdateFromServer(
    dynamic serverChange,
    SyncStatus status,
  );
  Future<void> handleSyncEvent(dynamic event, int userId);

}

