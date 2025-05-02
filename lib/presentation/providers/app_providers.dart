import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../data/storage/providers/providers.dart';
import '../shared/theme/app_theme.dart';

final appThemeProvider = StateNotifierProvider<AppThemeModeNotifier, ThemeMode>(
  (ref) {
    final storage = ref.watch(appStorageProvider);
    return AppThemeModeNotifier(storage);
  },
);
