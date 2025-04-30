import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../shared/globals.dart';
import '../shared/navigation/go_router.dart';
import '../shared/theme/app_theme.dart';

class AppWidget extends ConsumerWidget {
  const AppWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final themeMode = ref.watch(appThemeProvider);
    return EasyLocalization(
      supportedLocales: const [
        Locale('en', 'US'),
      ],
      path: translatesPath,
      fallbackLocale: const Locale('en'),
      useOnlyLangCode: true,
      child: MaterialApp.router(
        localizationsDelegates: context.localizationDelegates,
        supportedLocales: context.supportedLocales,
        locale: context.locale,
        theme: AppTheme.lightTheme,
        darkTheme: AppTheme.darkTheme,
        themeMode: themeMode,
        routerConfig: router(),
      ),
    );
  }
}
