import 'package:detective/presentation/app/app_locators.dart';
import 'package:detective/presentation/shared/localization/locale_keys.g.dart';
import 'package:detective/presentation/shared/navigation/route_constants.dart';
import 'package:detective/presentation/shared/theme/dimensions.dart';
import 'package:detective/presentation/shared/widgets/app_input_field.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:formz/formz.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../providers/app_providers.dart';
import '../../../providers/feature_providers.dart';
import '../../../shared/widgets/buttons.dart';

class SignUpPage extends HookConsumerWidget {
  const SignUpPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final emailController = useTextEditingController();
    final passwordController = useTextEditingController();
    final repeatPasswordController = useTextEditingController();

    final state = ref.watch(signUpStateNotifierProvider);
    ref.listen(
      signUpStateNotifierProvider.select((value) => value),
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
      key: Key(AppLocators.signUpPage),
      body: Center(
        child: SizedBox(
          width: Dimensions.formWidth,
          child: Column(
            children: [
              Spacer(flex: 1),
              Text(
                LocaleKeys.signUp.tr(),
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
              AppInputField(
                showPasswordToggle: true,
                inputKey: Key(AppLocators.repeatPasswordField),
                errorKey: Key(AppLocators.repeatPasswordFieldError),
                controller: repeatPasswordController,
                labelText: LocaleKeys.repeatPasswordField_label.tr(),
                hintText: LocaleKeys.repeatPasswordField_placeholder.tr(),
                errorMessage: state.repeatPasswordError?.errorMessage,
                enableErrors: true,
              ),
              AppSpacing.h4,
              signUpButton(
                ref,
                emailController: emailController,
                passwordController: passwordController,
                repeatPasswordController: repeatPasswordController,
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

  Widget signUpButton(
    WidgetRef ref, {
    required TextEditingController emailController,
    required TextEditingController passwordController,
    required TextEditingController repeatPasswordController,
  }) {
    return Buttons.simpleButton(
      key: Key(AppLocators.signUpButton),
      onPressed: () {
        ref.read(signUpStateNotifierProvider.notifier).signUp(
              email: emailController.text,
              password: passwordController.text,
              repeatPassword: repeatPasswordController.text,
            );
      },
      text: LocaleKeys.signUp.tr(),
    );
  }

  Widget continueWithGoogleButton(WidgetRef ref) {
    return Buttons.simpleButton(
      key: Key(AppLocators.continueWithGoogleButton),
      onPressed: () {
        ref.read(signUpStateNotifierProvider.notifier).continueWithGoogle();
      },
      text: LocaleKeys.continueWithGoogle.tr(),
    );
  }
}
