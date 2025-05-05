import 'package:detective/presentation/main/common/app_env.dart';
import 'package:detective/presentation/providers/app_providers.dart';
import 'package:detective/presentation/shared/globals.dart';
import 'package:detective/presentation/shared/navigation/go_router.dart';
import 'package:detective/presentation/shared/theme/app_theme.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';

Future<void> buildTestWidget(
  WidgetTester tester, {
  Widget? widget,
  String? initialLocation,
  List<Override> overrides = const [],
  Locale locale = const Locale('en'),
}) async {
  EasyLocalization.logger.enableBuildModes = [];
  EnvInfo.initialize(AppEnvironment.local);

  await tester.pumpWidget(
    EasyLocalization(
      supportedLocales: const [Locale('en', 'US')],
      path: translatesPath,
      fallbackLocale: locale,
      startLocale: locale,
      useOnlyLangCode: true,
      child: ProviderScope(
        overrides: overrides,
        child: Consumer(
          builder: (context, ref, child) {
            final themeMode = ref.watch(appThemeProvider);
            if (widget != null) {
              return _materialApp(
                themeMode: themeMode,
                context: context,
                child: widget,
              );
            }
            return _materialAppWithRouter(
              themeMode: themeMode,
              context: context,
              initialLocation: initialLocation,
            );
          },
        ),
      ),
    ),
  );
  await tester.pump();
}

Widget _materialApp({
  ThemeMode themeMode = ThemeMode.system,
  required BuildContext context,
  required Widget child,
}) =>
    MaterialApp(
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      themeMode: themeMode,
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      locale: context.locale,
      home: child,
    );

Widget _materialAppWithRouter({
  ThemeMode themeMode = ThemeMode.system,
  required BuildContext context,
  String? initialLocation,
}) =>
    MaterialApp.router(
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      themeMode: themeMode,
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      locale: context.locale,
      routerConfig: router(
        initialLocation: initialLocation,
      ),
    );
