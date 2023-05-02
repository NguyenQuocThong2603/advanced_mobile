
import 'package:advanced_mobile/interceptors/interceptor.dart';
import 'package:dio/dio.dart';

class UserService {
  static const String url = 'https://sandbox.api.lettutor.com';
  static final dioWithoutToken = DioInstance.dioWithoutToken;
  static final dio = DioInstance.dio;


  static Future<void> forgotPassword(String email)async {
    final response = await dioWithoutToken.post('$url/user/forgotPassword',
        data: {
          'email': email,
        },
        options: Options(
            followRedirects: false,
            validateStatus: (status) {
              return status! < 600;
            }
        )
    );
    if(response.data['statusCode'] == 400 || response.data['statusCode'] == 500
        || response.data['statusCode'] == 404 ){
      throw Exception(response.data['message']);
    }
  }

  static Future<Response<dynamic>> getUserInfo() async {
    final response = await dio.get('$url/user/info');
    return response;
  }
}