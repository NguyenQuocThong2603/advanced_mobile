import 'package:advanced_mobile/screens/login/login.dart';
import 'package:advanced_mobile/services/upcoming_service.dart';
import 'package:flutter/material.dart';

class UpcomingProvider extends ChangeNotifier{
  int totalHour = 0;
  int totalMinute = 0;

  Future<void> getTotalLessonTime(context) async{
    final response = await UpcomingService.getTotalLessonTime();
    if(response.data['statusCode'] == 401){
      Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) => const LoginScreen()), (route) => false);
    }
    if (response.data['statusCode'] == 200) {
      int total = response.data['total'];
      totalHour = total ~/ 60;
      totalMinute = total % 60;
      notifyListeners();
    } else {
      throw Exception(response.data['message']);
    }
  }
}