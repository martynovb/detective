import 'package:detective/domain/providers/storage_providers.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../feature/auth/login/state/login_state.dart';
import '../feature/auth/login/state/login_state_notifier.dart';
import '../feature/auth/sign_up/state/sign_up_state.dart';
import '../feature/auth/sign_up/state/sign_up_state_notifier.dart';
import '../shared/globals.dart';

final splashDelayProvider = FutureProvider<void>((ref) async {
  await Future.delayed(defaultSplashDuration);
});

final signUpStateNotifierProvider =
    StateNotifierProvider.autoDispose<SignUpNotifier, SignUpState>(
  (ref) => SignUpNotifier(authStorage: ref.watch(authStorageProvider)),
);

final loginStateNotifierProvider =
    StateNotifierProvider.autoDispose<LoginNotifier, LoginState>(
  (ref) => LoginNotifier(authStorage: ref.watch(authStorageProvider)),
);
