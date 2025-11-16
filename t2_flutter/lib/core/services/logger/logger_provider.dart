import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:talker_flutter/talker_flutter.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'logger_service.dart';

part 'logger_provider.g.dart';

/// Провайдер для экземпляра Talker.
/// Он нужен, чтобы TalkerScreen мог получить к нему доступ.
@riverpod
Talker talker(Ref ref) {
  ref.keepAlive();
  return TalkerFlutter.init();
}

/// Провайдер для нашего абстрактного сервиса логирования.
@riverpod
LoggerService loggerService(Ref ref) {
  ref.keepAlive();
  final talkerInstance = ref.watch(talkerProvider);
  return TalkerLoggerService(talkerInstance);
}
