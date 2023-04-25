import 'dart:convert';

import 'package:advanced_mobile/models/user/token_model.dart';
import 'package:dio/dio.dart';
import 'package:advanced_mobile/config/preference.dart';


class DioInstance {
  static final dioWithoutToken = Dio();
  static final dio = Dio();
  final pref = Preference.getInstance();

  DioInstance(){
    dio.interceptors.add(InterceptorsWrapper(
      onRequest: onRequest,
      onResponse: onResponse
    ));
    dioWithoutToken.interceptors.add(InterceptorsWrapper(
        onResponse: onResponse
    ));
  }


  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
      var accessToken = pref.getString('accessToken');
      if(accessToken !=null ){
        var token = Token.fromJson(jsonDecode(accessToken)).token;
        options.headers['Authorization'] = 'Bearer $token';
      }
      handler.next(options);
  }
  void onResponse(Response<dynamic> response, ResponseInterceptorHandler handler){
    if(response.statusCode == 200){
      response.data['statusCode'] = 200;
    }
    handler.next(response);
  }
}