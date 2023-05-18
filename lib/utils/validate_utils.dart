import 'package:advanced_mobile/generated/l10n.dart';
import 'package:flutter/material.dart';
bool isEmptyString(String s){
  if(s.isEmpty){
    return true;
  }
  return false;
}

String? validateEmail(BuildContext context, String email){
  if(isEmptyString(email)) return S.of(context).emailNotEmpty;
  final bool emailValid = RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
      .hasMatch(email);
  if(!emailValid) return S.of(context).notValidEmail;
  return null;
}

String? validateEmptyString(BuildContext context, String s, String message){
  if(isEmptyString(s)) return message;
  return null;
}

String? validatePassword(BuildContext context, String s){
  if(isEmptyString(s)) return S.of(context).passwordNotEmpty;
  if(s.length < 6) return S.of(context).passwordNotEnoughLength;
  return null;
}

