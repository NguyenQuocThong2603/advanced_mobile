import 'package:advanced_mobile/config/color.dart';
import 'package:advanced_mobile/services/auth_service.dart';
import 'package:dio/dio.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  late TextEditingController emailInputController;
  late TextEditingController passwordInputController;

  @override
  void initState(){
    super.initState();
    emailInputController = TextEditingController();
    passwordInputController = TextEditingController();
  }

  @override
  void dispose(){
    emailInputController.dispose();
    passwordInputController.dispose();
    super.dispose();
  }

  Future<void> _showMyDialog(String email) async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          icon: const Image(
            image: AssetImage("asset/img/check.png"),
            width: 100,
            height: 100,
          ),
          alignment: Alignment.center,
          title: RichText(
              text: const TextSpan(
                  text: "Your registration ",
                  style: TextStyle(color: Colors.black, fontSize: 16),
                  children: [
                    TextSpan(
                        text: 'sucessfully.',
                        style: TextStyle(
                            color: Colors.green, fontSize: 16,fontWeight: FontWeight.w500))
                  ])),
          content: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children:  [
                RichText(
                  text: TextSpan(
                      text: "You will receive an activate account email to ",
                      style: const TextStyle(color: Colors.black, fontSize: 16),
                      children: [
                        TextSpan(
                            text: email,
                            style: const TextStyle(
                              color: Colors.black, fontSize: 16,fontWeight: FontWeight.w500))
                ])),
              ],
            ),
          ),
          actionsAlignment: MainAxisAlignment.center,
          actions: <Widget>[
            Container(
                width: 350,
                margin: const EdgeInsets.only(top: 12, bottom: 16),
                padding: const EdgeInsets.only(left: 16, right: 16),
                child: FilledButton.tonal(
                  onPressed: () {
                    Navigator.pop(context);
                    Navigator.pop(context);
                  },
                  style: TextButton.styleFrom(
                    backgroundColor: AppColors.primary,
                    padding: const EdgeInsets.all(12),
                    shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                    ),
                  ),
                  child: const Text(
                    'Ok',
                    style: TextStyle(fontSize: 20, color: Colors.white),
                  ),
                )),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        body: SizedBox(
          width: double.infinity,
          height: double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                  margin: const EdgeInsets.only(bottom: 32),
                  child: Text('Sign up',
                    style: TextStyle(
                      color: AppColors.primary,
                      fontSize: 48,
                      fontWeight: FontWeight.w500
                    ),
                  ),
              ),
              Container(
                width: 350,
                padding: const EdgeInsets.only(left: 16, right: 16),
                child: TextField(
                  controller: emailInputController,
                  style: TextStyle(fontSize: 15, color: Colors.grey.shade900),
                  keyboardType: TextInputType.emailAddress,
                  decoration: const InputDecoration(
                      fillColor: Colors.white,
                      border: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.black12),
                          borderRadius: BorderRadius.all(Radius.circular(20))),
                      hintText: "Email"),
                ),
              ),
              Container(
                width: 350,
                margin: const EdgeInsets.only(top: 32),
                padding: const EdgeInsets.only(left: 16, right: 16),
                child: TextField(
                  controller: passwordInputController,
                  style: TextStyle(fontSize: 15, color: Colors.grey.shade900),
                  obscureText: true,
                  decoration: const InputDecoration(
                      fillColor: Colors.white,
                      border: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.black12),
                          borderRadius: BorderRadius.all(Radius.circular(20))),
                      hintText: "Password"),
                ),
              ),
              Container(
                width: 350,
                margin: const EdgeInsets.only(top: 32, bottom: 16),
                padding: const EdgeInsets.only(left: 16, right: 16),
                child: TextField(
                  style: TextStyle(fontSize: 15, color: Colors.grey.shade900),
                  obscureText: true,
                  decoration: const InputDecoration(
                      fillColor: Colors.white,
                      border: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.black12),
                          borderRadius: BorderRadius.all(Radius.circular(20))),
                      hintText: "Confirm Password"),
                ),
              ),
              Container(
                  width: 350,
                  margin: const EdgeInsets.only(top: 12, bottom: 16),
                  padding: const EdgeInsets.only(left: 16, right: 16),
                  child: FilledButton.tonal(
                    onPressed: () async {
                      try{
                        await AuthService.register(emailInputController.text, passwordInputController.text);
                        _showMyDialog(emailInputController.text);
                      } catch(error){
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
                    },
                    style: TextButton.styleFrom(
                      backgroundColor: AppColors.primary,
                      padding: const EdgeInsets.all(12),
                      shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(20)),
                      ),
                    ),
                    child: const Text(
                      'Register',
                      style: TextStyle(fontSize: 20, color: Colors.white),
                    ),
                  )),
              Container(
                margin: const EdgeInsets.only(bottom: 16),
                child: Text('Or continue with',
                    style: TextStyle(color: Colors.grey.shade600, fontSize: 15)),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  GestureDetector(
                      child: Container(
                          decoration: BoxDecoration(
                              border: Border.all(color: const Color(0xff1890ff)),
                              borderRadius:
                              const BorderRadius.all(Radius.circular(50))),
                          margin: const EdgeInsets.only(right: 20),
                          child: const Image(
                            image: AssetImage("asset/img/icons8-google-48.png"),
                          ))),
                  GestureDetector(
                      child: Container(
                          decoration: BoxDecoration(
                              border: Border.all(color: const Color(0xff1890ff)),
                              borderRadius:
                              const BorderRadius.all(Radius.circular(50))),
                          child: const Image(
                            image: AssetImage("asset/img/icons8-facebook-48.png"),
                          ))),
                ],
              ),
              Container(
                margin: const EdgeInsets.only(top: 16),
                child: RichText(
                    text: TextSpan(
                        text: "Already have an account? ",
                        style: const TextStyle(color: Colors.black, fontSize: 16),
                        children: [
                          TextSpan(
                              text: 'Login',
                              recognizer: TapGestureRecognizer()..onTap = () {
                                Navigator.pop(context);
                              },
                              style: TextStyle(
                                  color: AppColors.primary, fontSize: 16,fontWeight: FontWeight.w500))
                        ])),
              )
            ],
          ),
        ));
  }
}
