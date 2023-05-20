import 'package:advanced_mobile/config/color.dart';
import 'package:advanced_mobile/screens/content.dart';
import 'package:advanced_mobile/screens/login/forgot_password.dart';
import 'package:advanced_mobile/screens/login/register.dart';
import 'package:advanced_mobile/services/auth_service.dart';
import 'package:advanced_mobile/utils/validate_utils.dart';
import 'package:advanced_mobile/widgets/toast.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:advanced_mobile/generated/l10n.dart';
import 'package:google_sign_in/google_sign_in.dart';
class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  late TextEditingController emailInputController;
  late TextEditingController passwordInputController;
  String? errorTextEmail;
  String? errorTextPassword;
  GoogleSignIn googleSignIn = GoogleSignIn();

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
  bool validateEmailInput(value){
    final errorText = validateEmail(context, value);
    setState(() {
      errorTextEmail = errorText;
    });
    return errorText == null ? true : false;
  }

  bool validatePasswordInput(value){
    final errorText = validateEmptyString(context, value,S.of(context).passwordNotEmpty);
    setState(() {
      errorTextPassword = errorText;
    });
    return errorText == null ? true : false;
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
              style: const TextStyle(fontSize: 15),
              keyboardType: TextInputType.emailAddress,
              onChanged: validateEmailInput,
              decoration: InputDecoration(
                  fillColor: Colors.white,
                  border: const OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.black12),
                      borderRadius: BorderRadius.all(Radius.circular(20))),
                  hintText: S.of(context).email,
                  errorText: errorTextEmail
              ),
            ),
          ),
          Container(
            width: 350,
            margin: const EdgeInsets.only(top: 32, bottom: 16),
            padding: const EdgeInsets.only(left: 16, right: 16),
            child: TextField(
              controller: passwordInputController,
              style: const TextStyle(fontSize: 15),
              obscureText: true,
              onChanged: validatePasswordInput,
              decoration: InputDecoration(
                  fillColor: Colors.white,
                  border: const OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.black12),
                      borderRadius: BorderRadius.all(Radius.circular(20))),
                  hintText: S.of(context).password,
                  errorText: errorTextPassword
              ),
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
                    bool isValidEmail = validateEmailInput(emailInputController.text);
                    bool isValidPassword = validatePasswordInput(passwordInputController.text);
                    if(isValidEmail && isValidPassword) {
                      await AuthService.login(emailInputController.text, passwordInputController.text);
                      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=> const ContentScreen()));
                      showSuccessToast('Login successfully');
                    }
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
                onTap: () async {
                  try{
                    final googleAccount = await googleSignIn.signIn();
                    if(googleAccount != null){
                      final googleSignInAuthentication = await googleAccount.authentication;
                      await AuthService.googleLogin(googleSignInAuthentication.accessToken!);
                      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=> const ContentScreen()));
                      showSuccessToast('Login successfully');
                    }
                  } catch(err){
                    googleSignIn.signOut();
                  }
                },
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
                    style: TextStyle(
                        color: Theme.of(context).brightness == Brightness.light ?
                        Colors.black : Colors.white,
                        fontSize: 16),
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
