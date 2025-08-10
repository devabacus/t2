// lib/core/routing/router_config.dart

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:t2_admin/features/admin/presentation/routings/admin_router_config.dart';
import 'package:t2_admin/features/admin/presentation/routings/roles_routes_constants.dart';
import 'package:t2_admin/features/admin/presentation/routings/user_routes_constants.dart';
import 'package:t2_admin/features/auth/presentation/providers/auth_state_providers.dart';

import '../../features/admin/presentation/routings/organizations_router_config.dart';
import '../../features/admin/presentation/routings/organizations_routes_constants.dart';
import '../../features/auth/presentation/routing/auth_router_config.dart';
import '../../features/auth/presentation/routing/auth_routes_constants.dart';
import '../providers/session_manager_provider.dart';

part 'router_config.g.dart';

@riverpod
GoRouter appRouter(Ref ref) {

  final routePermissions = {
    OrganizationsRoutes.organizationsPath: 'organizations.read',
    UsersRoutes.usersPath: 'users.read',
    RolesRoutes.rolesPath: 'roles.read',
  };

  final authState = ref.watch(authStateChangesProvider);
  final userPermissions = ref.watch(currentUserPermissionsProvider);

  return GoRouter(
    initialLocation: AuthRoutes.authWrapperPath,
    routes: [
      ...getAuthRoutes(),
      ...getAdminRoutes(),
      ...getOrganizationsRoutes(),
    ],
    redirect: (BuildContext context, GoRouterState state) {
      final loggingIn = state.matchedLocation == AuthRoutes.authWrapperPath;
      final isLoggedIn = authState.valueOrNull != null;

      if (!isLoggedIn && !loggingIn) {
        return AuthRoutes.authWrapperPath;
      }
      
      if (isLoggedIn && loggingIn) {
        return null;
      }

      final requestedPath = state.matchedLocation;
      
      String? requiredPermission;
      for (final route in routePermissions.keys) {
        if (requestedPath.startsWith(route)) {
          requiredPermission = routePermissions[route];
          break;
        }
      }

      if (requiredPermission != null && !userPermissions.contains(requiredPermission)) {
        return '/admin'; 
      }

      return null;
    },
  );
}