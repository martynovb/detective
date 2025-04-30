import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../app/app.dart';
import 'common/app_env.dart';
import 'common/observers.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  EnvInfo.initialize(AppEnvironment.dev);
  SystemChrome.setSystemUIOverlayStyle(
    SystemUiOverlayStyle.light.copyWith(
      statusBarColor: Colors.black,
      statusBarBrightness: Brightness.light,
    ),
  );
  runApp(ProviderScope(
    observers: [
      Observers(),
    ],
    child: AppWidget(),
  ));
}