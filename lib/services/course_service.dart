import 'package:advanced_mobile/interceptors/interceptor.dart';
import 'package:dio/dio.dart';

class CourseService {
  static const String url = 'https://sandbox.api.lettutor.com';
  static final dio = DioInstance.dio;

  static Future<Response<dynamic>> getListCourses() async{
    final response = await dio.get('$url/course',queryParameters: {
      "page": 1,
      "size": 100
    }, options: Options(
            followRedirects: false,
            validateStatus: (status) {
              return status! < 600;
            }
        ));
    return response;
  }

  static Future<Response<dynamic>> getCourseDetail(String courseId) async{
    final response = await dio.get('$url/course/$courseId', options: Options(
            followRedirects: false,
            validateStatus: (status) {
              return status! < 600;
            }
        ));
    return response;
  }
}