// lib/features/home/data/datasources/remote/sources/tag_endpoint.dart
import 'package:serverpod/serverpod.dart';
import 'package:t2_server/src/generated/protocol.dart'; // Включает UserSessionData, CustomerUser

const _tagChannelBase = 't2_tag_events_for_user_';

// Определяем Record Type для возвращаемого контекста, содержащего userId и customerId
typedef AuthenticatedUserContext = ({int userId, UuidValue customerId /*, List<String> activePermissions */}); // activePermissions, если нужно в других местах

class TagEndpoint extends Endpoint {
  
  Future<AuthenticatedUserContext> _getAuthenticatedUserContext(Session session) async {
    final authInfo = await session.authenticated;
    final userId = authInfo?.userId;

    if (userId == null) {
      throw Exception('Пользователь не авторизован.');
    }

    final customerUser = await CustomerUser.db.findFirstRow(
      session,
      where: (cu) => cu.userId.equals(userId),
    );

    if (customerUser == null) {
      throw Exception('Пользователь $userId не привязан к клиенту (Customer).');
    }

    // Если вам нужны activePermissions здесь, то их тоже надо получить из DB:
    // final rolePermissions = await RolePermission.db.find(session, where: (rp) => rp.roleId.equals(customerUser.roleId));
    // final permissionKeys = <String>{};
    // for (var rp in rolePermissions) {
    //   final permission = await Permission.db.findById(session, rp.permissionId);
    //   if (permission != null) { permissionKeys.add(permission.key); }
    // }
    // return (userId: userId, customerId: customerUser.customerId, activePermissions: permissionKeys.toList());

    return (userId: userId, customerId: customerUser.customerId);
  }

  // Метод _notifyChange теперь принимает AuthenticatedUserContext
  Future<void> _notifyChange(Session session, TagSyncEvent event, AuthenticatedUserContext authContext) async { // ИЗМЕНЕНО
    final channel = '$_tagChannelBase${authContext.userId}-${authContext.customerId.uuid}'; // Используем authContext
    await session.messages.postMessage(channel, event);
    session.log('🔔 Событие ${event.type.name} отправлено в канал "$channel"');
  }

  Future<Tag> createTag(Session session, Tag tag) async {
    final authContext = await _getAuthenticatedUserContext(session);
    final userId = authContext.userId;
    final customerId = authContext.customerId;

    final existingTag = await Tag.db.findFirstRow(
      session,
      where: (c) => c.id.equals(tag.id) & c.userId.equals(userId) & c.customerId.equals(customerId),
    );

    final serverTag = tag.copyWith(
        userId: userId,
        customerId: customerId,
        lastModified: DateTime.now().toUtc(),
        isDeleted: false,
    );

    if (existingTag != null) {
      session.log('ℹ️ "createTag" вызван для существующего ID. Выполняется обновление (воскрешение).');
      final updatedTag = await Tag.db.updateRow(session, serverTag);

      await _notifyChange(session, TagSyncEvent(
          type: SyncEventType.update, 
          tag: updatedTag,
      ), authContext); // ИЗМЕНЕНО: передаем authContext
      return updatedTag;

    } else {
      final createdTag = await Tag.db.insertRow(session, serverTag);
      await _notifyChange(session, TagSyncEvent(
          type: SyncEventType.create,
          tag: createdTag,
      ), authContext); // ИЗМЕНЕНО: передаем authContext
      return createdTag;
    }
  }

  Future<List<Tag>> getTags(Session session, {int? limit}) async {
    final authContext = await _getAuthenticatedUserContext(session);
    final userId = authContext.userId;
    final customerId = authContext.customerId;

    return await Tag.db.find(
      session,
      where: (c) => c.userId.equals(userId) & c.customerId.equals(customerId) & c.isDeleted.equals(false),
      limit: limit
    );
  }     

  Future<Tag?> getTagById(Session session, UuidValue id) async {
    final authContext = await _getAuthenticatedUserContext(session);
    final userId = authContext.userId;
    final customerId = authContext.customerId;
    
    return await Tag.db.findFirstRow(
      session,
      where: (c) => c.id.equals(id) & c.userId.equals(userId) & c.customerId.equals(customerId) & c.isDeleted.equals(false),
    );
  }

  Future<List<Tag>> getTagsSince(Session session, DateTime? since) async {
    final authContext = await _getAuthenticatedUserContext(session);
    final userId = authContext.userId;
    final customerId = authContext.customerId;

    if (since == null) {
      return getTags(session);
    }
    return await Tag.db.find(
      session,
      where: (c) => c.userId.equals(userId) & c.customerId.equals(customerId) & (c.lastModified >= since),
      orderBy: (c) => c.lastModified,
    );
  }

  Future<bool> updateTag(Session session, Tag tag) async {
    final authContext = await _getAuthenticatedUserContext(session);
    final userId = authContext.userId;
    final customerId = authContext.customerId;

    final originalTag = await Tag.db.findFirstRow(
      session,
      where: (c) => c.id.equals(tag.id) & c.userId.equals(userId) & c.customerId.equals(customerId) & c.isDeleted.equals(false),
    );
    if (originalTag == null) {
      return false; 
    }
    final serverTag = tag.copyWith(
      userId: userId,
      customerId: customerId,
      lastModified: DateTime.now().toUtc(),
    );
    try {
      await Tag.db.updateRow(session, serverTag);
      await _notifyChange(session, TagSyncEvent(
        type: SyncEventType.update,
        tag: serverTag,
      ), authContext); // ИЗМЕНЕНО: передаем authContext
      return true;
    } catch (e) {
      return false;
    }
  }

  Future<bool> deleteTag(Session session, UuidValue id) async {
    final authContext = await _getAuthenticatedUserContext(session);
    final userId = authContext.userId;
    final customerId = authContext.customerId;

    final originalTag = await Tag.db.findFirstRow(
      session,
      where: (c) => c.id.equals(id) & c.userId.equals(userId) & c.customerId.equals(customerId),
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
    ), authContext); // ИЗМЕНЕНО: передаем authContext

    return true;
  }

  Stream<TagSyncEvent> watchEvents(Session session) async* {
    final authContext = await _getAuthenticatedUserContext(session);
    final userId = authContext.userId;
    final customerId = authContext.customerId;

    final channel = '$_tagChannelBase$userId-${customerId.uuid}'; 
    session.log('🟢 Клиент (user: $userId, customer: ${customerId.uuid}) подписался на события в канале "$channel"');
    try {
      await for (var event in session.messages.createStream<TagSyncEvent>(channel)) {
        session.log('🔄 Пересылаем событие ${event.type.name} клиенту (user: $userId, customer: ${customerId.uuid})');
        yield event;
      }
    } finally {
      session.log('🔴 Клиент (user: $userId, customer: ${customerId.uuid}) отписался от канала "$channel"');
    }
  }
  
}