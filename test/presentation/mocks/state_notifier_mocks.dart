import 'package:detective/domain/storage/auth_storage.dart';
import 'package:detective/presentation/feature/auth/sign_up/state/sign_up_state.dart';
import 'package:detective/presentation/feature/auth/sign_up/state/sign_up_state_notifier.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:formz/formz.dart';

class FakeSignUpNotifier extends StateNotifier<SignUpState>
    implements SignUpNotifier {
  FakeSignUpNotifier(this.authStorage)
      : super(
          SignUpState(
            status: FormzSubmissionStatus.initial,
          ),
        );

  @override
  final AuthStorage authStorage;

  void setState(SignUpState newState) {
    state = newState;
  }

  @override
  Future<void> continueWithGoogle() async {}

  @override
  Future<void> signUp(
      {required String email,
      required String password,
      required String repeatPassword}) async {}
}
