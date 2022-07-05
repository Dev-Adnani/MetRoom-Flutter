import 'package:flutter/material.dart';
import 'package:metroom/app/constants/app.keys.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ThemeNotifier with ChangeNotifier {
  bool _darktheme = false;
  bool get darkTheme => _darktheme;

  ThemeNotifier() {
    _loadFromPrefs();
  }

  toggleTheme() {
    _darktheme = !_darktheme;
    _saveToPrefs();
    notifyListeners();
  }

  _loadFromPrefs() async {
    var val = await getDarkMode();
    _darktheme = val ?? false;
    notifyListeners();
  }

  _saveToPrefs() async {
    await saveDarkMode(_darktheme);
  }

  static Future<bool> saveDarkMode(bool darkMode) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return await prefs.setBool(AppKeys.appMode, darkMode);
  }

  static Future<bool?> getDarkMode() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getBool(AppKeys.appMode);
  }
}