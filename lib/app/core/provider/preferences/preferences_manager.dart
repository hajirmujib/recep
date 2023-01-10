import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesManager {
  final SharedPreferences prefs;
  SharedPreferencesManager({required this.prefs});

  Future<String?> getStringPref(String key) async {
    return prefs.getString(key);
  }

  Future<void> saveStringPref(String key, String value) async {
    await prefs.setString(key, value);
  }

  Future<bool?> getBoolPref(String key) async {
    return prefs.getBool(key);
  }

  Future<void> saveBoolPref(String key, bool value) async {
    await prefs.setBool(key, value);
  }

  Future<void> saveListPref(String key, List<String> value) async {
    await prefs.setStringList(key, value);
  }

  Future<List<String>?> getListPref(String key) async {
    return prefs.getStringList(key);
  }

  Future<void> deleteByKey(String key) async {
    await prefs.remove(key);
  }

  Future<void> deleteAllPreferences() async {
    await prefs.clear();
  }

  Future<bool?> isAvailable(String key) async {
    return await prefs.containsKey(key);
  }
}
