import 'package:advanced_mobile/models/schedule/booking_info_model.dart';
import 'package:advanced_mobile/providers/upcoming_provider.dart';

bool checkContinuousClasses(BookingInfo bookingInfo1, BookingInfo bookingInfo2){
  if(bookingInfo2.scheduleDetailInfo!.startPeriodTimestamp -  bookingInfo1.scheduleDetailInfo!.endPeriodTimestamp <= 300000
      && bookingInfo1.scheduleDetailInfo!.scheduleInfo!.tutorId == bookingInfo2.scheduleDetailInfo!.scheduleInfo!.tutorId){
    return true;
  }
  return false;
}

bool checkContinuousHistory(BookingInfo bookingInfo1, BookingInfo bookingInfo2){
  if(bookingInfo1.scheduleDetailInfo!.startPeriodTimestamp -  bookingInfo2.scheduleDetailInfo!.endPeriodTimestamp <= 300000
      && bookingInfo1.scheduleDetailInfo!.scheduleInfo!.tutorId == bookingInfo2.scheduleDetailInfo!.scheduleInfo!.tutorId){
    return true;
  }
  return false;
}

bool checkHideCancelButton(BookingInfo bookingInfo){
  int now = DateTime.now().millisecondsSinceEpoch;
  int startTime = bookingInfo.scheduleDetailInfo!.startPeriodTimestamp;
  if(startTime - now > 7200000){
    return false;
  }
  return true;
}

bool checkDisableGoToMeeting(BookingInfo bookingInfo, UpcomingProvider upcomingProvider){
  int now = DateTime.now().millisecondsSinceEpoch;
  int startTime = bookingInfo.scheduleDetailInfo!.startPeriodTimestamp;
  int endTime = bookingInfo.scheduleDetailInfo!.endPeriodTimestamp;
  if(startTime - now > 86400000){
    return true;
  }
  if(now > endTime){
    return true;
  }
  if(upcomingProvider.isJoinedMeeting){
    return true;
  }
  return false;
}