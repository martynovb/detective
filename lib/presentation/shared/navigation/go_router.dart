import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../feature/auth/login_page.dart';
import '../../feature/auth/sign_up_page.dart';
import '../../feature/home/home_page.dart';
import '../../feature/splash/splash_page.dart';
import '../widgets/error_page.dart';
import 'route_constants.dart';

final _rootNavigatorKey = GlobalKey<NavigatorState>();

GoRouter router({
  String? initialLocation,
}) =>
    GoRouter(
      routerNeglect: true,
      navigatorKey: _rootNavigatorKey,
      initialLocation: initialLocation ?? RouteConstants.splash.path,
      errorBuilder: (context, state) {
        return const ErrorPage();
      },
      routes: [
        GoRoute(
          path: RouteConstants.splash.path,
          pageBuilder: (context, state) => NoTransitionPage(
            key: state.pageKey,
            child: const SplashPage(),
          ),
        ),
        GoRoute(
          path: RouteConstants.login.path,
          pageBuilder: (context, state) => NoTransitionPage(
            key: state.pageKey,
            child: LoginPage(),
          ),
        ),
        GoRoute(
          path: RouteConstants.signUp.path,
          pageBuilder: (context, state) => NoTransitionPage(
            key: state.pageKey,
            child: SignUpPage(),
          ),
        ),
        GoRoute(
          path: RouteConstants.home.path,
          pageBuilder: (context, state) {
            return NoTransitionPage(
              key: state.pageKey,
              child: const HomePage(),
            );
          },
        ),
      ],
    );
