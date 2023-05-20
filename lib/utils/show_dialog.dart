import 'package:advanced_mobile/models/schedule/booking_info_model.dart';
import 'package:advanced_mobile/models/schedule/schedule_model.dart';
import 'package:advanced_mobile/providers/tutor_provider.dart';
import 'package:advanced_mobile/providers/upcoming_provider.dart';
import 'package:advanced_mobile/screens/tutor_detail/booking_dialog.dart';
import 'package:advanced_mobile/screens/tutor_detail/report_dialog.dart';
import 'package:advanced_mobile/screens/upcoming/cancel_dialog.dart';
import 'package:advanced_mobile/screens/upcoming/edit_request_dialog.dart';
import 'package:flutter/material.dart';

void showBookingDialog(BuildContext context, TutorProvider tutorProvider, DateTime bookedDate, String tutorId){
  int nowTimestamp = DateTime.now().millisecondsSinceEpoch;
  int timestamp = bookedDate.millisecondsSinceEpoch;
  Iterable<Schedule> bookingClass = tutorProvider.schedules.where((element) =>
  element.startTimestamp == timestamp && element.isBooked == false && nowTimestamp < element.startTimestamp);
  if(bookingClass.isNotEmpty){
    showDialog(context: context, builder: (BuildContext context) =>
        BookingDialog(bookedDate: bookedDate,tutorProvider: tutorProvider,tutorId: tutorId,));
  }
}

void showReportDialog(BuildContext context,String tutorId, String tutorName,TutorProvider tutorProvider){
  showDialog(context: context, builder: (BuildContext context) =>
      ReportDialog(tutorId: tutorId,tutorName: tutorName, tutorProvider: tutorProvider,));
}

void showCancelDialog(BuildContext context,BookingInfo booking, UpcomingProvider upcomingProvider){
  showDialog(context: context, builder: (BuildContext context) =>
      CancelDialog(bookingInfo: booking,upcomingProvider: upcomingProvider,));
}

void showEditRequestDialog(BuildContext context,BookingInfo booking, UpcomingProvider upcomingProvider, int page, int perPage){
  showDialog(context: context, builder: (BuildContext context) =>
      EditRequestDialog(bookingInfo: booking,upcomingProvider: upcomingProvider,page:page,perPage: perPage,));
}

