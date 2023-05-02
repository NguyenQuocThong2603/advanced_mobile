import 'package:advanced_mobile/models/course/course_model.dart';
import 'package:advanced_mobile/services/course_service.dart';
import 'package:flutter/cupertino.dart';

class CourseProvider extends ChangeNotifier {
  List<Course> courses = [];

  Future<void> getListCourses(BuildContext context) async{
    final response = await CourseService.getListCourses();
    if(response.data['statusCode'] == 401){
      Navigator.pop(context);
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
}