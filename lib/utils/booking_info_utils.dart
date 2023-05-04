import 'package:advanced_mobile/models/schedule/booking_info_model.dart';

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