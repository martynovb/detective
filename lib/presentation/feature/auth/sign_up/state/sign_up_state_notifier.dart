import 'package:detective/domain/storage/auth_storage.dart';
import 'package:detective/presentation/feature/auth/sign_up/state/sign_up_state.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:formz/formz.dart';
import 'package:sentry_flutter/sentry_flutter.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../../../../../domain/field_validators/email_field_validation.dart';
import '../../../../../domain/field_validators/password_field_validation.dart';
import '../../../../../domain/field_validators/repeat_password_field_validation.dart';
import '../../../../../domain/network/supabase_error_codes.dart';
import '../../../../shared/localization/locale_keys.g.dart';

class SignUpNotifier extends StateNotifier<SignUpState> {
  final AuthStorage authStorage;

  SignUpNotifier({
    required this.authStorage,
  }) : super(
          const SignUpState(
            status: FormzSubmissionStatus.initial,
            errorMessage: null,
          ),
        );

  Future<void> signUp({
    required String email,
    required String password,
    required String repeatPassword,
  }) async {
    final emailError = EmailFieldValidation.dirty(email).validator(email);
    final passwordError =
        PasswordFieldValidation.dirty(password).validator(password);
    final repeatPasswordError =
        RepeatPasswordFieldValidation.dirty(password, repeatPassword)
            .validator(repeatPassword);

    if (emailError != null ||
        passwordError != null ||
        repeatPasswordError != null) {
      state = state.copyWith(
        status: FormzSubmissionStatus.failure,
        emailError: emailError,
        passwordError: passwordError,
        repeatPasswordError: repeatPasswordError,
        errorMessage: null,
      );
      return;
    }

    state = state.copyWith(
      status: FormzSubmissionStatus.inProgress,
      emailError: null,
      passwordError: null,
      repeatPasswordError: null,
      errorMessage: null,
    );

    try {
      await authStorage.signUpWithEmailAndPassword(
        email: email,
        password: password,
      );

      state = state.copyWith(
        status: FormzSubmissionStatus.success,
        emailError: null,
        passwordError: null,
        repeatPasswordError: null,
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
        repeatPasswordError: null,
      );
    }
  }

  Future<void> continueWithGoogle() async {
    if (state.status == FormzSubmissionStatus.inProgress) {
      return;
    }
    state = state.copyWith(
      status: FormzSubmissionStatus.inProgress,
    );

    try {
      await authStorage.signInWithGoogle();
      state = state.copyWith(
        status: FormzSubmissionStatus.success,
        errorMessage: null,
      );
    } catch (e) {
      await Sentry.captureException(e);
      state = state.copyWith(
        status: FormzSubmissionStatus.failure,
        errorMessage: LocaleKeys.errors_somethingWentWrong.tr(),
      );
    }
  }
}
