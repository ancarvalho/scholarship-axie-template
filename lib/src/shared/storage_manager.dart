import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';
class StorageManager with ChangeNotifier {
  Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

  Future<void> saveData(String key, String value) async{
    final SharedPreferences prefs = await _prefs;
    prefs.setString(key, value);
  }

  Future<dynamic> readData(String key) async {
    final SharedPreferences prefs = await _prefs;
    var result = prefs.getString(key);
    return result;
  }
}