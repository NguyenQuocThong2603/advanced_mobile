import 'package:shared_preferences/shared_preferences.dart';

class Preference {
  static Preference? _instance;
  late SharedPreferences _prefs;

  Preference._();

  static Preference getInstance() {
    _instance ??= Preference._();
    return _instance!;
  }

  Future<void> initPreference() async{
    _prefs = await SharedPreferences.getInstance();
  }

  Future<bool> setString(String key, String value) async{
    return await _prefs.setString(key, value);
  }
  String? getString(String key){
    return _prefs.getString(key);
  }
  Future<void> removeData(String key) async {
    await _prefs.remove(key);
  }
}