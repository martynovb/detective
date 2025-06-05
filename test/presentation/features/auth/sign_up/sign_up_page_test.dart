import 'package:detective/domain/field_validators/field_validation_error_model.dart';
import 'package:detective/domain/storage/auth_storage.dart';
import 'package:detective/presentation/app/app_locators.dart';
import 'package:detective/presentation/feature/auth/sign_up/state/sign_up_state.dart';
import 'package:detective/presentation/providers/feature_providers.dart';
import 'package:detective/presentation/shared/navigation/route_constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:formz/formz.dart';

import '../../../../data/mocks/storage_mocks.dart';
import '../../../../test_helper.dart';
import '../../../mocks/state_notifier_mocks.dart';

void main() {
  late final AuthStorage authStorageMock;

  setUpAll(() {
    authStorageMock = AuthStorageMock();
  });

  testWidgets('SignUpPage test', (WidgetTester tester) async {
    await buildTestWidget(
      tester,
      initialLocation: RouteConstants.signUp.path,
    );
    expect(find.byKey(Key(AppLocators.signUpPage)), findsOneWidget);
  });

  testWidgets('SignUpPage input fields errors', (WidgetTester tester) async {
    final fakeSignUpNotifier = FakeSignUpNotifier(authStorageMock);

    await buildTestWidget(
      tester,
      initialLocation: RouteConstants.signUp.path,
      overrides: [
        signUpStateNotifierProvider.overrideWith((ref) => fakeSignUpNotifier),
      ],
    );
    expect(find.byKey(Key(AppLocators.signUpPage)), findsOneWidget);

    expect(find.byKey(Key(AppLocators.emailField)), findsOneWidget);
    expect(find.byKey(Key(AppLocators.passwordField)), findsOneWidget);
    expect(find.byKey(Key(AppLocators.repeatPasswordField)), findsOneWidget);
    expect(find.byKey(Key(AppLocators.signUpButton)), findsOneWidget);
    expect(
      find.byKey(Key(AppLocators.continueWithGoogleButton)),
      findsOneWidget,
    );

    await tester.tap(find.byKey(Key(AppLocators.signUpButton)));

    fakeSignUpNotifier.setState(
      SignUpState(
        status: FormzSubmissionStatus.failure,
        emailError: FieldValidationErrorModel(
          errorMessage: 'error',
          errorType: FieldValidationError.invalid,
        ),
        passwordError: FieldValidationErrorModel(
          errorMessage: 'error',
          errorType: FieldValidationError.invalid,
        ),
        repeatPasswordError: FieldValidationErrorModel(
          errorMessage: 'error',
          errorType: FieldValidationError.invalid,
        ),
      ),
    );

    await tester.pumpAndSettle();

    expect(
      find.byKey(Key(AppLocators.emailFieldError)),
      findsOneWidget,
    );
    expect(
      find.byKey(Key(AppLocators.passwordFieldError)),
      findsOneWidget,
    );
    expect(
      find.byKey(Key(AppLocators.repeatPasswordFieldError)),
      findsOneWidget,
    );

    final correctEmail = 'test@email.com';
    final correctPass = 'Qqqqqq1!';
    await tester.enterText(
      find.byKey(Key(AppLocators.emailField)),
      correctEmail,
    );
    await tester.enterText(
      find.byKey(Key(AppLocators.passwordField)),
      correctPass,
    );
    await tester.enterText(
      find.byKey(Key(AppLocators.repeatPasswordField)),
      correctPass,
    );

    await tester.tap(find.byKey(Key(AppLocators.signUpButton)));

    fakeSignUpNotifier.setState(
      SignUpState(
        status: FormzSubmissionStatus.initial,
      ),
    );

    await tester.pump();


    // errors should be removed

    expect(
      find.byKey(Key(AppLocators.emailFieldError)),
      findsNothing,
    );

    expect(
      find.byKey(Key(AppLocators.passwordFieldError)),
      findsNothing,
    );

    expect(
      find.byKey(Key(AppLocators.repeatPasswordFieldError)),
      findsNothing,
    );
  });
}
