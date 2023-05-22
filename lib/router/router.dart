import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:manuela_visual_inspection_ui/router/tab_base.dart';
import 'package:manuela_visual_inspection_ui/views/about/about.dart';
import 'package:manuela_visual_inspection_ui/views/dashboard/dashboard.dart';

class RouterUtils {
  static final router = GoRouter(
    initialLocation: DashboardRoute.blueprint,
    routes: [
      StatefulShellRoute.indexedStack(
        builder: (context, state, navigationShell) => TabBase(
          navigationShell: navigationShell,
        ),
        branches: TabMeta.values.map((tab) => tab.branch).toList(),
      ),
    ],
  );

  static Widget _routeWrapper(String title, Widget child) => Title(
        color: Colors.black,
        title: title,
        child: child,
      );

  static void goTo(BuildContext context, BaseRoute route) {
    GoRouter.of(context).go(route.path);
  }

  static Page _platformTransition(GoRouterState state, Widget child) =>
      switch (true) {
        _ when Platform.isIOS || Platform.isAndroid =>
          CupertinoPage(child: child),
        _ => _noTransition(state, child),
      };

  static Page _noTransition(GoRouterState state, Widget child) =>
      CustomTransitionPage(
        key: state.pageKey,
        child: child,
        transitionDuration: Duration.zero,
        transitionsBuilder: (_, __, ___, Widget child) => child,
      );
}

abstract class BaseRoute {
  String path;

  BaseRoute(this.path);
}

abstract class TabRoute extends BaseRoute {
  TabRoute(String path) : super(path);
}

class DashboardRoute extends TabRoute {
  static String blueprint = '/dashboard';

  DashboardRoute() : super('/dashboard');
}

class AboutRoute extends TabRoute {
  static String blueprint = '/about';

  AboutRoute() : super('/about');
}

enum TabMeta {
  dashboard,
  about;

  String get text => switch (this) {
        TabMeta.dashboard => 'Dashboard',
        TabMeta.about => 'About',
      };

  IconData get icon => switch (this) {
        TabMeta.dashboard => CupertinoIcons.home,
        TabMeta.about => CupertinoIcons.info_circle_fill,
      };

  StatefulShellBranch get branch => switch (this) {
        TabMeta.dashboard => StatefulShellBranch(
            routes: [
              GoRoute(
                path: DashboardRoute.blueprint,
                pageBuilder: (context, state) => RouterUtils._noTransition(
                  state,
                  RouterUtils._routeWrapper(
                    text,
                    const DashboardView(),
                  ),
                ),
              ),
            ],
          ),
        TabMeta.about => StatefulShellBranch(
            routes: [
              GoRoute(
                path: AboutRoute.blueprint,
                pageBuilder: (context, state) => RouterUtils._noTransition(
                  state,
                  RouterUtils._routeWrapper(
                    text,
                    const AboutView(),
                  ),
                ),
              ),
            ],
          ),
      };
}
