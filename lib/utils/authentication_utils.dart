
import 'package:advanced_mobile/config/preference.dart';
import 'package:advanced_mobile/screens/login/login.dart';
import 'package:flutter/material.dart';

Future<void> logout(context) async{
  final pref = Preference.getInstance();
  await pref.removeData('accessToken');
  await pref.removeData('history');
  Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) => const LoginScreen()), (route) => false);
}