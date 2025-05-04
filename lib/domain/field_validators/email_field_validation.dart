import 'package:easy_localization/easy_localization.dart';
import 'package:formz/formz.dart';

import '../../presentation/shared/localization/locale_keys.g.dart';
import 'field_validation_error_model.dart';

const minEmailLength = 6;

class EmailFieldValidation extends FormzInput<String, FieldValidationErrorModel>
    with FormzInputErrorCacheMixin {
  final _emailRegExp = RegExp(
    r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$',
    caseSensitive: false,
    multiLine: false,
  );

  EmailFieldValidation.pure() : super.pure('');

  EmailFieldValidation.dirty([super.value = '']) : super.dirty();

  @override
  FieldValidationErrorModel? validator(String? value) {
    if (value == null || value.isEmpty) {
      return FieldValidationErrorModel(
        errorMessage: LocaleKeys.emailField_error_empty.tr(),
        errorType: FieldValidationError.empty,
      );
    }

    if (value.length < minEmailLength) {
      return FieldValidationErrorModel(
        errorMessage: LocaleKeys.emailField_error_length.tr(),
        errorType: FieldValidationError.length,
      );
    }

    if (!_emailRegExp.hasMatch(value)) {
      return FieldValidationErrorModel(
        errorMessage: LocaleKeys.emailField_error_invalid.tr(),
        errorType: FieldValidationError.invalid,
      );
    }

    return null;
  }
}
