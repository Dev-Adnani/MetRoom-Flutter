import 'package:shared_preferences/shared_preferences.dart';

class CacheService {
  static Future conditionalCache({
    required dynamic key,
    required dynamic actionIfNull,
    required dynamic actionIfNotNull,
  }) async {
    dynamic cacheData = await getString(key: key);
    if (cacheData == null) {
      actionIfNull();
    } else {
      actionIfNotNull();
    }
  }

  static Future getString({required String key}) async {
    final SharedPreferences sharedPreferences =
        await SharedPreferences.getInstance();
    var cache = sharedPreferences.getString(key);
    return cache;
  }

  static Future deleteKey({required String key}) async {
    final SharedPreferences sharedPreferences =
        await SharedPreferences.getInstance();
    await sharedPreferences.remove(key);
  }

  static Future setString({required String key, required String value}) async {
    final SharedPreferences sharedPreferences =
        await SharedPreferences.getInstance();
    await sharedPreferences.setString(key, value);
  }
}
