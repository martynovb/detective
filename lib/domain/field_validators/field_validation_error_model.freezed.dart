// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'field_validation_error_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$FieldValidationErrorModel {
  String get errorMessage;
  FieldValidationError get errorType;

  /// Create a copy of FieldValidationErrorModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $FieldValidationErrorModelCopyWith<FieldValidationErrorModel> get copyWith =>
      _$FieldValidationErrorModelCopyWithImpl<FieldValidationErrorModel>(
          this as FieldValidationErrorModel, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is FieldValidationErrorModel &&
            (identical(other.errorMessage, errorMessage) ||
                other.errorMessage == errorMessage) &&
            (identical(other.errorType, errorType) ||
                other.errorType == errorType));
  }

  @override
  int get hashCode => Object.hash(runtimeType, errorMessage, errorType);

  @override
  String toString() {
    return 'FieldValidationErrorModel(errorMessage: $errorMessage, errorType: $errorType)';
  }
}

/// @nodoc
abstract mixin class $FieldValidationErrorModelCopyWith<$Res> {
  factory $FieldValidationErrorModelCopyWith(FieldValidationErrorModel value,
          $Res Function(FieldValidationErrorModel) _then) =
      _$FieldValidationErrorModelCopyWithImpl;
  @useResult
  $Res call({String errorMessage, FieldValidationError errorType});
}

/// @nodoc
class _$FieldValidationErrorModelCopyWithImpl<$Res>
    implements $FieldValidationErrorModelCopyWith<$Res> {
  _$FieldValidationErrorModelCopyWithImpl(this._self, this._then);

  final FieldValidationErrorModel _self;
  final $Res Function(FieldValidationErrorModel) _then;

  /// Create a copy of FieldValidationErrorModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? errorMessage = null,
    Object? errorType = null,
  }) {
    return _then(_self.copyWith(
      errorMessage: null == errorMessage
          ? _self.errorMessage
          : errorMessage // ignore: cast_nullable_to_non_nullable
              as String,
      errorType: null == errorType
          ? _self.errorType
          : errorType // ignore: cast_nullable_to_non_nullable
              as FieldValidationError,
    ));
  }
}

/// @nodoc

class _FieldValidationErrorModel implements FieldValidationErrorModel {
  const _FieldValidationErrorModel(
      {required this.errorMessage, required this.errorType});

  @override
  final String errorMessage;
  @override
  final FieldValidationError errorType;

  /// Create a copy of FieldValidationErrorModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$FieldValidationErrorModelCopyWith<_FieldValidationErrorModel>
      get copyWith =>
          __$FieldValidationErrorModelCopyWithImpl<_FieldValidationErrorModel>(
              this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _FieldValidationErrorModel &&
            (identical(other.errorMessage, errorMessage) ||
                other.errorMessage == errorMessage) &&
            (identical(other.errorType, errorType) ||
                other.errorType == errorType));
  }

  @override
  int get hashCode => Object.hash(runtimeType, errorMessage, errorType);

  @override
  String toString() {
    return 'FieldValidationErrorModel(errorMessage: $errorMessage, errorType: $errorType)';
  }
}

/// @nodoc
abstract mixin class _$FieldValidationErrorModelCopyWith<$Res>
    implements $FieldValidationErrorModelCopyWith<$Res> {
  factory _$FieldValidationErrorModelCopyWith(_FieldValidationErrorModel value,
          $Res Function(_FieldValidationErrorModel) _then) =
      __$FieldValidationErrorModelCopyWithImpl;
  @override
  @useResult
  $Res call({String errorMessage, FieldValidationError errorType});
}

/// @nodoc
class __$FieldValidationErrorModelCopyWithImpl<$Res>
    implements _$FieldValidationErrorModelCopyWith<$Res> {
  __$FieldValidationErrorModelCopyWithImpl(this._self, this._then);

  final _FieldValidationErrorModel _self;
  final $Res Function(_FieldValidationErrorModel) _then;

  /// Create a copy of FieldValidationErrorModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? errorMessage = null,
    Object? errorType = null,
  }) {
    return _then(_FieldValidationErrorModel(
      errorMessage: null == errorMessage
          ? _self.errorMessage
          : errorMessage // ignore: cast_nullable_to_non_nullable
              as String,
      errorType: null == errorType
          ? _self.errorType
          : errorType // ignore: cast_nullable_to_non_nullable
              as FieldValidationError,
    ));
  }
}

// dart format on
