import 'dart:convert';

import 'package:advanced_mobile/config/preference.dart';
import 'package:advanced_mobile/interceptors/interceptor.dart';
import 'package:advanced_mobile/models/user/token_model.dart';
import 'package:dio/dio.dart';

class AuthService{
  static const String url = 'https://sandbox.api.lettutor.com';
  static final dio = DioInstance.dioWithoutToken;
  static final prefs = Preference.getInstance();
  static Future<void> register(String email, String password) async {
    final response = await dio.post('$url/auth/register',
      data: {
      'email': email,
      'password': password,
      "source": "null",
      },
      options: Options(
        followRedirects: false,
        validateStatus: (status) {
          return status! < 600;
        }
      ));
    print(response);
    if(response.data['statusCode'] != null){
      print(response.data['message']);
      throw Exception(response.data['message']);
    }
  }
  static Future<void> login(String email, String password)async {
    final response = await dio.post('$url/auth/login',
      data: {
        'email': email,
        'password': password
      },
        options: Options(
            followRedirects: false,
            validateStatus: (status) {
              return status! < 600;
            }
        )
    );
    if(response.data['statusCode'] == 200){
      var tokens = response.data['tokens'];
      String accessToken = tokens['access']['token'];
      String expires = tokens['access']['expires'];
      await prefs.setString(
          'accessToken',
          jsonEncode(Token(token: accessToken, expires: expires))
      );
    }
    else {
      throw Exception(response.data['message']);
    }
  }
}