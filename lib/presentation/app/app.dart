import 'package:detective/presentation/app/app_locators.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../main/common/observers.dart';
import '../providers/app_providers.dart';
import '../shared/globals.dart';
import '../shared/navigation/go_router.dart';
import '../shared/theme/app_theme.dart';

class MainWidget extends StatelessWidget {
  const MainWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return EasyLocalization(
      supportedLocales: const [
        Locale('en', 'US'),
      ],
      path: translatesPath,
      fallbackLocale: const Locale('en'),
      useOnlyLangCode: true,
      child: ProviderScope(
        observers: [
          Observers(),
        ],
        child: AppWidget(),
      ),
    );
  }
}

class AppWidget extends ConsumerWidget {
  const AppWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final themeMode = ref.watch(appThemeProvider);
    return MaterialApp.router(
      key: Key(AppLocators.app),
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      locale: context.locale,
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      themeMode: themeMode,
      routerConfig: router(),
    );
  }
}
