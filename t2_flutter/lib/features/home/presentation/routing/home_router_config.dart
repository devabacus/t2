// manifest: startProject
import 'dart:core';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../auth_wrapper.dart';
import 'home_routes_constants.dart';


List<RouteBase> getHomeRoutes() {
  return [
    GoRoute(
      name: HomeRoutes.home,
      path: HomeRoutes.homePath,
      // builder: (BuildContext context, state) => HomePage(),
      builder: (BuildContext context, state) => const AuthWrapper(),
    ),
  ];
}
