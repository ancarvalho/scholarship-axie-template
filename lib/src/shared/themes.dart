import 'package:flutter/material.dart';
import 'package:scholarship/src/shared/storage_manager.dart';

class ThemeNotifier with ChangeNotifier {
  final darkTheme = ThemeData(
    primarySwatch: Colors.grey,
    primaryColor: Colors.black,
    brightness: Brightness.dark,
    backgroundColor: Colors.grey[850],
    accentColor: Colors.white,
    accentIconTheme: IconThemeData(color: Colors.black),
    dividerColor: Colors.black12,
    cardColor: Colors.grey[900]
  );

  final lightTheme = ThemeData(
    primarySwatch: Colors.grey,
    primaryColor: Colors.white,
    brightness: Brightness.light,
    backgroundColor: const Color(0xFFE5E5E5),
    accentColor: Colors.black,
    accentIconTheme: IconThemeData(color: Colors.white),
    dividerColor: Colors.white54,
    cardColor: Color(0xffffffff)
  );

  ThemeData? _themeData;
  ThemeData? getTheme() => _themeData;
  StorageManager _storageManager = StorageManager();
  bool isDark = false;

  ThemeNotifier() {
    _storageManager.readData('themeMode').then((value) {
      var themeMode = value ?? 'light';
      if (themeMode == 'light') {
        _themeData = lightTheme;
      } else {
        _themeData = darkTheme;
        setDark(true);
      }
      notifyListeners();
    });
  }

  setDark(bool b) {
    isDark = b;
    notifyListeners();
  }

  void setDarkMode() async {
    _themeData = darkTheme;
    _storageManager.saveData('themeMode', 'dark');
    setDark(true);
    notifyListeners();
  }

  void setLightMode() async {
    _themeData = lightTheme;
    _storageManager.saveData('themeMode', 'light');
    setDark(false);
    notifyListeners();
  }
}
