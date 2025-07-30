// manifest: startProject
import 'dart:async';
import 'dart:math';

import '../data/datasources/local/interfaces/sync_metadata_local_datasource_service.dart';
import 'sync_registry.dart';

abstract class BaseSyncRepository implements ISyncableRepository {
  final int userId;
  final String customerId;
  final bool syncEnabled;
  final ISyncMetadataLocalDataSource syncMetadataDataSource;

  StreamSubscription? _eventStreamSubscription;
  bool _isSyncing = false;
  bool _isDisposed = false;
  int reconnectionAttempt = 0;
  int delaySeconds = 0;

  BaseSyncRepository(this.userId, this.customerId, {required this.syncMetadataDataSource, this.syncEnabled = true});

  String get entityType;
  @override
  String get entityTypeName;
  Future<List<dynamic>> getChangesFromServer(DateTime? since);
  Future<List<dynamic>> reconcileChanges(List<dynamic> serverChanges);
  Future<void> pushLocalChanges(List<dynamic> localChangesToPush);
  Stream<dynamic> watchEvents();
  Future<void> handleSyncEvent(dynamic event);

  Future<DateTime?> getLastSyncTimestamp() =>
      syncMetadataDataSource.getLastSyncTimestamp(entityType, userId: userId);

  Future<void> updateLastSyncTimestamp() => syncMetadataDataSource
      .updateLastSyncTimestamp(entityType, DateTime.now().toUtc(), userId: userId);

  @override
  Future<void> syncWithServer() async {
    if (!syncEnabled) return;

    if (_isSyncing) {
      print('ℹ️ Синхронизация $entityTypeName уже выполняется для пользователя $userId. Пропуск.');
      return;
    }
    _isSyncing = true;
    print('🔄 Запуск синхронизации $entityTypeName для пользователя $userId...');

    try {
      final lastSync = await getLastSyncTimestamp();

      print('  [1/3] Получение изменений $entityTypeName с сервера с момента: $lastSync');
      final serverChanges = await getChangesFromServer(lastSync);
      print('    -> Получено ${serverChanges.length} изменений с сервера.');
 
      print('  [2/3] Слияние данных и разрешение конфликтов...');
      final localChangesToPush = await reconcileChanges(serverChanges);
      print('    -> ${localChangesToPush.length} локальных изменений готовы к отправке.');

      if (localChangesToPush.isNotEmpty) {
        print('  [3/3] Отправка локальных изменений на сервер...');
        await pushLocalChanges(localChangesToPush);
      } else {
        print('  [3/3] Нет локальных изменений для отправки.');
      }

      await updateLastSyncTimestamp();
      print('✅ Синхронизация $entityTypeName успешно завершена для пользователя $userId');

    } catch (e) {
      print('❌ Ошибка синхронизации $entityTypeName для пользователя $userId: $e');
      rethrow;
    } finally {
      _isSyncing = false;
    }
        }

  @override
  void initEventBasedSync() {
    if (_isDisposed) return;
    print('🌊 $entityTypeName: _initEventBasedSync для userId: $userId. Попытка #${reconnectionAttempt + 1}');
    _eventStreamSubscription?.cancel();
    _subscribeToEvents();
  }

  void _subscribeToEvents() {
    if (_isDisposed) return;
    print('🎧 $entityTypeName: Выполняется подписка на события для userId: $userId (попытка: $reconnectionAttempt)');
    _eventStreamSubscription = watchEvents().listen(
      (event) {
        print('⚡️ $entityTypeName: Получено событие с сервера (для userId: $userId)');
        if (reconnectionAttempt > 0) {
          print('👍 Соединение с real-time сервером для $entityTypeName восстановлено!');
          reconnectionAttempt = 0;
          delaySeconds = 0;
        }
        handleSyncEvent(event);
      },
      onError: (error) {
        print('❌ $entityTypeName: Ошибка стрима событий для userId: $userId: $error. Планируем переподключение...');
        _scheduleReconnection();
      },
      onDone: () {
        print('🔌 $entityTypeName: Стрим событий был закрыт (onDone) для userId: $userId. Планируем переподключение...');
        _scheduleReconnection();
      },
      cancelOnError: true,
    );
  }

  void _scheduleReconnection() {
    if (_isDisposed) return;
    _eventStreamSubscription?.cancel();
    
    delaySeconds = min(pow(2, reconnectionAttempt).toInt(), 60);
    print('⏱️ $entityTypeName: Следующая попытка подключения через $delaySeconds секунд.');
    
    Future.delayed(Duration(seconds: delaySeconds), () {
      reconnectionAttempt++;
      initEventBasedSync();
    });
  }

  @override
  void dispose() {
    print('🛑 $entityTypeName: Уничтожается экземпляр для userId: $userId.');
    _isDisposed = true;
    _eventStreamSubscription?.cancel();
  }
}

