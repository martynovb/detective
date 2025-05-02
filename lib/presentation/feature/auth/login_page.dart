import 'package:detective/presentation/app/app_locators.dart';
import 'package:detective/presentation/shared/navigation/route_constants.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../shared/localization/locale_keys.g.dart';

class LoginPage extends ConsumerWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      key: const Key(AppLocators.loginPage),
      body: Column(
        children: [
          Center(
            child: Text(LocaleKeys.login).tr(),
          ),
          ElevatedButton(
            onPressed: () {
              context.go(RouteConstants.signUp.path);
            },
            child: Text('go to sign up'),
          ),
        ],
      ),
    );
  }
}
