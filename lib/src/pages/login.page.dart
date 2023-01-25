//write a login page in flutter

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_signin_button/flutter_signin_button.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login '),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('Login Page'),
            const SizedBox(height: 20),
            SignInButton(Buttons.Google, onPressed: () {}),
            const SizedBox(height: 20),
            SignInButton(
              Buttons.Facebook,
              onPressed: () {},
            ),
            const SizedBox(height: 20),
            SignInButton(
              Buttons.Twitter,
              onPressed: () {},
            ),
            const SizedBox(height: 20),
            SignInButton(
              Buttons.Apple,
              onPressed: () {},
            ),
          ],
        ),
      ),
    );
  }
}
