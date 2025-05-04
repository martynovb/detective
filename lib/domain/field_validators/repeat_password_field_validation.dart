import 'package:easy_localization/easy_localization.dart';
import 'package:formz/formz.dart';

import '../../presentation/shared/localization/locale_keys.g.dart';
import 'field_validation_error_model.dart';

class RepeatPasswordFieldValidation
    extends FormzInput<String, FieldValidationErrorModel> {
  final String password;

  const RepeatPasswordFieldValidation.pure(this.password) : super.pure('');

  const RepeatPasswordFieldValidation.dirty(this.password, [String value = ''])
      : super.dirty(value);

  @override
  FieldValidationErrorModel? validator(String value) {
    if (value.isEmpty) {
      return FieldValidationErrorModel(
        errorMessage: LocaleKeys.repeatPasswordField_error_empty.tr(),
        errorType: FieldValidationError.empty,
      );
    }

    if (value != password) {
      return FieldValidationErrorModel(
        errorMessage: LocaleKeys.repeatPasswordField_error_invalid.tr(),
        errorType: FieldValidationError.invalid,
      );
    }

    return null;
  }
}
