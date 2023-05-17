import 'package:advanced_mobile/interceptors/interceptor.dart';
import 'package:dio/dio.dart';

class UpcomingService {
  static const String url = 'https://sandbox.api.lettutor.com';
  static final dio = DioInstance.dio;
  
  static Future<Response<dynamic>> getTotalLessonTime() async{
    final response = await dio.get('$url/call/total');
    return response;
  }
  
  static Future<Response<dynamic>> getUpcomingClasses(int page, int perPage) async {
    final response = await dio.get('$url/booking/list/student',queryParameters: {
      "page": page,
      "perPage": perPage,
      "dateTimeGte": DateTime.now().subtract(const Duration(minutes: 30)).millisecondsSinceEpoch,
      "orderBy": "meeting",
      "sortBy": "asc"
    }, options: Options(
            followRedirects: false,
            validateStatus: (status) {
              return status! < 600;
            }
        ));
    return response;
  }


  static Future<Response<dynamic>> getHistory(int page, int perPage) async {
    final response = await dio.get('$url/booking/list/student',queryParameters: {
      "page": page,
      "perPage": perPage,
      "dateTimeLte": DateTime.now().millisecondsSinceEpoch,
      "orderBy": "meeting",
      "sortBy": "desc"
    }, options: Options(
        followRedirects: false,
        validateStatus: (status) {
          return status! < 600;
        }
    ));
    return response;
  }

  static Future<Response<dynamic>> cancelClass(int cancelReasonId, String note, String scheduleDetailId) async {
    final response = await dio.delete('$url/booking/schedule-detail',data: {
      "cancelInfo": {
        "cancelReasonId": cancelReasonId,
        "note": note
      },
      "scheduleDetailId": scheduleDetailId
    }, options: Options(
        followRedirects: false,
        validateStatus: (status) {
          return status! < 600;
        }
    ));
    return response;
  }
}