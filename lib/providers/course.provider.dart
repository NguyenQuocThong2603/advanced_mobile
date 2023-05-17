import 'package:advanced_mobile/models/course/book_model.dart';
import 'package:advanced_mobile/models/course/course_model.dart';
import 'package:advanced_mobile/services/course_service.dart';
import 'package:advanced_mobile/utils/authentication_utils.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CourseProvider extends ChangeNotifier {
  List<Course> courses = [];
  List<Ebook> books = [];

  Course? courseInfo;
  int count = 0;
  int bookCount = 0;

  void removeState(){
    courseInfo = null;
    courses = [];
    count = 0;
    books = [];
    bookCount = 0;
  }

  void removeCourses(){
    courses = [];
    count = 0;
  }

  void removeBooks(){
    books = [];
    bookCount = 0;
  }

  Future<void> getListCourses(int page, int size,String name,List<String>levels,List<String>categories,context) async{
    final response = await CourseService.getListCourses(page,size,name,levels,categories);
    if(response.data['statusCode'] == 401){
      logout(context);
    }
    if (response.data['statusCode'] == 200) {
      final List<dynamic> data = response.data['data']['rows'];
      var result = data.map((course) => Course.fromJson(course)).toList();
      courses =  courses.followedBy(result).toList();
      count = response.data['data']['count'];
      notifyListeners();
    } else {
      throw Exception(response.data['message']);
    }
  }

  void removeCourseInfo(context){
    courseInfo = null;
    Navigator.pop(context);
  }

  Future<void> getCourseDetail(context, String courseId) async{
    final response = await CourseService.getCourseDetail(courseId);
    if(response.data['statusCode'] == 401){
      logout(context);
    }
    if (response.data['statusCode'] == 200) {
      courseInfo = Course.fromJson(response.data['data']);
      notifyListeners();
    } else {
      throw Exception(response.data['message']);
    }
  }

  Future<void> getListBooks(int page, int size,String name,List<String>levels,List<String>categories,context) async{
    final response = await CourseService.getListBooks(page,size,name,levels,categories);
    if(response.data['statusCode'] == 401){
      logout(context);
    }
    if (response.data['statusCode'] == 200) {
      final List<dynamic> data = response.data['data']['rows'];
      var result = data.map((book) => Ebook.fromJson(book)).toList();
      books =  books.followedBy(result).toList();
      bookCount = response.data['data']['count'];
      notifyListeners();
    } else {
      throw Exception(response.data['message']);
    }
  }
}