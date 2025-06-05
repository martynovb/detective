import 'package:detective/presentation/app/app_locators.dart';
import 'package:detective/presentation/shared/navigation/route_constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../../test_helper.dart';

void main() {
  testWidgets('LoginPage test', (WidgetTester tester) async {
    await buildTestWidget(
      tester,
      initialLocation: RouteConstants.login.path,
    );
    expect(find.byKey(Key(AppLocators.loginPage)), findsOneWidget);
  });

  testWidgets('LoginPage by default test', (WidgetTester tester) async {
    await buildTestWidget(tester);
    expect(find.byKey(Key(AppLocators.loginPage)), findsNothing);
    await tester.pump(Duration(seconds: 3));
    expect(find.byKey(Key(AppLocators.loginPage)), findsOneWidget);
  });
}
