import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';
import 'package:advanced_mobile/config/color.dart';



class ForgotPasswordScreen extends StatelessWidget {
  const ForgotPasswordScreen({Key? key}) : super(key: key);

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
                  child: const Image(
                    image: AssetImage("asset/img/logo.png"),
                    width: 250,
                  )),
              const Text('Reset password', style: TextStyle(fontSize: 24, fontWeight: FontWeight.w500),),
              Column(
                children: [
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 30),
                    margin: const EdgeInsets.only(top: 8),
                      child: Text('Please enter your email address to search for your',
                        style: TextStyle(color: AppColors.textGrey),)
                  ),
                  Container(
                      padding: const EdgeInsets.symmetric(horizontal: 30),
                      child: Text('account.',
                        style: TextStyle(color: AppColors.textGrey),)
                  ),
                ],
              ),
              Container(
                width: 350,
                margin: const EdgeInsets.only(top: 8),
                padding: const EdgeInsets.only(left: 16, right: 16),
                child: TextField(
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
                  margin: const EdgeInsets.only(top: 32, bottom: 16),
                  padding: const EdgeInsets.only(left: 16, right: 16),
                  child: TextButton(
                    onPressed: () {},
                    style: TextButton.styleFrom(
                      backgroundColor: AppColors.primary,
                      padding: const EdgeInsets.all(12),
                      shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(8)),
                      ),
                    ),
                    child: const Text(
                      'Send reset link',
                      style: TextStyle(fontSize: 20, color: Colors.white),
                    ),
                )
              ),
              Container(
                margin: const EdgeInsets.only(top: 16),
                child: RichText(
                    text: TextSpan(
                        text: 'Go back to Sign in',
                        recognizer: TapGestureRecognizer()..onTap = () {},
                        style: TextStyle(
                            color: AppColors.primary, fontSize: 16,fontWeight: FontWeight.w500))
                )
              )
            ],
          ),
        ));
  }
}
