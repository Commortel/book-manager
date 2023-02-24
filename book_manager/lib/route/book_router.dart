import 'package:book_manger/pages/details_screen.dart';
import 'package:book_manger/root_screen.dart';
import 'package:book_manger/widget/scaffold_with_bottomnavbar.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class BookRouter {
  // private navigators
  final _rootNavigatorKey = GlobalKey<NavigatorState>();
  final _shellNavigatorKey = GlobalKey<NavigatorState>();

  late final GoRouter _router;

  GoRouter get router => _router;

  BookRouter() {
    final tabs = [
      const ScaffoldWithNavBarTabItem(
        initialLocation: '/a',
        icon: Icon(Icons.home),
        label: 'Section A',
      ),
      const ScaffoldWithNavBarTabItem(
        initialLocation: '/b',
        icon: Icon(Icons.settings),
        label: 'Section B',
      ),
      const ScaffoldWithNavBarTabItem(
        initialLocation: '/c',
        icon: Icon(Icons.settings),
        label: 'Section C',
      ),
    ];

    _router = GoRouter(
      initialLocation: '/a',
      navigatorKey: _rootNavigatorKey,
      debugLogDiagnostics: true,
      routes: [
        ShellRoute(
          navigatorKey: _shellNavigatorKey,
          builder: (context, state, child) {
            return ScaffoldWithBottomNavBar(tabs: tabs, child: child);
          },
          routes: [
            // Products
            GoRoute(
              path: '/a',
              pageBuilder: (context, state) => NoTransitionPage(
                key: state.pageKey,
                child: const RootScreen(label: 'A', detailsPath: '/a/details'),
              ),
              routes: [
                GoRoute(
                  path: 'details',
                  builder: (context, state) => const DetailsScreen(label: 'A'),
                ),
              ],
            ),
            // Shopping Cart
            GoRoute(
              path: '/b',
              pageBuilder: (context, state) => NoTransitionPage(
                key: state.pageKey,
                child: const RootScreen(label: 'B', detailsPath: '/b/details'),
              ),
              routes: [
                GoRoute(
                  path: 'details',
                  builder: (context, state) => const DetailsScreen(label: 'B'),
                ),
              ],
            ),
            GoRoute(
              path: '/c',
              pageBuilder: (context, state) => NoTransitionPage(
                key: state.pageKey,
                child: const RootScreen(label: 'C', detailsPath: '/c/details'),
              ),
              routes: [
                GoRoute(
                  path: 'details',
                  builder: (context, state) => const DetailsScreen(label: 'C'),
                ),
              ],
            ),
          ],
        ),
      ],
    );
  }
}
