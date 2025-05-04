import 'package:detective/presentation/main/common/app_env.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../../../domain/models/user/user_model.dart';
import '../../../domain/storage/auth_storage.dart';
import '../../../presentation/shared/navigation/route_constants.dart';

class AuthStorageSupabase implements AuthStorage {
  static const String _deleteUserFunction = 'delete_user';

  final SupabaseClient supabaseClient;

  AuthStorageSupabase({
    required this.supabaseClient,
  });

  @override
  Future<AuthenticationStatus> getAuthStatus() async =>
      supabaseClient.auth.currentSession == null
          ? AuthenticationStatus.unauthenticated
          : AuthenticationStatus.authenticated;

  @override
  Future<void> logout() => supabaseClient.auth.signOut();

  @override
  Future<UserModel> signInWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    final response = await supabaseClient.auth.signInWithPassword(
      email: email,
      password: password,
    );

    return UserModel.fromSupabaseUser(
      {
        'id': response.user?.id,
        'email': response.user?.email,
      },
    );
  }

  @override
  Future<void> signInWithGoogle() => supabaseClient.auth.signInWithOAuth(
        OAuthProvider.google,
        redirectTo: EnvInfo.redirectUrl,
      );

  @override
  Future<UserModel> signUpWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    final response = await supabaseClient.auth.signUp(
      email: email,
      password: password,
    );

    return UserModel.fromSupabaseUser(
      {
        'id': response.user?.id,
        'email': response.user?.email,
      },
    );
  }

  @override
  Future<void> deleteAccount() =>
      supabaseClient.functions.invoke(_deleteUserFunction);

  @override
  Future<UserModel> getCurrentUser() async {
    final User? user = supabaseClient.auth.currentUser;

    return UserModel.fromSupabaseUser(
      {
        'id': user?.id,
        'email': user?.email,
      },
    );
  }

  @override
  Future<void> sendPasswordResetEmail({required String email}) =>
      supabaseClient.auth.resetPasswordForEmail(
        email,
        redirectTo: EnvInfo.redirectUrl + RouteConstants.resetPassword.path,
      );

  @override
  Future<void> resetPassword({
    required String password,
    required String confirmPassword,
  }) =>
      supabaseClient.auth.updateUser(
        UserAttributes(password: password),
      );

  @override
  Future<void> setSessionFromUri(Uri uri) =>
      supabaseClient.auth.getSessionFromUrl(uri);
}
