import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../app_storage/app_storage.dart';
import '../app_storage/app_storage_impl.dart';

final appStorageProvider = Provider((ref) {
  final AppStorage appStorage = AppStorageImpl();
  appStorage.init();
  return appStorage;
});
