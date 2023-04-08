import 'package:flutter/widgets.dart';
import 'package:go_router/go_router.dart';
import 'package:todo_app/core/routes/routes_name.dart';
import 'package:todo_app/features/dashboard/presentation/pages/dashboard_screen.dart';
import 'package:todo_app/features/settings/presentation/pages/settings_screen.dart';
import 'package:todo_app/features/todo/presentation/pages/todo_screen.dart';

class GoRouterProvider {
  final GlobalKey<NavigatorState> _rootNavigatorKey =
      GlobalKey(debugLabel: 'root');
  final GlobalKey<NavigatorState> _shellNavigatorKey =
      GlobalKey(debugLabel: 'shell');
  late final GoRouter router =
      GoRouter(navigatorKey: _rootNavigatorKey, initialLocation: '/', routes: [
    ShellRoute(
      navigatorKey: _shellNavigatorKey,
      builder: (context, state, child) {
        return DashboardScreen(
          key: state.pageKey,
          child: child,
        );
      },
      routes: [
        GoRoute(
          path: '/',
          name: homeRoute,
          pageBuilder: (context, state) {
            return NoTransitionPage(
              child: ToDoScreen(
                key: state.pageKey,
              ),
            );
          },
        ),
        GoRoute(
          path: '/settings',
          name: settingsRoute,
          pageBuilder: (context, state) {
            return NoTransitionPage(
              child: SettingsScreen(
                key: state.pageKey,
              ),
            );
          },
        ),
      ],
    )
  ]);
}
