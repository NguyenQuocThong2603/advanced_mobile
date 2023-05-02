import 'package:advanced_mobile/interceptors/interceptor.dart';
import 'package:dio/dio.dart';

class TutorService {
  static const String url = 'https://sandbox.api.lettutor.com';
  static final dio = DioInstance.dio;

  static Future<Response<dynamic>> getListTutors(String speciality) async{
    final response = await dio.post('$url/tutor/search',data: {
      "filters": {
        "specialties": [speciality],
        "date": null,
      }
    });
    return response;
  }
  static Future<Response<dynamic>> searchTutorByName(String name, String speciality,Object nationality) async {
    final response = await dio.post('$url/tutor/search', data: {
      "filters": {
        "specialties": [speciality],
        "date": null,
        "nationality":nationality
      },
      "search": name
    });
    return response;
  }

  static Future<Response<dynamic>> getTutorInformation(String tutorId) async {
    final response = await dio.get('$url/tutor/$tutorId');
    return response;
  }

  static Future<Response<dynamic>> manageFavoriteTutor(String tutorId) async {
    final response = await dio.post('$url/user/manageFavoriteTutor',data: {
      "tutorId": tutorId
    });
    return response;
  }

  static Future<Response<dynamic>> getScheduleOfTutor(String tutorId, int startTimestamp, int endTimestamp) async {
    final response = await dio.get('$url/schedule',queryParameters: {
      "tutorId": tutorId,
      "startTimestamp": startTimestamp,
      "endTimestamp": endTimestamp
    });
    return response;
  }

  static Future<Response<dynamic>> getFeedbacks(String tutorId) async {
    final response = await dio.get('$url/feedback/v2/$tutorId');
    return response;
  }

  static Future<Response<dynamic>> bookClass(String scheduleDetailIds, String note) async {
    final response = await dio.post('$url/booking',data: {
      "scheduleDetailIds": [scheduleDetailIds],
      "note": note
    });
    return response;
  }

  static Future<Response<dynamic>> reportTutor(String tutorId, String content) async {
    final response = await dio.post('$url/report',data: {
      "tutorId": tutorId,
      "content": content
    });
    return response;
  }
}