import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  signIn() {}
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
                  child: const Text('Forgot Password?'),
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
          Text('Or continue with', style: TextStyle(color: Colors.grey.shade600,)),
          Row(children: [
            GestureDetector(child: const Icon(
              icon: IconData(codePoint)
            ),)
          ],)
        ],
      ),
    ));
  }
}
