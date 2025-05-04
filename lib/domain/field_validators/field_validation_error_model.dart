import 'package:freezed_annotation/freezed_annotation.dart';

part 'field_validation_error_model.freezed.dart';

enum FieldValidationError {
  empty,
  invalid,
  length,
}

@freezed
abstract class FieldValidationErrorModel with _$FieldValidationErrorModel {
  const factory FieldValidationErrorModel({
    required String errorMessage,
    required FieldValidationError errorType,
  }) = _FieldValidationErrorModel;
}
