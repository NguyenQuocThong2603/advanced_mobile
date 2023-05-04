import 'package:advanced_mobile/interceptors/interceptor.dart';
import 'package:dio/dio.dart';

class UpcomingService {
  static const String url = 'https://sandbox.api.lettutor.com';
  static final dio = DioInstance.dio;
  
  static Future<Response<dynamic>> getTotalLessonTime() async{
    final response = await dio.get('$url/call/total');
    return response;
  }
  
  static Future<Response<dynamic>> getUpcomingClasses() async {
    final response = await dio.get('$url/booking/list/student',queryParameters: {
      "page": 1,
      "perPage": 20,
      "dateTimeGte": DateTime.now().subtract(const Duration(minutes: 30)).millisecondsSinceEpoch,
      "orderBy": "meeting",
      "sortBy": "asc"
    });
    return response;
  }


  static Future<Response<dynamic>> getHistory() async {
    final response = await dio.get('$url/booking/list/student',queryParameters: {
      "page": 1,
      "perPage": 20,
      "dateTimeLte": DateTime.now().millisecondsSinceEpoch,
      "orderBy": "meeting",
      "sortBy": "desc"
    });
    return response;
  }
}