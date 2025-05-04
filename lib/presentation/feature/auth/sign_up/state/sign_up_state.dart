import 'package:formz/formz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../../domain/field_validators/field_validation_error_model.dart';

part 'sign_up_state.freezed.dart';

@freezed
abstract class SignUpState with _$SignUpState {
  const factory SignUpState({
    required FormzSubmissionStatus status,
    String? errorMessage,
    FieldValidationErrorModel? emailError,
    FieldValidationErrorModel? passwordError,
    FieldValidationErrorModel? repeatPasswordError,
  }) = _SignUpState;
}