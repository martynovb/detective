class RouteItem {
  const RouteItem({required this.path, required this.name});

  final String path;
  final String name;
}

class RouteConstants {
  static Set<String> unAuthRoutes = {
    RouteConstants.login.path,
    RouteConstants.signUp.path,
  };

  static const RouteItem splash = RouteItem(
    path: '/splash',
    name: 'Splash',
  );

  static const RouteItem login = RouteItem(
    path: '/login',
    name: 'Login',
  );

  static const RouteItem signUp = RouteItem(
    path: '/sign-up',
    name: 'Sign up',
  );

  static const RouteItem resetPassword = RouteItem(
    path: '/reset-password',
    name: 'Reset password',
  );

  static const RouteItem home = RouteItem(
    path: '/',
    name: 'Home',
  );
}
