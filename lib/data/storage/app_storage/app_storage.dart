abstract class AppStorage {
  void init();

  Future<bool> set(String key, value);

  Future<T?> get<T>(String key);

}
