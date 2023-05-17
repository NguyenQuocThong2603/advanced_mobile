import 'package:advanced_mobile/config/color.dart';
import 'package:advanced_mobile/screens/content.dart';
import 'package:advanced_mobile/screens/login/forgot_password.dart';
import 'package:advanced_mobile/screens/login/register.dart';
import 'package:advanced_mobile/services/auth_service.dart';
import 'package:advanced_mobile/widgets/toast.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:advanced_mobile/generated/l10n.dart';
class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
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
          Container(
            width: 350,
            padding: const EdgeInsets.only(left: 16, right: 16),
            child: TextField(
              controller: emailInputController,
              style: TextStyle(fontSize: 15),
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecoration(
                  fillColor: Colors.white,
                  border: const OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.black12),
                      borderRadius: BorderRadius.all(Radius.circular(20))),
                  hintText: S.of(context).email),
            ),
          ),
          Container(
            width: 350,
            margin: const EdgeInsets.only(top: 32, bottom: 16),
            padding: const EdgeInsets.only(left: 16, right: 16),
            child: TextField(
              controller: passwordInputController,
              style: TextStyle(fontSize: 15),
              obscureText: true,
              decoration: InputDecoration(
                  fillColor: Colors.white,
                  border: const OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.black12),
                      borderRadius: BorderRadius.all(Radius.circular(20))),
                  hintText: S.of(context).password),
            ),
          ),
          Container(
            margin: const EdgeInsets.only(right: 40, top: 20),
            padding: const EdgeInsets.only(left: 16, right: 16),
            child: Align(
                alignment: Alignment.bottomRight,
                child: GestureDetector(
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context)=> const ForgotPasswordScreen()));
                  },
                  child: Text(S.of(context).forgotPassword,
                      style: TextStyle(
                        fontSize: 16,
                        color: AppColors.primary,
                      )),
                )),
          ),
          Container(
              width: 350,
              margin: const EdgeInsets.only(top: 12, bottom: 16),
              padding: const EdgeInsets.only(left: 16, right: 16),
              child: FilledButton.tonal(
                onPressed: () async {
                  try{
                    await AuthService.login(emailInputController.text, passwordInputController.text);
                    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=> const ContentScreen()));
                  } catch(error){
                    showErrorToast(error);
                  }
                },
                style: TextButton.styleFrom(
                  backgroundColor: AppColors.primary,
                  padding: const EdgeInsets.all(12),
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                  ),
                ),
                child:  Text(
                  S.of(context).login,
                  style: const TextStyle(fontSize: 20, color: Colors.white),
                ),
              )),
          Container(
            margin: const EdgeInsets.only(bottom: 16),
            child: Text(S.of(context).orContinueWith,
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
                    text: "${S.of(context).dontHaveAccount} ",
                    style: const TextStyle(color: Colors.black, fontSize: 16),
                    children: [
                  TextSpan(
                      text: S.of(context).signup,
                      recognizer: TapGestureRecognizer()..onTap = () {
                        Navigator.push(context, MaterialPageRoute(builder: (context)=> const RegisterScreen()));
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
