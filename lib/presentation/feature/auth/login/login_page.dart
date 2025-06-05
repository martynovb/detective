import 'package:detective/presentation/app/app_locators.dart';
import 'package:detective/presentation/shared/navigation/route_constants.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:formz/formz.dart';
import 'package:go_router/go_router.dart';

import '../../../providers/app_providers.dart';
import '../../../providers/feature_providers.dart';
import '../../../shared/localization/locale_keys.g.dart';
import '../../../shared/theme/dimensions.dart';
import '../../../shared/widgets/app_input_field.dart';
import '../../../shared/widgets/buttons.dart';

class LoginPage extends ConsumerWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final emailController = useTextEditingController();
    final passwordController = useTextEditingController();

    final state = ref.watch(loginStateNotifierProvider);
    ref.listen(
      loginStateNotifierProvider.select((value) => value),
      ((previous, next) {
        ref.watch(dialogsManagerProvider).showLoadingDialog(
              showLoading: next.status.isInProgress,
            );

        if (next.status.isFailure && next.errorMessage != null) {
          ref.watch(dialogsManagerProvider).showErrorDialog(
                title: LocaleKeys.errors_errorTitle.tr(),
                description: next.errorMessage,
              );
        } else if (next.status.isSuccess) {
          context.go(RouteConstants.home.path);
        }
      }),
    );

    return Scaffold(
      key: Key(AppLocators.loginPage),
      body: Center(
        child: SizedBox(
          width: Dimensions.formWidth,
          child: Column(
            children: [
              Spacer(flex: 1),
              Text(
                LocaleKeys.login.tr(),
                style: Theme.of(context).textTheme.headlineLarge,
              ),
              AppSpacing.h16,
              AppInputField(
                inputKey: Key(AppLocators.emailField),
                errorKey: Key(AppLocators.emailFieldError),
                controller: emailController,
                labelText: LocaleKeys.emailField_label.tr(),
                hintText: LocaleKeys.emailField_placeholder.tr(),
                errorMessage: state.emailError?.errorMessage,
                enableErrors: true,
              ),
              AppSpacing.h4,
              AppInputField(
                showPasswordToggle: true,
                inputKey: Key(AppLocators.passwordField),
                errorKey: Key(AppLocators.passwordFieldError),
                controller: passwordController,
                labelText: LocaleKeys.passwordField_label.tr(),
                hintText: LocaleKeys.passwordField_placeholder.tr(),
                errorMessage: state.passwordError?.errorMessage,
                enableErrors: true,
              ),
              AppSpacing.h4,
              loginButton(
                ref,
                emailController: emailController,
                passwordController: passwordController,
              ),
              AppSpacing.h8,
              Text(LocaleKeys.or).tr(),
              AppSpacing.h8,
              continueWithGoogleButton(ref),
              AppSpacing.h8,
              Divider(),
              AppSpacing.h8,
              InkWell(
                key: Key(AppLocators.alreadyHaveAnAccountButton),
                onTap: () => context.go(RouteConstants.login.path),
                child: Text(
                  LocaleKeys.alreadyHaveAnAccount.tr(),
                  style: Theme.of(context).textTheme.bodySmall,
                ),
              ),
              Spacer(flex: 2),
            ],
          ),
        ),
      ),
    );
  }

  Widget loginButton(
    WidgetRef ref, {
    required TextEditingController emailController,
    required TextEditingController passwordController,
  }) {
    return Buttons.simpleButton(
      key: Key(AppLocators.loginButton),
      onPressed: () {
        ref.read(loginStateNotifierProvider.notifier).login(
              email: emailController.text,
              password: passwordController.text,
            );
      },
      text: LocaleKeys.login.tr(),
    );
  }

  Widget continueWithGoogleButton(WidgetRef ref) {
    return Buttons.simpleButton(
      key: Key(AppLocators.continueWithGoogleButton),
      onPressed: () {
        ref.read(loginStateNotifierProvider.notifier).loginWithGoogle();
      },
      text: LocaleKeys.continueWithGoogle.tr(),
    );
  }
}
