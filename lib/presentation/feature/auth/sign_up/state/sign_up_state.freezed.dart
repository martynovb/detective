// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'sign_up_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$SignUpState {
  FormzSubmissionStatus get status;
  String? get errorMessage;
  FieldValidationErrorModel? get emailError;
  FieldValidationErrorModel? get passwordError;
  FieldValidationErrorModel? get repeatPasswordError;

  /// Create a copy of SignUpState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $SignUpStateCopyWith<SignUpState> get copyWith =>
      _$SignUpStateCopyWithImpl<SignUpState>(this as SignUpState, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is SignUpState &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.errorMessage, errorMessage) ||
                other.errorMessage == errorMessage) &&
            (identical(other.emailError, emailError) ||
                other.emailError == emailError) &&
            (identical(other.passwordError, passwordError) ||
                other.passwordError == passwordError) &&
            (identical(other.repeatPasswordError, repeatPasswordError) ||
                other.repeatPasswordError == repeatPasswordError));
  }

  @override
  int get hashCode => Object.hash(runtimeType, status, errorMessage, emailError,
      passwordError, repeatPasswordError);

  @override
  String toString() {
    return 'SignUpState(status: $status, errorMessage: $errorMessage, emailError: $emailError, passwordError: $passwordError, repeatPasswordError: $repeatPasswordError)';
  }
}

/// @nodoc
abstract mixin class $SignUpStateCopyWith<$Res> {
  factory $SignUpStateCopyWith(
          SignUpState value, $Res Function(SignUpState) _then) =
      _$SignUpStateCopyWithImpl;
  @useResult
  $Res call(
      {FormzSubmissionStatus status,
      String? errorMessage,
      FieldValidationErrorModel? emailError,
      FieldValidationErrorModel? passwordError,
      FieldValidationErrorModel? repeatPasswordError});

  $FieldValidationErrorModelCopyWith<$Res>? get emailError;
  $FieldValidationErrorModelCopyWith<$Res>? get passwordError;
  $FieldValidationErrorModelCopyWith<$Res>? get repeatPasswordError;
}

/// @nodoc
class _$SignUpStateCopyWithImpl<$Res> implements $SignUpStateCopyWith<$Res> {
  _$SignUpStateCopyWithImpl(this._self, this._then);

  final SignUpState _self;
  final $Res Function(SignUpState) _then;

  /// Create a copy of SignUpState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? errorMessage = freezed,
    Object? emailError = freezed,
    Object? passwordError = freezed,
    Object? repeatPasswordError = freezed,
  }) {
    return _then(_self.copyWith(
      status: null == status
          ? _self.status
          : status // ignore: cast_nullable_to_non_nullable
              as FormzSubmissionStatus,
      errorMessage: freezed == errorMessage
          ? _self.errorMessage
          : errorMessage // ignore: cast_nullable_to_non_nullable
              as String?,
      emailError: freezed == emailError
          ? _self.emailError
          : emailError // ignore: cast_nullable_to_non_nullable
              as FieldValidationErrorModel?,
      passwordError: freezed == passwordError
          ? _self.passwordError
          : passwordError // ignore: cast_nullable_to_non_nullable
              as FieldValidationErrorModel?,
      repeatPasswordError: freezed == repeatPasswordError
          ? _self.repeatPasswordError
          : repeatPasswordError // ignore: cast_nullable_to_non_nullable
              as FieldValidationErrorModel?,
    ));
  }

  /// Create a copy of SignUpState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $FieldValidationErrorModelCopyWith<$Res>? get emailError {
    if (_self.emailError == null) {
      return null;
    }

    return $FieldValidationErrorModelCopyWith<$Res>(_self.emailError!, (value) {
      return _then(_self.copyWith(emailError: value));
    });
  }

  /// Create a copy of SignUpState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $FieldValidationErrorModelCopyWith<$Res>? get passwordError {
    if (_self.passwordError == null) {
      return null;
    }

    return $FieldValidationErrorModelCopyWith<$Res>(_self.passwordError!,
        (value) {
      return _then(_self.copyWith(passwordError: value));
    });
  }

  /// Create a copy of SignUpState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $FieldValidationErrorModelCopyWith<$Res>? get repeatPasswordError {
    if (_self.repeatPasswordError == null) {
      return null;
    }

    return $FieldValidationErrorModelCopyWith<$Res>(_self.repeatPasswordError!,
        (value) {
      return _then(_self.copyWith(repeatPasswordError: value));
    });
  }
}

/// @nodoc

