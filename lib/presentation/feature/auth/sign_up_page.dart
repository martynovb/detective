import 'package:detective/presentation/app/app_locators.dart';
import 'package:detective/presentation/shared/localization/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SignUpPage extends ConsumerWidget {
  const SignUpPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      key: Key(AppLocators.signUpPage),
      body: Center(
        child: Text(LocaleKeys.signUp).tr(),
      ),
    );
  }
}
