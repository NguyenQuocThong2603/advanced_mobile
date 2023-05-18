import 'package:advanced_mobile/generated/l10n.dart';
import 'package:advanced_mobile/services/user_service.dart';
import 'package:advanced_mobile/utils/validate_utils.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';
import 'package:advanced_mobile/config/color.dart';
import 'package:fluttertoast/fluttertoast.dart';



class ForgotPasswordScreen extends StatefulWidget {
  const ForgotPasswordScreen({Key? key}) : super(key: key);

  @override
  State<ForgotPasswordScreen> createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
  late TextEditingController emailInputController;
  String? errorEmailText;

  @override
  void initState(){
    super.initState();
    emailInputController = TextEditingController();
  }

  @override
  void dispose(){
    emailInputController.dispose();
    super.dispose();
  }

  bool validateEmailInput(value){
    final errorText = validateEmail(context, value);
    setState(() {
      errorEmailText = errorText;
    });
    return errorText == null ? true : false;
  }

  Future<void> _showMyDialog() async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          alignment: Alignment.center,
          title:  Text(S.of(context).checkYourMail,
            style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
          ),
          content: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children:  [
                Text(S.of(context).sendEmail,
              style: const TextStyle(fontSize: 16),
            )
            ]),
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
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                  margin: const EdgeInsets.only(bottom: 32),
                  child: const Image(
                    image: AssetImage("asset/img/logo.png"),
                    width: 250,
                  )),
              Text(S.of(context).resetPassword, style: const TextStyle(fontSize: 24, fontWeight: FontWeight.w500),),
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 30),
                    margin: const EdgeInsets.only(top: 8),
                      child: Text(S.of(context).enterResetEmail,
                        style: TextStyle(color: AppColors.textGrey),)
                  ),
                ],
              ),
              Container(
                width: 350,
                margin: const EdgeInsets.only(top: 8),
                padding: const EdgeInsets.only(left: 16, right: 16),
                child: TextField(
                  controller: emailInputController,
                  style: TextStyle(fontSize: 15),
                  keyboardType: TextInputType.emailAddress,
                  onChanged: validateEmailInput,
                  decoration: InputDecoration(
                      fillColor: Colors.white,
                      border: const OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.black12),
                          borderRadius: BorderRadius.all(Radius.circular(20))),
                      hintText: "Email",
                      errorText: errorEmailText
                  ),
                ),
              ),
              Container(
                  width: 350,
                  margin: const EdgeInsets.only(top: 32, bottom: 16),
                  padding: const EdgeInsets.only(left: 16, right: 16),
                  child: TextButton(
                    onPressed: () async {
                      try{
                        if(validateEmailInput(emailInputController.text)){
                          await UserService.forgotPassword(emailInputController.text);
                          _showMyDialog();
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
                        borderRadius: BorderRadius.all(Radius.circular(8)),
                      ),
                    ),
                    child: Text(
                      S.of(context).sendResetLink,
                      style: const TextStyle(fontSize: 20, color: Colors.white),
                    ),
                )
              ),
              Container(
                margin: const EdgeInsets.only(top: 16),
                child: RichText(
                    text: TextSpan(
                        text: S.of(context).goBackSignIn,
                        recognizer: TapGestureRecognizer()..onTap = () {
                          Navigator.pop(context);
                        },
                        style: TextStyle(
                            color: AppColors.primary, fontSize: 16,fontWeight: FontWeight.w500))
                )
              )
            ],
          ),
        ));
  }
}
