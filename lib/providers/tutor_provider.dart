import 'package:advanced_mobile/models/schedule/schedule_model.dart';
import 'package:advanced_mobile/models/tutor/tutor_model.dart';
import 'package:advanced_mobile/models/user/feedback_model.dart';
import 'package:advanced_mobile/models/user/user_model.dart';
import 'package:advanced_mobile/services/tutor_service.dart';
import 'package:advanced_mobile/utils/authentication_utils.dart';
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
  int count = 0;
  bool isLoading = false;


  TutorProvider(){
    DateTime now = DateTime.now();
    startTimestamp = DateTime(now.year,now.month, now.day - now.weekday % 7).millisecondsSinceEpoch;
    DateTime lastDayOfWeek = now.add(const Duration(days: 6));
    endTimestamp = DateTime(lastDayOfWeek.year,lastDayOfWeek.month,lastDayOfWeek.day).millisecondsSinceEpoch -1;
  }

  void removeTutorsState(){
    tutors = [];
  }

  void removeState(){
    tutors = [];
    feedbacks = [];
    regions = [];
    schedules = [];
    tutorInfo = null;
    nationalityIndex = 0;
    count = 0;
  }
  Future<void> getListTutors(String name,String speciality, String nationality,
      int page,int perPage,context) async{
      print(perPage);
      final response = await TutorService.searchTutorByName(name,speciality,nationality,page, perPage);
      if(response.data['statusCode'] == 401){
        logout(context);
      }
      if (response.data['statusCode'] == 200) {
        final List<dynamic> data = response.data['rows'];
        var result = data.map((tutor) => Tutor.fromJson(tutor)).toList();
        tutors = sortTutorByFavoriteAndRating(result);
        count = response.data['count'];
        notifyListeners();
      } else {
        throw Exception(response.data['message']);
      }
  }

  Future<void> searchTutorByName(
      String name, String speciality,String nationality,
      int page,int perPage,bool isLoad,context) async{
    if(isLoad){
      isLoading = true;
    }
    Object data = {};
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
    final response = await TutorService.searchTutorByName(name,speciality,data,page,perPage);
    if(response.data['statusCode'] == 401){
      logout(context);
    }
    if (response.data['statusCode'] == 200) {
      final List<dynamic> data = response.data['rows'];
      var result = data.map((tutor) => Tutor.fromJson(tutor)).toList();
      tutors = tutors.followedBy(sortTutorByFavoriteAndRating(result)).toList();
      count = response.data['count'];
      if(isLoad){
        isLoading = false;
      }
      notifyListeners();
    } else {
      throw Exception(response.data['message']);
    }
  }

  Future<void> getTutorInformation(String tutorId,context) async{
    final response = await TutorService.getTutorInformation(tutorId);
    if(response.data['statusCode'] == 401){
      logout(context);
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
      logout(context);
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

  Future<void> likeTutor(String tutorId,context) async {
    final response = await TutorService.manageFavoriteTutor(tutorId);
    if(response.data['statusCode'] == 401){
      logout(context);
    }
    if (response.data['statusCode'] == 200) {
    } else {
      throw Exception(response.data['message']);
    }
  }

  Future<void> getScheduleOfTutor(
      String tutorId,
      DateTime? startDate, DateTime? endDate,
      User user,context) async {
    if(startDate !=null){
      startTimestamp = startDate.millisecondsSinceEpoch;
    }
    if(endDate !=null){
      endTimestamp = endDate.millisecondsSinceEpoch;
    }
    final response = await TutorService.getScheduleOfTutor(tutorId, startTimestamp, endTimestamp);
    if(response.data['statusCode'] == 401){
      logout(context);
    }
    if (response.data['statusCode'] == 200) {
      regions = [];
      final List<dynamic> data = response.data['scheduleOfTutor'];
      schedules = data.map((schedule) => Schedule.fromJson(schedule)).toList();
      for(int i =0 ; i<schedules.length; i++){
        if(schedules[i].isBooked == true){
          if(schedules[i].scheduleDetails[0].bookingInfo[0].userId == user.id){
            regions.add(TimeRegion(
                startTime: DateTime.fromMillisecondsSinceEpoch(schedules[i].startTimestamp),
                endTime: DateTime.fromMillisecondsSinceEpoch(schedules[i].endTimestamp),
                text: 'Booked',
                enablePointerInteraction: false
            ),
            );
          }else {
            regions.add(TimeRegion(
                startTime: DateTime.fromMillisecondsSinceEpoch(schedules[i].startTimestamp),
                endTime: DateTime.fromMillisecondsSinceEpoch(schedules[i].endTimestamp),
                text: 'Reserved',
                enablePointerInteraction: false
            ),
            );
          }
        }
        else{
          if(DateTime.now().millisecondsSinceEpoch > schedules[i].startTimestamp){
            regions.add(TimeRegion(
              startTime: DateTime.fromMillisecondsSinceEpoch(schedules[i].startTimestamp),
              endTime: DateTime.fromMillisecondsSinceEpoch(schedules[i].endTimestamp),
              text: 'Can not book',
              enablePointerInteraction: false
            ),
            );
          }
          else{
            regions.add(TimeRegion(
              startTime: DateTime.fromMillisecondsSinceEpoch(schedules[i].startTimestamp),
              endTime: DateTime.fromMillisecondsSinceEpoch(schedules[i].endTimestamp),
              text: 'Book',
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
      logout(context);
    }
    if (response.data['statusCode'] == 200) {
      final List<dynamic> data = response.data['data']['rows'];
      feedbacks = data.map((feedback) => FeedBack.fromJson(feedback)).toList();
      notifyListeners();
    } else {
      throw Exception(response.data['message']);
    }
  }

  Future<void> bookClass(DateTime date,String note,context) async {
    int nowTimestamp = DateTime.now().millisecondsSinceEpoch;
    int timestamp = date.millisecondsSinceEpoch;
    int? index;
    List<Schedule> bookingClass = [];
    for(int i= 0;i<schedules.length;i++){
      if(schedules[i].startTimestamp == timestamp &&
          schedules[i].isBooked == false &&
          nowTimestamp < schedules[i].startTimestamp){
        index = i;
        bookingClass.add(schedules[i]);
        break;
      }
    }
    if(index != null){
      final response = await TutorService.bookClass(bookingClass[0].scheduleDetails[0].id,note);
      if(response.data['statusCode'] == 401){
        logout(context);
      }
      if (response.data['statusCode'] != 200) {
        throw Exception(response.data['message']);
      }
    }
  }

  Future<void> reportTutor(String tutorId,String content,context) async {
    final response = await TutorService.reportTutor(tutorId, content);
    if (response.data['statusCode'] == 401) {
      logout(context);
    }
    if (response.data['statusCode'] != 200) {
      throw Exception(response.data['message']);
    }
  }
}