import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  signIn() {}
  signUp() {}
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
            child: const TextField(
              style: TextStyle(fontSize: 15, color: Colors.black),
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecoration(
                  fillColor: Colors.white,
                  filled: true,
                  border: OutlineInputBorder(
                      borderSide: BorderSide(
                        style: BorderStyle.solid,
                        color: Color(0xffd9d9d9),
                      ),
                      borderRadius: BorderRadius.all(Radius.circular(20))),
                  hintText: "Email"),
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
                  hintText: "Password"),
            ),
          ),
          Container(
            margin: const EdgeInsets.only(right: 40, top: 20),
            padding: const EdgeInsets.only(left: 16, right: 16),
            child: Align(
                alignment: Alignment.bottomRight,
                child: GestureDetector(
                  child: const Text('Forgot Password?',
                      style: TextStyle(
                        fontSize: 16,
                        color: Color.fromRGBO(40, 106, 210, 1),
                      )),
                )),
          ),
          Container(
              width: 350,
              margin: const EdgeInsets.only(top: 12, bottom: 16),
              padding: const EdgeInsets.only(left: 16, right: 16),
              child: TextButton(
                onPressed: signIn(),
                style: TextButton.styleFrom(
                  backgroundColor: const Color.fromRGBO(0, 113, 240, 1),
                  padding: const EdgeInsets.all(12),
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                  ),
                ),
                child: const Text(
                  'Log in',
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
                    text: "Don't have an account? ",
                    style: const TextStyle(color: Colors.black, fontSize: 16),
                    children: [
                  TextSpan(
                      text: 'Sign up',
                      recognizer: TapGestureRecognizer().onTap = signUp(),
                      style: const TextStyle(
                          color: Color.fromRGBO(40, 106, 210, 1), fontSize: 16,fontWeight: FontWeight.w500))
                ])),
          )
        ],
      ),
    ));
  }
}
