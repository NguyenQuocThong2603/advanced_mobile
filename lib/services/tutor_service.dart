import 'package:advanced_mobile/interceptors/interceptor.dart';
import 'package:advanced_mobile/models/tutor/tutor_model.dart';
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
}