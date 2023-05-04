import 'package:advanced_mobile/models/course/course_model.dart';
import 'package:advanced_mobile/services/course_service.dart';
import 'package:advanced_mobile/utils/authentication_utils.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CourseProvider extends ChangeNotifier {
  List<Course> courses = [];

  Course? courseInfo;

  Future<void> getListCourses(context) async{
    final response = await CourseService.getListCourses();
    if(response.data['statusCode'] == 401){
      logout(context);
    }
    if (response.data['statusCode'] == 200) {
      final List<dynamic> data = response.data['data']['rows'];
      var result = data.map((tutor) => Course.fromJson(tutor)).toList();
      courses =  result;
      notifyListeners();
    } else {
      throw Exception(response.data['message']);
    }
  }

  Future<void> getCourseDetail(context, String courseId) async{
    final response = await CourseService.getCourseDetail(courseId);
    if(response.data['statusCode'] == 401){
      logout(context);
    }
    if (response.data['statusCode'] == 200) {
      print(response.data);
      courseInfo = Course.fromJson(response.data['data']);
      notifyListeners();
    } else {
      throw Exception(response.data['message']);
    }
  }
}