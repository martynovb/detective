import 'package:formz/formz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../../domain/field_validators/field_validation_error_model.dart';

part 'login_state.freezed.dart';

@freezed
abstract class LoginState with _$LoginState {
  const factory LoginState({
    required FormzSubmissionStatus status,
    String? errorMessage,
    FieldValidationErrorModel? emailError,
    FieldValidationErrorModel? passwordError,
  }) = _LoginState;
}