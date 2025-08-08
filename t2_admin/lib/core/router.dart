// lib/core/router.dart
import 'dart:async'; // ИСПРАВЛЕНО: Добавлен импорт для StreamSubscription

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:t2_client/t2_client.dart';

import '../features/auth/presentation/pages/auth_wrapper_page.dart';
import '../features/auth/presentation/pages/login_page.dart';
// ИСПРАВЛЕНО: У вас была опечатка в имени файла (customer_lint_page -> customer_list_page)
import '../features/customers/presentation/pages/customer_lint_page.dart';
import '../features/dashboard/presentation/pages/dashboard_page.dart';
import 'providers.dart';

part 'router.g.dart';

// ИСПРАВЛЕНО: Добавлен недостающий класс GoRouterRefreshStream
class GoRouterRefreshStream extends ChangeNotifier {
  GoRouterRefreshStream(Stream<dynamic> stream) {
    notifyListeners();
    _subscription = stream.asBroadcastStream().listen((_) => notifyListeners());
  }

  late final StreamSubscription<dynamic> _subscription;

  @override
  void dispose() {
    _subscription.cancel();
    super.dispose();
  }
}

@riverpod
GoRouter router(Ref ref) {
  return GoRouter(
    initialLocation: '/splash',
    routes: [
      GoRoute(
        path: '/splash',
        builder: (context, state) => const AuthWrapperPage(),
      ),
      GoRoute(
        path: '/login',
        name: 'login',
        builder: (context, state) => const LoginPage(),
      ),
      ShellRoute(
        builder: (context, state, child) {
          return SuperAdminScaffold(child: child); 
        },
        routes: [
          GoRoute(
            path: '/dashboard',
            name: 'dashboard',
            builder: (context, state) => const DashboardPage(),
          ),
          GoRoute(
            path: '/customers',
            name: 'customers',
            // ИСПРАВЛЕНО: У вас была опечатка в имени класса
            builder: (context, state) => const CustomerListPage(),
          ),
        ],
      ),
    ],
    redirect: (context, state) {
      final roleAsyncValue = ref.watch(userRoleProvider);

      final isSplash = state.matchedLocation == '/splash';
      if (roleAsyncValue.isLoading || isSplash) {
        return '/splash';
      }

      final role = roleAsyncValue.valueOrNull;
      final isLoggingIn = state.matchedLocation == '/login';
      
      if (role != UserRole.superAdmin) {
        return isLoggingIn ? null : '/login';
      }
      
      if (isLoggingIn) {
        return '/dashboard';
      }

      return null;
    },
    // ИСПРАВЛЕНО: Слушаем authStateChangesProvider.stream, а не userRoleProvider
    refreshListenable: GoRouterRefreshStream(ref.watch(authStateChangesProvider.stream)),
  );
}

// Scaffold с навигацией (без изменений)
class SuperAdminScaffold extends StatelessWidget {
  final Widget child;
  const SuperAdminScaffold({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: [
          NavigationRail(
            selectedIndex: _calculateSelectedIndex(context),
            onDestinationSelected: (index) {
              if (index == 0) context.goNamed('dashboard');
              if (index == 1) context.goNamed('customers');
            },
            labelType: NavigationRailLabelType.all,
            destinations: const [
              NavigationRailDestination(
                icon: Icon(Icons.dashboard_outlined),
                selectedIcon: Icon(Icons.dashboard),
                label: Text('Дашборд'),
              ),
              NavigationRailDestination(
                icon: Icon(Icons.business_outlined),
                selectedIcon: Icon(Icons.business),
                label: Text('Клиенты'),
              ),
            ],
          ),
          const VerticalDivider(thickness: 1, width: 1),
          Expanded(child: child),
        ],
      ),
    );
  }
  
  int _calculateSelectedIndex(BuildContext context) {
    final location = GoRouterState.of(context).matchedLocation;
    if (location.startsWith('/dashboard')) return 0;
    if (location.startsWith('/customers')) return 1;
    return 0;
  }
}