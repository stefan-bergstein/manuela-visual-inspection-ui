import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:manuela_visual_inspection_ui/router/tab_base.dart';
import 'package:manuela_visual_inspection_ui/views/about/about.dart';
import 'package:manuela_visual_inspection_ui/views/dashboard/dashboard.dart';

class RouterUtils {
  static final router = GoRouter(
    initialLocation: DashboardRoute.blueprint,
    routes: [
      ShellRoute(
        builder: (context, state, child) => TabBase(child: child),
        routes: TabMeta.values.map((tab) => tab.route).toList(),
      ),
    ],
  );

  static Widget _routeWrapper(String title, Widget child) => Title(
        color: Colors.black,
        title: title,
        child: child,
      );

  static final Map<TabMeta, TabRoute> _currentTabRoute = {
    TabMeta.dashboard: DashboardRoute(),
    TabMeta.about: AboutRoute(),
  };

  static void goTo(BuildContext context, WidgetRef ref,
      {BaseRoute? route, TabMeta? tab}) {
    assert(route != null || tab != null);

    if (tab != null) {
      GoRouter.of(context).go(_currentTabRoute[tab]!.path);
    } else {
      if (route is TabRoute) {
        _currentTabRoute[TabMeta.values[ref.read(tabIndexProvider)]] = route;
      }
      GoRouter.of(context).go(route!.path);
    }
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

  GoRoute get route => switch (this) {
        TabMeta.dashboard => GoRoute(
            path: DashboardRoute.blueprint,
            pageBuilder: (context, state) => RouterUtils._noTransition(
              state,
              RouterUtils._routeWrapper(
                text,
                const DashboardView(),
              ),
            ),
          ),
        TabMeta.about => GoRoute(
            path: AboutRoute.blueprint,
            pageBuilder: (context, state) => RouterUtils._noTransition(
              state,
              RouterUtils._routeWrapper(
                text,
                const AboutView(),
              ),
            ),
          ),
      };
}
