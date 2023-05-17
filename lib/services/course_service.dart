import 'package:advanced_mobile/interceptors/interceptor.dart';
import 'package:dio/dio.dart';

class CourseService {
  static const String url = 'https://sandbox.api.lettutor.com';
  static final dio = DioInstance.dio;

  static Future<Response<dynamic>> getListCourses(int page, int size, String name,
      List<String> levels,List<String>categories) async{
    String query = '';
    if(levels.isNotEmpty){
      for(int i = 0; i<levels.length;i++){
        query += '&level[]=${levels[i]}';
      }
    }
    if(categories.isNotEmpty){
      for(int i = 0; i<categories.length;i++){
        query += '&categoryId[]=${categories[i]}';
      }
    }
    final response = await dio.get('$url/course?$query',queryParameters: {
      "page": page,
      "size": size,
      "q": name
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

  static Future<Response<dynamic>> getListBooks(int page, int size, String name,
      List<String> levels,List<String>categories) async{
    String query = '';
    if(levels.isNotEmpty){
      for(int i = 0; i<levels.length;i++){
        query += '&level[]=${levels[i]}';
      }
    }
    if(categories.isNotEmpty){
      for(int i = 0; i<categories.length;i++){
        query += '&categoryId[]=${categories[i]}';
      }
    }
    final response = await dio.get('$url/e-book?$query',queryParameters: {
      "page": page,
      "size": size,
      "q": name
    }, options: Options(
        followRedirects: false,
        validateStatus: (status) {
          return status! < 600;
        }
    ));
    return response;
  }
}