import 'package:shared_preferences/shared_preferences.dart';

abstract class StorageKeys {
  StorageKeys();

  //Declare all storage keys here & create its correpsonding setters & getters
  static const String token = "TOKEN";
  static const String language = "lan";
  static const String Name = "NAME";
}

class CacheHelper {
  static late SharedPreferences sharedPreferences;

  static init() async {
    sharedPreferences = await SharedPreferences.getInstance();
  }
// ========================== 🔥 token 🔥 ========================== //

  get getToken {
    return sharedPreferences.getString(StorageKeys.token) ?? "";
  }
  setToken(String token) {
    sharedPreferences.setString(StorageKeys.token, token);
  }

// ========================== 🔥 Language 🔥 ========================== //
  get getLanguage {
    return sharedPreferences.getString(StorageKeys.language) ?? "";
  }

  setLanguage(String lang) {
    return sharedPreferences.setString(StorageKeys.language, lang);
  }
  // ========================== 🔥 name 🔥 ========================== //
  get getName {
    return sharedPreferences.getString(StorageKeys.Name) ?? "";
  }
  setName(String Name) {
    sharedPreferences.setString(StorageKeys.Name, Name);
  }

  static Future<bool> saveData({required String key, dynamic value}) {
    if (value is bool) {
      return sharedPreferences.setBool(key, value);
    } else if (value is String) {
      return sharedPreferences.setString(key, value);
    } else if (value is double) {
      return sharedPreferences.setDouble(key, value);
    } else {
      return sharedPreferences.setInt(key, value);
    }
  }

  static dynamic getData({required String key}) => sharedPreferences.get(key);

  static Future<bool> removeData({required String key}) =>
      sharedPreferences.remove(key);
}
