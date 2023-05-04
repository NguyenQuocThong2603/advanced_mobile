import 'package:advanced_mobile/models/schedule/schedule_detail.dart';
import 'package:advanced_mobile/models/tutor/tutor_model.dart';

class Schedule {
  late String id;
  late String tutorId;
  late String startTime;
  late String endTime;
  late int startTimestamp;
  late int endTimestamp;
  late String createdAt;
  bool isBooked = false;
  List<ScheduleDetails> scheduleDetails = [];
  Tutor? tutorInfo;
  String? date;


  Schedule({
    required this.id,
    required this.tutorId,
    required this.startTime,
    required this.endTime,
    required this.startTimestamp,
    required this.endTimestamp,
    required this.createdAt,
    required this.isBooked,
    required this.scheduleDetails,
    this.tutorInfo,
    this.date
  });

  Schedule.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    tutorId = json['tutorId'];
    startTime = json['startTime'];
    endTime = json['endTime'];
    startTimestamp = json['startTimestamp'];
    endTimestamp = json['endTimestamp'];
    createdAt = json['createdAt'];
    isBooked = json['isBooked'] ?? false;
    if (json['scheduleDetails'] != null) {
      scheduleDetails = [];
      json['scheduleDetails'].forEach((v) {
        scheduleDetails.add(ScheduleDetails.fromJson(v));
      });
    }
    tutorInfo = json['tutorInfo'] != null ? Tutor.fromJson(json['tutorInfo']) : null;
    date = json['date'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['id'] = id;
    data['tutorId'] = tutorId;
    data['startTime'] = startTime;
    data['endTime'] = endTime;
    data['startTimestamp'] = startTimestamp;
    data['endTimestamp'] = endTimestamp;
    data['createdAt'] = createdAt;
    data['isBooked'] = isBooked;
    data['scheduleDetails'] = scheduleDetails.map((v) => v.toJson()).toList();
    data['tutorInfo'] = tutorInfo?.toJson();
    data['date'] = date;
    return data;
  }
}