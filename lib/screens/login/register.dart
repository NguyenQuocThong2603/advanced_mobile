import 'package:advanced_mobile/config/color.dart';
import 'package:advanced_mobile/generated/l10n.dart';
import 'package:advanced_mobile/services/auth_service.dart';
import 'package:advanced_mobile/utils/validate_utils.dart';
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
  late TextEditingController confirmPasswordInputController;
  String? errorTextEmail;
  String? errorTextPassword;
  String? errorTextConfirmPassword;

  @override
  void initState(){
    super.initState();
    emailInputController = TextEditingController();
    passwordInputController = TextEditingController();
    confirmPasswordInputController = TextEditingController();
  }

  @override
  void dispose(){
    emailInputController.dispose();
    passwordInputController.dispose();
    confirmPasswordInputController.dispose();
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
    final errorText = validatePassword(context, value);
    setState(() {
      errorTextPassword = errorText;
    });
    return errorText == null ? true : false;
  }

  bool validateConfirmPasswordInput(value){
    if(confirmPasswordInputController.text == passwordInputController.text && confirmPasswordInputController.text != ''){
      setState(() {
        errorTextConfirmPassword = null;
      });
      return true;
    }
    setState(() {
      errorTextConfirmPassword = S.of(context).confirmPasswordNotMatch;
    });
    return false;
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
              text: TextSpan(
                  text: "${S.of(context).yourRegistration} ",
                  style: TextStyle(
                      fontSize: 16,
                      color: Theme.of(context).brightness == Brightness.light ?Colors.black : Colors.white
                  ),
                  children: [
                    TextSpan(
                        text: '${S.of(context).successfully}.',
                        style: const TextStyle(
                            color: Colors.green, fontSize: 16,fontWeight: FontWeight.w500))
                  ])),
          content: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children:  [
                RichText(
                  text: TextSpan(
                      text: "${S.of(context).receivedEmail} ",
                      style: TextStyle(
                          fontSize: 16,
                          color: Theme.of(context).brightness == Brightness.light ?Colors.black : Colors.white
                      ),
                      children: [
                        TextSpan(
                            text: email,
                            style: const TextStyle(fontSize: 16,fontWeight: FontWeight.w500))
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
                  child: Text(S.of(context).signup,
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
                margin: const EdgeInsets.only(top: 32),
                padding: const EdgeInsets.only(left: 16, right: 16),
                child: TextField(
                  controller: passwordInputController,
                  style: const TextStyle(fontSize: 15),
                  onChanged: validatePasswordInput,
                  obscureText: true,
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
                width: 350,
                margin: const EdgeInsets.only(top: 32, bottom: 16),
                padding: const EdgeInsets.only(left: 16, right: 16),
                child: TextField(
                  style: const TextStyle(fontSize: 15),
                  obscureText: true,
                  controller: confirmPasswordInputController,
                  onChanged: validateConfirmPasswordInput,
                  decoration: InputDecoration(
                      fillColor: Colors.white,
                      border: const OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.black12),
                          borderRadius: BorderRadius.all(Radius.circular(20))),
                      hintText: S.of(context).confirmPassword,
                      errorText: errorTextConfirmPassword
                  ),
                ),
              ),
              Container(
                  width: 350,
                  margin: const EdgeInsets.only(top: 12, bottom: 16),
                  padding: const EdgeInsets.only(left: 16, right: 16),
                  child: FilledButton.tonal(
                    onPressed: () async {
                      try{
                        final isValid = [validateEmailInput(emailInputController.text),
                          validatePasswordInput(passwordInputController.text),
                          validateConfirmPasswordInput(confirmPasswordInputController.text)
                        ].every((element) => element == true);
                        if(isValid){
                          await AuthService.register(emailInputController.text, passwordInputController.text);
                          _showMyDialog(emailInputController.text);
                        }
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
                    child: Text(
                      S.of(context).signup,
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
                        text: "${S.of(context).alreadyHaveAccount} ",
                        style: TextStyle(
                            color: Theme.of(context).brightness == Brightness.light ?
                            Colors.black : Colors.white,
                            fontSize: 16),
                        children: [
                          TextSpan(
                              text: S.of(context).login,
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
