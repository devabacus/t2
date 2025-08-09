// manifest: startProject
// ignore_for_file: unused_import
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:t2_admin/features/admin/presentation/routings/admin_router_config.dart';
import 'package:talker_flutter/talker_flutter.dart';

import '../../features/admin/presentation/routings/organizations_router_config.dart';
import '../../features/auth/presentation/routing/auth_router_config.dart';
import './routes_constants.dart';

part 'router_config.g.dart';

@riverpod
GoRouter appRouter(Ref ref) {
  return GoRouter(
    // observers: [TalkerRouteObserver(log.talker)],
    // initialLocation: HomeRoutes.homePath,
    routes: [
      ...getAuthRoutes(),
      ...getAdminRoutes(),
    ],
  );
}
