import 'package:advanced_mobile/models/schedule/schedule_model.dart';
import 'package:advanced_mobile/models/tutor/tutor_model.dart';
import 'package:advanced_mobile/models/user/feedback_model.dart';
import 'package:advanced_mobile/services/tutor_service.dart';
import 'package:advanced_mobile/utils/tutor_utils.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';

class TutorProvider extends ChangeNotifier{
  List<Tutor> tutors = [];
  int nationalityIndex = 0;
  final nationalities = ['None','Vietnamese','Native'];
  Tutor? tutorInfo;
  late int startTimestamp;
  late int endTimestamp;
  late List<Schedule> schedules;
  late List<FeedBack> feedbacks = [];
  List<TimeRegion> regions = [];


  TutorProvider(){
    DateTime now = DateTime.now();
    startTimestamp = DateTime(now.year,now.month, now.day - now.weekday % 7).millisecondsSinceEpoch;
    DateTime lastDayOfWeek = now.add(const Duration(days: 6));
    endTimestamp = DateTime(lastDayOfWeek.year,lastDayOfWeek.month,lastDayOfWeek.day).millisecondsSinceEpoch -1;
  }

  Future<void> getListTutors(String speciality, BuildContext context) async{
      final response = await TutorService.getListTutors(speciality);
      if(response.data['statusCode'] == 401){
        Navigator.pop(context);
      }
      if (response.data['statusCode'] == 200) {
        final List<dynamic> data = response.data['rows'];
        var result = data.map((tutor) => Tutor.fromJson(tutor)).toList();
        tutors =  sortTutorByFavoriteAndRating(result);
        notifyListeners();
      } else {
        throw Exception(response.data['message']);
      }
  }

  Future<void> searchTutorByName(
      String name, String speciality,String nationality,context) async{
    Object data = {};
    if(nationality == nationalities[nationalityIndex]) return;
    if(nationality == 'Vietnamese') {
      data = {"isVietNamese": true};
      nationalityIndex = 1;
    } else if(nationality == 'Native'){
      data = {"isNative": true};
      nationalityIndex = 2;
    }
    else{
      nationalityIndex = 0;
    }
    notifyListeners();
    final response = await TutorService.searchTutorByName(name,speciality,data);
    if(response.data['statusCode'] == 401){
      Navigator.pop(context);
    }
    if (response.data['statusCode'] == 200) {
      final List<dynamic> data = response.data['rows'];
      var result = data.map((tutor) => Tutor.fromJson(tutor)).toList();
      tutors =  sortTutorByFavoriteAndRating(result);
      notifyListeners();
    } else {
      throw Exception(response.data['message']);
    }
  }

  Future<void> getTutorInformation(String tutorId,context) async{
    final response = await TutorService.getTutorInformation(tutorId);
    if(response.data['statusCode'] == 401){
      Navigator.pop(context);
    }
    if (response.data['statusCode'] == 200) {
      tutorInfo = Tutor.fromJson(response.data);
      notifyListeners();
    } else {
      throw Exception(response.data['message']);
    }
  }

  void removeTutorInfo(context){
    tutorInfo = null;
    Navigator.pop(context);
  }

  Future<void> manageFavoriteTutor(String tutorId,context) async {
    final response = await TutorService.manageFavoriteTutor(tutorId);
    if(response.data['statusCode'] == 401){
      Navigator.pop(context);
    }
    if (response.data['statusCode'] == 200) {
      if(response.data['result'] == 1){
        tutorInfo!.isFavouriteTutor = false;
      }
      else{
        tutorInfo!.isFavouriteTutor = true;
      }
      notifyListeners();
    } else {
      throw Exception(response.data['message']);
    }
  }

  Future<void> getScheduleOfTutor(String tutorId,DateTime? startDate, DateTime? endDate,context) async {
    if(startDate !=null){
      startTimestamp = startDate.millisecondsSinceEpoch;
    }
    if(endDate !=null){
      endTimestamp = endDate.millisecondsSinceEpoch;
    }
    final response = await TutorService.getScheduleOfTutor(tutorId, startTimestamp, endTimestamp);
    if(response.data['statusCode'] == 401){
      Navigator.pop(context);
    }
    if (response.data['statusCode'] == 200) {
      regions = [];
      final List<dynamic> data = response.data['scheduleOfTutor'];
      schedules = data.map((schedule) => Schedule.fromJson(schedule)).toList();
      for(int i =0 ; i<schedules.length; i++){
        if(schedules[i].isBooked == true){
          regions.add(TimeRegion(
            startTime: DateTime.fromMillisecondsSinceEpoch(schedules[i].startTimestamp),
            endTime: DateTime.fromMillisecondsSinceEpoch(schedules[i].endTimestamp),
            text: '${schedules[i].scheduleDetails[0].id}:Booked',
          ),
          );
        }
        else{
          if(DateTime.now().millisecondsSinceEpoch > schedules[i].startTimestamp){
            regions.add(TimeRegion(
              startTime: DateTime.fromMillisecondsSinceEpoch(schedules[i].startTimestamp),
              endTime: DateTime.fromMillisecondsSinceEpoch(schedules[i].endTimestamp),
              text: '${schedules[i].scheduleDetails[0].id}:Can not book',
            ),
            );
          }
          else{
            regions.add(TimeRegion(
              startTime: DateTime.fromMillisecondsSinceEpoch(schedules[i].startTimestamp),
              endTime: DateTime.fromMillisecondsSinceEpoch(schedules[i].endTimestamp),
              text: '${schedules[i].scheduleDetails[0].id}:Book',
            ),
            );
          }
        }
      }
     notifyListeners();
    } else {
      throw Exception(response.data['message']);
    }
  }

  Future<void> getFeedbacks(String tutorId,context) async{
    final response = await TutorService.getFeedbacks(tutorId);
    if(response.data['statusCode'] == 401){
      Navigator.pop(context);
    }
    if (response.data['statusCode'] == 200) {
      final List<dynamic> data = response.data['data']['rows'];
      feedbacks = data.map((feedback) => FeedBack.fromJson(feedback)).toList();
      notifyListeners();
    } else {
      throw Exception(response.data['message']);
    }
  }

  Future<void> bookClass(DateTime date,context) async {
    int timestamp = date.millisecondsSinceEpoch;
    Iterable<Schedule> bookingClass = schedules.where((element) => element.startTimestamp == timestamp);
    
  }
}