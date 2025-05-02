import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../shared/globals.dart';

final splashDelayProvider = FutureProvider<void>((ref) async {
  await Future.delayed(defaultSplashDuration);
});
