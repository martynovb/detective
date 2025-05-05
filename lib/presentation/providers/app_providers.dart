import 'package:detective/presentation/shared/navigation/go_router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../domain/providers/storage_providers.dart';
import '../shared/theme/app_theme.dart';
import '../shared/widgets/dialogs/dialogs_manager.dart';

final appThemeProvider = StateNotifierProvider<AppThemeModeNotifier, ThemeMode>(
  (ref) {
    final storage = ref.watch(appStorageProvider);
    return AppThemeModeNotifier(storage);
  },
);

final dialogsManagerProvider =
    Provider<DialogsManager>((ref) => DialogsManager(rootNavigatorKey));
