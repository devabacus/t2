// lib/features/admin/presentation/routings/roles_router_config.dart

import 'package:go_router/go_router.dart';
import '../pages/create_role_page.dart';
import '../pages/roles_page.dart';
import 'roles_routes_constants.dart';

List<RouteBase> getRolesRoutes() {
  return [
    GoRoute(
      name: RolesRoutes.roles,
      path: RolesRoutes.rolesPath,
      builder: (context, state) => const RolesPage(),
    ),
    GoRoute(
      name: RolesRoutes.createRole,
      path: RolesRoutes.createRolePath,
      builder: (context, state) => const CreateRolePage(),
    ),
  ];
}