import 'dart:convert';

import 'package:advanced_mobile/models/schedule/booking_info_model.dart';
import 'package:advanced_mobile/services/upcoming_service.dart';
import 'package:advanced_mobile/utils/authentication_utils.dart';
import 'package:advanced_mobile/utils/booking_info_utils.dart';
import 'package:flutter/material.dart';

class UpcomingProvider extends ChangeNotifier{
  int totalHour = 0;
  int totalMinute = 0;
  List<BookingInfo> upcomingClasses = [];
  List<BookingInfo> history = [];


  void removeState(){
    totalHour = 0;
    totalMinute = 0;
    upcomingClasses = [];
    history = [];
  }
  Future<void> getTotalLessonTime(context) async{
    final response = await UpcomingService.getTotalLessonTime();
    if(response.data['statusCode'] == 401){
      logout(context);
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

  Future<void> getUpcomingClasses(context) async{
    final response = await UpcomingService.getUpcomingClasses();
    if(response.data['statusCode'] == 401){
      logout(context);
    }
    if (response.data['statusCode'] == 200) {
      List<dynamic> data = response.data['data']['rows'];
      List<BookingInfo> bookings = data.map((e) => BookingInfo.fromJson(e)).toList();
      List<BookingInfo> cloneBookings = data.map((e) => BookingInfo.fromJson(e)).toList();
      List<BookingInfo> result = [];

      if(bookings.isNotEmpty){
        result.add(bookings[0]);
      }
      for(int i = 1 ;i < bookings.length;i++){
        if(checkContinuousClasses(result[result.length-1], bookings[i])){
          if(result.length == 1){
            result[result.length-1].subBooking!.add(cloneBookings[i-1]);
          }
          if(result[result.length-1].scheduleDetailInfo!.endPeriodTimestamp ==
              bookings[i-1].scheduleDetailInfo!.endPeriodTimestamp &&
          result[result.length-1].subBooking!.isEmpty){
            result[result.length-1].subBooking!.add(cloneBookings[i-1]);
          }
          result[result.length-1].subBooking!.add(cloneBookings[i]);
          result[result.length-1].scheduleDetailInfo!.endPeriodTimestamp =
              bookings[i].scheduleDetailInfo!.endPeriodTimestamp;
        }else {
          result.add(bookings[i]);
        }
      }
      upcomingClasses = result;
      notifyListeners();
    } else {
      throw Exception(response.data['message']);
    }
  }

  Future<void> getHistory(context) async{
    final response = await UpcomingService.getHistory();
    if(response.data['statusCode'] == 401){
      logout(context);
    }
    if (response.data['statusCode'] == 200) {
      List<dynamic> data = response.data['data']['rows'];
      List<BookingInfo> bookings = data.map((e) => BookingInfo.fromJson(e)).toList();
      List<BookingInfo> cloneBookings = data.map((e) => BookingInfo.fromJson(e)).toList();
      List<BookingInfo> result = [];

      if(bookings.isNotEmpty){
        result.add(bookings[0]);
      }
      for(int i = 1 ;i < bookings.length ;i++){
        if(checkContinuousHistory(result[result.length-1], bookings[i])){

          result[result.length-1].subBooking!.add(cloneBookings[i-1]);
          result[result.length-1].subBooking!.add(cloneBookings[i]);
          result[result.length-1].scheduleDetailInfo!.startPeriodTimestamp =
              bookings[i].scheduleDetailInfo!.startPeriodTimestamp;
        }else {
          result.add(bookings[i]);
        }
      }
      history = result;
      notifyListeners();
    } else {
      throw Exception(response.data['message']);
    }
  }
}