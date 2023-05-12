import 'package:achievements_calculator/screens/login/components/login_body.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body:
          LoginBody(nameBackgroundImage: 'assets/images/login_background.png'),
    );
  }
}
