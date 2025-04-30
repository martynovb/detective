import 'dart:async';

import 'package:shared_preferences/shared_preferences.dart';

import 'app_storage.dart';

class AppStorageImpl implements AppStorage {
  SharedPreferences? sharedPreferences;

  final Completer<SharedPreferences> _initCompleter =
      Completer<SharedPreferences>();

  @override
  void init() {
    _initCompleter.complete(SharedPreferences.getInstance());
  }

  @override
  Future<T?> get<T>(String key) async {
    sharedPreferences = await _initCompleter.future;
    return sharedPreferences!.get(key) as T?;
  }

  @override
  Future<bool> set(String key, value) async {
    sharedPreferences = await _initCompleter.future;

    if (value is String) {
      return await sharedPreferences!.setString(key, value);
    } else if (value is bool) {
      return await sharedPreferences!.setBool(key, value);
    } else if (value is int) {
      return await sharedPreferences!.setInt(key, value);
    } else if (value is double) {
      return await sharedPreferences!.setDouble(key, value);
    } else if (value is List<String>) {
      return await sharedPreferences!.setStringList(key, value);
    }

    throw Exception('Unsupported value type: ${value.runtimeType}');
  }
}
