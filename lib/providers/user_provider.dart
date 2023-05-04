import 'package:advanced_mobile/models/user/user_model.dart';
import 'package:advanced_mobile/services/user_service.dart';
import 'package:advanced_mobile/utils/authentication_utils.dart';
import 'package:flutter/material.dart';

class UserProvider extends ChangeNotifier{

  late User userInfo;
  Future<void> getUserInfo(context) async{
    final response = await UserService.getUserInfo();
    if(response.data['statusCode'] == 401){
      logout(context);
    }
    if (response.data['statusCode'] == 200) {
      userInfo = User.fromJson(response.data['user']);
      notifyListeners();
    } else {
      throw Exception(response.data['message']);
    }
  }
}