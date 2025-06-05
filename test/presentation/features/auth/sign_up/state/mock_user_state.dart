import 'package:detective/presentation/feature/auth/sign_up/state/sign_up_state.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:formz/formz.dart';

class MockSignUpStateNotifier extends StateNotifier<SignUpState> {
  MockSignUpStateNotifier()
      : super(SignUpState(status: FormzSubmissionStatus.initial));

  void setState(SignUpState newState) {
    state = newState;
  }
}