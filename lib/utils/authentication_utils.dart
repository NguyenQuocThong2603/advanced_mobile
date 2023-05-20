
import 'package:advanced_mobile/config/preference.dart';
import 'package:advanced_mobile/providers/course.provider.dart';
import 'package:advanced_mobile/providers/tutor_provider.dart';
import 'package:advanced_mobile/providers/upcoming_provider.dart';
import 'package:advanced_mobile/providers/user_provider.dart';
import 'package:advanced_mobile/screens/login/login.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:provider/provider.dart';

Future<void> logout(context) async{
  final pref = Preference.getInstance();
  final googleSignIn = GoogleSignIn();
  await pref.removeData('accessToken');
  await pref.removeData('history');
  Provider.of<CourseProvider>(context, listen: false).removeState();
  Provider.of<TutorProvider>(context, listen: false).removeState();
  Provider.of<UserProvider>(context, listen: false).removeState();
  Provider.of<UpcomingProvider>(context, listen: false).removeState();
  googleSignIn.signOut();
  Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) => const LoginScreen()), (route) => false);
}