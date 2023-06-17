import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:switch_simple_project/core/enums/world_type.dart';
import 'package:switch_simple_project/features/history_page.dart/history_page.dart';
import 'package:switch_simple_project/features/switch_page/switch_page.dart';
import 'package:switch_simple_project/features/welcome_page/welcome_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: _router,
    );
  }

  /// The route configuration.
  final GoRouter _router = GoRouter(
    initialLocation: SwitchPage.route,
    routes: <RouteBase>[
      GoRoute(
          path: SwitchPage.route,
          builder: (BuildContext context, GoRouterState state) =>
              const SwitchPage()),
      GoRoute(
          path: WelcomePage.route,
          builder: (BuildContext context, GoRouterState state) {
            final WorldType worldType = state.extra as WorldType;

            return WelcomePage(worldType: worldType);
          }),
      GoRoute(
          path: HistoryPage.route,
          builder: (BuildContext context, GoRouterState state) =>
              const HistoryPage()),
    ],
  );
}
