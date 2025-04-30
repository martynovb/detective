import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../data/storage/app_storage/app_storage.dart';
import '../../data/storage/app_storage/app_storage_impl.dart';

final appStorageProvider = Provider((ref) {
  final AppStorage appStorage = AppStorageImpl();
  appStorage.init();
  return appStorage;
});
