//!using shared perferences

import 'package:shared_preferences/shared_preferences.dart';

class AppLocalStorage {
  static String token = 'token';
  static late SharedPreferences _preferences;

  static Future<void> init() async {
    _preferences = await SharedPreferences.getInstance();
  }

//cahce Data
  static cacheData(String key, dynamic value) {
    if (value is String) {
      _preferences.setString(key, value);
    } else if (value is int) {
      _preferences.setInt(key, value);
    } else if (value is bool) {
      _preferences.setBool(key, value);
    } else if (value is double) {
      _preferences.setDouble(key, value);
    } else {
      _preferences.setStringList(key, value);
    }
  }

  //Get Cache
  static dynamic getCacheData(String key) {
    return _preferences.get(key);
  }
}
