enum AppEnvironment { local, dev, staging, prod }

abstract class EnvInfo {
  static AppEnvironment _environment = AppEnvironment.dev;

  static void initialize(AppEnvironment environment) {
    EnvInfo._environment = environment;
  }

  static String get appName => _environment._appTitle;

  static String get envName => _environment._envName;

  static AppEnvironment get environment => _environment;

  static bool get isProduction => _environment == AppEnvironment.prod;

  static String get supabaseAnonKey => const String.fromEnvironment(
        'supabaseAnonKey',
      );

  static String get supabaseUrl => const String.fromEnvironment(
        'supabaseUrl',
      );

  static String get sentryDsn => const String.fromEnvironment(
        'sentryDsn',
      );

  static String get redirectUrl => const String.fromEnvironment(
        'redirectUrl',
      );
}

extension _EnvProperties on AppEnvironment {
  static const _appTitles = {
    AppEnvironment.dev: 'DEV Detective',
    AppEnvironment.staging: 'STAGING Detective',
    AppEnvironment.prod: 'PROD Detective',
  };

  static const _envs = {
    AppEnvironment.dev: 'dev',
    AppEnvironment.staging: 'staging',
    AppEnvironment.prod: 'prod',
  };

  String get _appTitle => _appTitles[this]!;

  String get _envName => _envs[this]!;
}