class _SignUpState implements SignUpState {
  const _SignUpState(
      {required this.status,
      this.errorMessage,
      this.emailError,
      this.passwordError,
      this.repeatPasswordError});

  @override
  final FormzSubmissionStatus status;
  @override
  final String? errorMessage;
  @override
  final FieldValidationErrorModel? emailError;
  @override
  final FieldValidationErrorModel? passwordError;
  @override
  final FieldValidationErrorModel? repeatPasswordError;

  /// Create a copy of SignUpState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$SignUpStateCopyWith<_SignUpState> get copyWith =>
      __$SignUpStateCopyWithImpl<_SignUpState>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _SignUpState &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.errorMessage, errorMessage) ||
                other.errorMessage == errorMessage) &&
            (identical(other.emailError, emailError) ||
                other.emailError == emailError) &&
            (identical(other.passwordError, passwordError) ||
                other.passwordError == passwordError) &&
            (identical(other.repeatPasswordError, repeatPasswordError) ||
                other.repeatPasswordError == repeatPasswordError));
  }

  @override
  int get hashCode => Object.hash(runtimeType, status, errorMessage, emailError,
      passwordError, repeatPasswordError);

  @override
  String toString() {
    return 'SignUpState(status: $status, errorMessage: $errorMessage, emailError: $emailError, passwordError: $passwordError, repeatPasswordError: $repeatPasswordError)';
  }
}

/// @nodoc
abstract mixin class _$SignUpStateCopyWith<$Res>
    implements $SignUpStateCopyWith<$Res> {
  factory _$SignUpStateCopyWith(
          _SignUpState value, $Res Function(_SignUpState) _then) =
      __$SignUpStateCopyWithImpl;
  @override
  @useResult
  $Res call(
      {FormzSubmissionStatus status,
      String? errorMessage,
      FieldValidationErrorModel? emailError,
      FieldValidationErrorModel? passwordError,
      FieldValidationErrorModel? repeatPasswordError});

  @override
  $FieldValidationErrorModelCopyWith<$Res>? get emailError;
  @override
  $FieldValidationErrorModelCopyWith<$Res>? get passwordError;
  @override
  $FieldValidationErrorModelCopyWith<$Res>? get repeatPasswordError;
}

/// @nodoc
class __$SignUpStateCopyWithImpl<$Res> implements _$SignUpStateCopyWith<$Res> {
  __$SignUpStateCopyWithImpl(this._self, this._then);

  final _SignUpState _self;
  final $Res Function(_SignUpState) _then;

  /// Create a copy of SignUpState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? status = null,
    Object? errorMessage = freezed,
    Object? emailError = freezed,
    Object? passwordError = freezed,
    Object? repeatPasswordError = freezed,
  }) {
    return _then(_SignUpState(
      status: null == status
          ? _self.status
          : status // ignore: cast_nullable_to_non_nullable
              as FormzSubmissionStatus,
      errorMessage: freezed == errorMessage
          ? _self.errorMessage
          : errorMessage // ignore: cast_nullable_to_non_nullable
              as String?,
      emailError: freezed == emailError
          ? _self.emailError
          : emailError // ignore: cast_nullable_to_non_nullable
              as FieldValidationErrorModel?,
      passwordError: freezed == passwordError
          ? _self.passwordError
          : passwordError // ignore: cast_nullable_to_non_nullable
              as FieldValidationErrorModel?,
      repeatPasswordError: freezed == repeatPasswordError
          ? _self.repeatPasswordError
          : repeatPasswordError // ignore: cast_nullable_to_non_nullable
              as FieldValidationErrorModel?,
    ));
  }

  /// Create a copy of SignUpState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $FieldValidationErrorModelCopyWith<$Res>? get emailError {
    if (_self.emailError == null) {
      return null;
    }

    return $FieldValidationErrorModelCopyWith<$Res>(_self.emailError!, (value) {
      return _then(_self.copyWith(emailError: value));
    });
  }

  /// Create a copy of SignUpState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $FieldValidationErrorModelCopyWith<$Res>? get passwordError {
    if (_self.passwordError == null) {
      return null;
    }

    return $FieldValidationErrorModelCopyWith<$Res>(_self.passwordError!,
        (value) {
      return _then(_self.copyWith(passwordError: value));
    });
  }

  /// Create a copy of SignUpState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $FieldValidationErrorModelCopyWith<$Res>? get repeatPasswordError {
    if (_self.repeatPasswordError == null) {
      return null;
    }

    return $FieldValidationErrorModelCopyWith<$Res>(_self.repeatPasswordError!,
        (value) {
      return _then(_self.copyWith(repeatPasswordError: value));
    });
  }
}

// dart format on
