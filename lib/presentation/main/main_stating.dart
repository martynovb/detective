import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:fetch_client/fetch_client.dart';
import 'package:flutter_web_plugins/url_strategy.dart';

import '../app/app.dart';
import 'common/app_env.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();

  EnvInfo.initialize(AppEnvironment.staging);

  SystemChrome.setSystemUIOverlayStyle(
    SystemUiOverlayStyle.light.copyWith(
      statusBarColor: Colors.black,
      statusBarBrightness: Brightness.light,
    ),
  );

  await Supabase.initialize(
    url: EnvInfo.supabaseUrl,
    anonKey: EnvInfo.supabaseAnonKey,
    httpClient: FetchClient(mode: RequestMode.cors),
  );

  if (kIsWeb) {
    usePathUrlStrategy();
  }

  runApp(MainWidget());
}
