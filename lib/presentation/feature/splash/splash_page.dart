import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../app/app_locators.dart';
import '../../providers/feature_providers.dart';
import '../../shared/navigation/route_constants.dart';

class SplashPage extends ConsumerWidget {
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.listen(splashDelayProvider, (_, __) {
      context.go(RouteConstants.login.path);
    });
    return Scaffold(
      key: Key(AppLocators.splashPage),
      body: Center(
        child: Text('Splash Page'),
      ),
    );
  }
}
