import 'package:advanced_mobile/config/color.dart';
import 'package:advanced_mobile/config/preference.dart';
import 'package:advanced_mobile/screens/content.dart';
import 'package:advanced_mobile/screens/login/login.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class InitialScreen extends StatefulWidget {
  const InitialScreen({Key? key}) : super(key: key);

  @override
  State<InitialScreen> createState() => _InitialScreenState();
}

class _InitialScreenState extends State<InitialScreen> {
  final pref = Preference.getInstance();
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      String? token = pref.getString('accessToken');
      if(token != null ){
        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=> const ContentScreen()));
      }
      else{
        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=> const LoginScreen()));
      }
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SpinKitWave(
        color: AppColors.primary,
        size: 50,
      ),
    );
  }
}
