import 'package:detective/presentation/app/app_locators.dart';
import 'package:detective/presentation/shared/navigation/route_constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../test_helper.dart';

void main() {
  testWidgets('SplashPage test', (WidgetTester tester) async {
    await buildTestWidget(
      tester,
      initialLocation: RouteConstants.splash.path,
    );
    expect(find.byKey(Key(AppLocators.splashPage)), findsOneWidget);
  });
}
