import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:formz/formz.dart';
import 'package:sentry_flutter/sentry_flutter.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../../../../../domain/field_validators/email_field_validation.dart';
import '../../../../../domain/field_validators/password_field_validation.dart';
import '../../../../../domain/network/supabase_error_codes.dart';
import '../../../../../domain/storage/auth_storage.dart';
import '../../../../shared/localization/locale_keys.g.dart';
import 'login_state.dart';

class LoginNotifier extends StateNotifier<LoginState> {
  final AuthStorage authStorage;

  LoginNotifier({
    required this.authStorage,
  }) : super(
          const LoginState(
            status: FormzSubmissionStatus.initial,
            errorMessage: null,
          ),
        );

  Future<void> login({
    required String email,
    required String password,
  }) async {
    final emailError = EmailFieldValidation.dirty(email).validator(email);
    final passwordError =
        PasswordFieldValidation.dirty(password).validator(password);

    if (emailError != null ||
        passwordError != null) {
      state = state.copyWith(
        status: FormzSubmissionStatus.failure,
        emailError: emailError,
        passwordError: passwordError,
        errorMessage: null,
      );
      return;
    }

    state = state.copyWith(
      status: FormzSubmissionStatus.inProgress,
      emailError: null,
      passwordError: null,
      errorMessage: null,
    );

    try {
      await authStorage.loginWithPassword(
        email: email,
        password: password,
      );

      state = state.copyWith(
        status: FormzSubmissionStatus.success,
        emailError: null,
        passwordError: null,
        errorMessage: null,
      );
    } catch (e) {
      await Sentry.captureException(e);
      var errorMessage = LocaleKeys.errors_somethingWentWrong.tr();

      if (e is AuthApiException &&
          e.code == SupabaseErrorCodes.userAlreadyExists) {
        errorMessage = LocaleKeys.errors_signUpErrorEmailExists.tr();
      }

      state = state.copyWith(
        status: FormzSubmissionStatus.failure,
        errorMessage: errorMessage,
        emailError: null,
        passwordError: null,
      );
    }
  }

  Future<void> loginWithGoogle() async {
    state = state.copyWith(
      status: FormzSubmissionStatus.inProgress,
      emailError: null,
      passwordError: null,
      errorMessage: null,
    );

    try {
      await authStorage.loginWithGoogle();

      state = state.copyWith(
        status: FormzSubmissionStatus.success,
        emailError: null,
        passwordError: null,
        errorMessage: null,
      );
    } catch (e) {
      await Sentry.captureException(e);
      state = state.copyWith(
        status: FormzSubmissionStatus.failure,
        errorMessage: LocaleKeys.errors_somethingWentWrong.tr(),
        emailError: null,
        passwordError: null,
      );
    }
  }
}
