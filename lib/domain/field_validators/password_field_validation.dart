import 'package:easy_localization/easy_localization.dart';
import 'package:formz/formz.dart';

import '../../presentation/shared/localization/locale_keys.g.dart';
import 'field_validation_error_model.dart';

const int minPasswordLength = 8;

class PasswordFieldValidation
    extends FormzInput<String, FieldValidationErrorModel> {
  final _pattern = RegExp(r'^(?=.*[A-Z])(?=.*\d).+$');

  PasswordFieldValidation.pure() : super.pure('');

  PasswordFieldValidation.dirty([super.value = '']) : super.dirty();

  @override
  FieldValidationErrorModel? validator(String? value) {
    if (value == null || value.isEmpty) {
      return FieldValidationErrorModel(
        errorMessage: LocaleKeys.passwordField_error_empty.tr(),
        errorType: FieldValidationError.empty,
      );
    }

    if (value.length < minPasswordLength) {
      return FieldValidationErrorModel(
        errorMessage: LocaleKeys.passwordField_error_length.tr(
          args: [
            minPasswordLength.toString(),
          ],
        ),
        errorType: FieldValidationError.length,
      );
    }

    if (!_pattern.hasMatch(value)) {
      return FieldValidationErrorModel(
        errorMessage: LocaleKeys.passwordField_error_invalid.tr(),
        errorType: FieldValidationError.invalid,
      );
    }

    return null;
  }
}
