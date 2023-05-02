import 'package:advanced_mobile/interceptors/interceptor.dart';
import 'package:dio/dio.dart';

class UpcomingService {
  static const String url = 'https://sandbox.api.lettutor.com';
  static final dio = DioInstance.dio;
  
  static Future<Response<dynamic>> getTotalLessonTime() async{
    final response = await dio.get('$url/call/total');
    return response;
  }
}