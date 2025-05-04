import 'package:detective/data/storage/auth_storage/auth_storage_fake.dart';
import 'package:detective/data/storage/auth_storage/auth_storage_supabase.dart';
import 'package:detective/domain/storage/auth_storage.dart';
import 'package:detective/presentation/main/common/app_env.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../../data/storage/app_storage/app_storage_local.dart';
import '../storage/app_storage.dart';

final appStorageProvider = Provider((ref) {
  final AppStorage appStorage = AppStorageLocal();
  appStorage.init();
  return appStorage;
});

final authStorageProvider = Provider<AuthStorage>((ref) {
  return EnvInfo.environment == AppEnvironment.dev
      ? AuthStorageFake()
      : AuthStorageSupabase(supabaseClient: Supabase.instance.client);
});
