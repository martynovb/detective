import 'package:detective/domain/models/user/user_model.dart';
import 'package:detective/domain/storage/auth_storage.dart';

class AuthStorageFake extends AuthStorage {
  UserModel? currentUser;
  AuthenticationStatus currentStatus = AuthenticationStatus.unauthenticated;

  @override
  Future<void> deleteAccount() async {}

  @override
  Future<AuthenticationStatus> getAuthStatus() async {
    return currentStatus;
  }

  @override
  Future<UserModel> getCurrentUser() async {
    return currentUser!;
  }

  @override
  Future<void> logout() async {
    currentStatus = AuthenticationStatus.unauthenticated;
  }

  @override
  Future<void> resetPassword(
      {required String password, required String confirmPassword}) async {}

  @override
  Future<void> sendPasswordResetEmail({required String email}) async {}

  @override
  Future<void> setSessionFromUri(Uri uri) async {}

  @override
  Future<UserModel> signInWithEmailAndPassword(
      {required String email, required String password}) async {
    currentStatus = AuthenticationStatus.authenticated;
    currentUser = UserModel(id: '1', email: email);
    return currentUser!;
  }

  @override
  Future<void> signInWithGoogle() async {
    currentStatus = AuthenticationStatus.authenticated;
    currentUser = UserModel(id: '1', email: 'email@fake.com');
  }

  @override
  Future<UserModel> signUpWithEmailAndPassword(
      {required String email, required String password}) async {
    currentStatus = AuthenticationStatus.authenticated;
    currentUser = UserModel(id: '1', email: email);
    return currentUser!;
  }
}
