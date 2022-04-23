import 'package:shared_preferences/shared_preferences.dart';

class CacheHelper {
  static late SharedPreferences sharedPreferences;

  static init() async {
    sharedPreferences = await SharedPreferences.getInstance();
  }

  static Future<bool> putBoolean(
      {required String key, required bool value}) async {
    return await sharedPreferences.setBool(key, value);
  }

  static bool? getBoolean({required String key}) {
    return sharedPreferences.getBool(key);
  }

  static Future<void> putDouble(
      {required String key, required double value}) async {
    await sharedPreferences.setDouble(key, value);
  }

  static double? getDouble({required String key}) {
    return sharedPreferences.getDouble(key);
  }
}
