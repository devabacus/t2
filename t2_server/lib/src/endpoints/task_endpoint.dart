import 'package:serverpod/serverpod.dart';
import 'package:t2_server/src/generated/protocol.dart';

const _taskChannelBase = 't2_task_events_for_user_';

class TaskEndpoint extends Endpoint {
  
  Future<int> _getAuthenticatedUserId(Session session) async {
    final authInfo = await session.authenticated;
    final userId = authInfo?.userId;

    if (userId == null) {
      throw Exception('Пользователь не авторизован.');
    }
    return userId;
  }

  Future<void> _notifyChange(Session session, TaskSyncEvent event, int userId) async {
    final channel = '$_taskChannelBase$userId';
    await session.messages.postMessage(channel, event);
    session.log('🔔 Событие ${event.type.name} отправлено в канал "$channel"');
  }

  Future<Task> createTask(Session session, Task task) async {
  final userId = await _getAuthenticatedUserId(session);

  final existingTask = await Task.db.findFirstRow(
    session,
    where: (c) => c.id.equals(task.id) & c.userId.equals(userId),
  );

  final serverTask = task.copyWith(
      userId: userId,
      lastModified: DateTime.now().toUtc(),
      isDeleted: false,
  );

  if (existingTask != null) {
    session.log('ℹ️ "createTask" вызван для существующего ID. Выполняется обновление (воскрешение).');
    final updatedTask = await Task.db.updateRow(session, serverTask);

    await _notifyChange(session, TaskSyncEvent(
        type: SyncEventType.update, 
        task: updatedTask,
    ), userId);
    return updatedTask;

  } else {
    final createdTask = await Task.db.insertRow(session, serverTask);
    await _notifyChange(session, TaskSyncEvent(
        type: SyncEventType.create,
        task: createdTask,
    ), userId);
    return createdTask;
  }
}

  Future<List<Task>> getTasks(Session session, {int? limit}) async {
    final userId = await _getAuthenticatedUserId(session);
    return await Task.db.find(
      session,
      where: (c) => c.userId.equals(userId) & c.isDeleted.equals(false),
      orderBy: (c) => c.title,         
      limit: limit
    );
  }     

   Future<Task?> getTaskById(Session session, UuidValue id) async {
    final userId = await _getAuthenticatedUserId(session);
    
    return await Task.db.findFirstRow(
      session,
      where: (c) => c.id.equals(id) & c.userId.equals(userId) & c.isDeleted.equals(false),
    );
  }

  Future<List<Task>> getTasksSince(Session session, DateTime? since) async {
    final userId = await _getAuthenticatedUserId(session);
    if (since == null) {
      return getTasks(session);
    }
    return await Task.db.find(
      session,
      where: (c) => c.userId.equals(userId) & (c.lastModified >= since),
      orderBy: (c) => c.lastModified,
    );
  }

  Future<bool> updateTask(Session session, Task task) async {
    final userId = await _getAuthenticatedUserId(session);
    final originalTask = await Task.db.findFirstRow(
      session,
      where: (c) => c.id.equals(task.id) & c.userId.equals(userId) & c.isDeleted.equals(false),
    );
    if (originalTask == null) {
      return false; 
    }
    final serverTask = task.copyWith(
      userId: userId,
      lastModified: DateTime.now().toUtc(),
    );
    try {
      await Task.db.updateRow(session, serverTask);
      await _notifyChange(session, TaskSyncEvent(
        type: SyncEventType.update,
        task: serverTask,
      ), userId);
      return true;
    } catch (e) {
      return false;
    }
  }

  Future<bool> deleteTask(Session session, UuidValue id) async {
    final userId = await _getAuthenticatedUserId(session);
    final originalTask = await Task.db.findFirstRow(
      session,
      where: (c) => c.id.equals(id) & c.userId.equals(userId),
    );

    if (originalTask == null) return false;
    final tombstone = originalTask.copyWith(
      isDeleted: true,
      lastModified: DateTime.now().toUtc(),
    );

    final result = await Task.db.updateRow(session, tombstone);

    await _notifyChange(session, TaskSyncEvent(
      type: SyncEventType.delete,
      task: result, 
      id: id,
    ), userId);

    return true;
  }

  Stream<TaskSyncEvent> watchEvents(Session session) async* {
    final userId = await _getAuthenticatedUserId(session);
    final channel = '$_taskChannelBase$userId';
    session.log('🟢 Клиент (user: $userId) подписался на события в канале "$channel"');
    try {
      await for (var event in session.messages.createStream<TaskSyncEvent>(channel)) {
        session.log('🔄 Пересылаем событие ${event.type.name} клиенту (user: $userId)');
        yield event;
      }
    } finally {
      session.log('🔴 Клиент (user: $userId) отписался от канала "$channel"');
    }
  }
    
Future<List<Task>> getTasksByCategoryId(Session session, UuidValue categoryId) async {
    return await Task.db.find(
      session,
      where: (t) => t.categoryId.equals(categoryId),
      orderBy: (t) => t.title,
    );
  }
}          