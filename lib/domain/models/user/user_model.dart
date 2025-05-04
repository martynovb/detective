import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_model.freezed.dart';

@freezed
abstract class UserModel with _$UserModel {
  const factory UserModel({
    required String id,
    required String email,
  }) = _UserModel;

  factory UserModel.fromSupabaseUser(Map<String, dynamic>? json) {
    return UserModel(
      id: json?['id'] ?? '',
      email: json?['email'] ?? '',
    );
  }
}
