// lib/core/providers/session_manager_provider.dart

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:serverpod_auth_shared_flutter/serverpod_auth_shared_flutter.dart';
import 'package:t2_client/t2_client.dart';

import '../../features/auth/presentation/providers/auth_state_providers.dart'; // <-- Важный импорт
import 'serverpod_client_provider.dart';

part 'session_manager_provider.g.dart';

@riverpod
SessionManager sessionManager(Ref ref) {
  ref.keepAlive();
  final client = ref.watch(serverpodClientProvider);
  final sessionManager = SessionManager(
    caller: client.modules.auth,
  );
  sessionManager.initialize();
  return sessionManager;
}

// ПРОВАЙДЕРЫ userInfoStream, currentUser и isAuthenticated УДАЛЕНЫ

