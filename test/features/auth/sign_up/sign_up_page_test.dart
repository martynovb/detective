import 'package:detective/presentation/app/app_locators.dart';
import 'package:detective/presentation/shared/navigation/route_constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../test_helper.dart';

void main() {
  testWidgets('SignUpPage test', (WidgetTester tester) async {
    await buildTestWidget(
      tester,
      initialLocation: RouteConstants.signUp.path,
    );
    expect(find.byKey(Key(AppLocators.signUpPage)), findsOneWidget);
  });

  testWidgets('SignUpPage input fields errors', (WidgetTester tester) async {
    await buildTestWidget(
      tester,
      initialLocation: RouteConstants.signUp.path,
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
        find.byKey(Key(AppLocators.emailField)), correctEmail);
    await tester.enterText(
        find.byKey(Key(AppLocators.passwordField)), correctPass);
    await tester.enterText(
        find.byKey(Key(AppLocators.repeatPasswordField)), correctPass);
    await tester.tap(find.byKey(Key(AppLocators.signUpButton)));
    await tester.pumpAndSettle();

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
