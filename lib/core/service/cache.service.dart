import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

enum ValueType {
  StringValue,
  IntValue,
}

class CacheService {
  static Future conditionalCache(
      {required dynamic key,
      required ValueType valueType,
      required dynamic actionIfNull,
      required dynamic actionIfNotNull}) async {
    switch (valueType) {
      case ValueType.StringValue:
        {
          dynamic cacheData = await getString(key: key);
          if (cacheData == null) {
            actionIfNull();
          } else {
            actionIfNotNull();
          }
        }
        break;
      case ValueType.IntValue:
        {
          dynamic cacheData = await getInt(key: key);
          if (cacheData == null) {
            actionIfNull();
          } else {
            actionIfNotNull();
          }
        }
        break;
    }
  }

  static Future getString({required String key}) async {
    final SharedPreferences sharedPreferences =
        await SharedPreferences.getInstance();
    var cache = sharedPreferences.getString(key);
    return cache;
  }

  static Future setString({required String key, required String value}) async {
    final SharedPreferences sharedPreferences =
        await SharedPreferences.getInstance();
    await sharedPreferences.setString(key, value);
  }

  static Future setInt({required String key, required int value}) async {
    final SharedPreferences sharedPreferences =
        await SharedPreferences.getInstance();
    await sharedPreferences.setInt(key, value);
  }

  static Future getInt({required String key}) async {
    final SharedPreferences sharedPreferences =
        await SharedPreferences.getInstance();
    var cache = sharedPreferences.getInt(key);
    return cache;
  }

  static Future setJson(
      {required String key, required Map<String, dynamic> value}) async {
    final SharedPreferences sharedPreferences =
        await SharedPreferences.getInstance();
    Map<String, dynamic> jsonMap = value;
    await sharedPreferences.setString(key, jsonEncode(jsonMap));
  }

  static Future getJson({required String key}) async {
    final SharedPreferences sharedPreferences =
        await SharedPreferences.getInstance();
    dynamic cache = sharedPreferences.getString(key);
    Map<String, dynamic> jsonMapCache =
        jsonDecode(cache) as Map<String, dynamic>;
    return jsonMapCache;
  }

  static Future deleteKey({required String key}) async {
    final SharedPreferences sharedPreferences =
        await SharedPreferences.getInstance();
    await sharedPreferences.remove(key);
  }
}
