
import 'package:dio/dio.dart';

class UserService {
  static const String url = 'https://sandbox.api.lettutor.com';
  static final dio = Dio();

  static Future<void> forgotPassword(String email)async {
    final response = await dio.post('$url/user/forgotPassword',
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
    print(response.data);
    if(response.data['statusCode'] == 400 || response.data['statusCode'] == 500
        || response.data['statusCode'] == 404 ){
      throw Exception(response.data['message']);
    }
  }
}