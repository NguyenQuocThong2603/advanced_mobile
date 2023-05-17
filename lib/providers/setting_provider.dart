import 'package:advanced_mobile/config/preference.dart';
import 'package:flutter/material.dart';

class SettingProvider extends ChangeNotifier{
  late String language;
  late String theme;
  final pref = Preference.getInstance();
  SettingProvider(){
    final lang = pref.getString('language');
    if(lang ==null){
      language = 'english';
    }
    else{
      language = lang;
    }
    final themeStorage = pref.getString('theme');
    if(themeStorage ==null){
      theme = 'light';
    }
    else{
      theme = themeStorage;
    }
    notifyListeners();
  }
  Future<void> changeLanguage (String lang) async {
    if(lang =='english'){
      language = 'english';
    }
    else{
      language = 'vietnamese';
    }
    await pref.setString('language', language);
    notifyListeners();
  }

  Future<void> changeTheme (String themeValue) async {
    if(themeValue =='light'){
      theme = 'light';
    }
    else{
      theme = 'dark';
    }
    await pref.setString('theme', theme);
    print(theme);
    notifyListeners();
  }
}