import 'package:serverpod/serverpod.dart';
import 'package:t2_server/src/generated/protocol.dart';

const _tagChannelBase = 't2_tag_events_for_user_';

class TagEndpoint extends Endpoint {
  
  Future<int> _getAuthenticatedUserId(Session session) async {
    final authInfo = await session.authenticated;
    final userId = authInfo?.userId;

    if (userId == null) {
      throw Exception('Пользователь не авторизован.');
    }
    return userId;
  }

  Future<void> _notifyChange(Session session, TagSyncEvent event, int userId) async {
    final channel = '$_tagChannelBase$userId';
    await session.messages.postMessage(channel, event);
    session.log('🔔 Событие ${event.type.name} отправлено в канал "$channel"');
  }

  Future<Tag> createTag(Session session, Tag tag) async {
  final userId = await _getAuthenticatedUserId(session);

  final existingTag = await Tag.db.findFirstRow(
    session,
    where: (c) => c.id.equals(tag.id) & c.userId.equals(userId),
  );

  final serverTag = tag.copyWith(
      userId: userId,
      lastModified: DateTime.now().toUtc(),
      isDeleted: false,
  );

  if (existingTag != null) {
    session.log('ℹ️ "createTag" вызван для существующего ID. Выполняется обновление (воскрешение).');
    final updatedTag = await Tag.db.updateRow(session, serverTag);

    await _notifyChange(session, TagSyncEvent(
        type: SyncEventType.update, 
        tag: updatedTag,
    ), userId);
    return updatedTag;

  } else {
    final createdTag = await Tag.db.insertRow(session, serverTag);
    await _notifyChange(session, TagSyncEvent(
        type: SyncEventType.create,
        tag: createdTag,
    ), userId);
    return createdTag;
  }
}

  Future<List<Tag>> getTags(Session session, {int? limit}) async {
    final userId = await _getAuthenticatedUserId(session);
    return await Tag.db.find(
      session,
      where: (c) => c.userId.equals(userId) & c.isDeleted.equals(false),
      limit: limit
    );
  }     

   Future<Tag?> getTagById(Session session, UuidValue id) async {
    final userId = await _getAuthenticatedUserId(session);
    
    return await Tag.db.findFirstRow(
      session,
      where: (c) => c.id.equals(id) & c.userId.equals(userId) & c.isDeleted.equals(false),
    );
  }

  Future<List<Tag>> getTagsSince(Session session, DateTime? since) async {
    final userId = await _getAuthenticatedUserId(session);
    if (since == null) {
      return getTags(session);
    }
    return await Tag.db.find(
      session,
      where: (c) => c.userId.equals(userId) & (c.lastModified >= since),
      orderBy: (c) => c.lastModified,
    );
  }

  Future<bool> updateTag(Session session, Tag tag) async {
    final userId = await _getAuthenticatedUserId(session);
    final originalTag = await Tag.db.findFirstRow(
      session,
      where: (c) => c.id.equals(tag.id) & c.userId.equals(userId) & c.isDeleted.equals(false),
    );
    if (originalTag == null) {
      return false; 
    }
    final serverTag = tag.copyWith(
      userId: userId,
      lastModified: DateTime.now().toUtc(),
    );
    try {
      await Tag.db.updateRow(session, serverTag);
      await _notifyChange(session, TagSyncEvent(
        type: SyncEventType.update,
        tag: serverTag,
      ), userId);
      return true;
    } catch (e) {
      return false;
    }
  }

  Future<bool> deleteTag(Session session, UuidValue id) async {
    final userId = await _getAuthenticatedUserId(session);
    final originalTag = await Tag.db.findFirstRow(
      session,
      where: (c) => c.id.equals(id) & c.userId.equals(userId),
    );

    if (originalTag == null) return false;
    final tombstone = originalTag.copyWith(
      isDeleted: true,
      lastModified: DateTime.now().toUtc(),
    );

    final result = await Tag.db.updateRow(session, tombstone);

    await _notifyChange(session, TagSyncEvent(
      type: SyncEventType.delete,
      tag: result, 
      id: id,
    ), userId);

    return true;
  }

  Stream<TagSyncEvent> watchEvents(Session session) async* {
    final userId = await _getAuthenticatedUserId(session);
    final channel = '$_tagChannelBase$userId';
    session.log('🟢 Клиент (user: $userId) подписался на события в канале "$channel"');
    try {
      await for (var event in session.messages.createStream<TagSyncEvent>(channel)) {
        session.log('🔄 Пересылаем событие ${event.type.name} клиенту (user: $userId)');
        yield event;
      }
    } finally {
      session.log('🔴 Клиент (user: $userId) отписался от канала "$channel"');
    }
  }
    
Future<List<Tag>> getTagsByCustomerId(Session session, UuidValue customerId) async {
    return await Tag.db.find(
      session,
      where: (t) => t.customerId.equals(customerId),
      orderBy: (t) => t.title,
    );
  }
}          