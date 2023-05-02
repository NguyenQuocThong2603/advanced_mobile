import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

showErrorToast(error){
  Fluttertoast.showToast(
      msg: error.toString().split(':')[1],
      toastLength: Toast.LENGTH_LONG,
      gravity: ToastGravity.TOP,
      timeInSecForIosWeb: 1,
      backgroundColor: Colors.red,
      textColor: Colors.white,
      fontSize: 16.0
  );
}