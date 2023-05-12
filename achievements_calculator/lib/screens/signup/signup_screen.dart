import 'package:achievements_calculator/screens/signup/components/signup_body.dart';
import 'package:flutter/material.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SignUpBody(
          nameBackgroundImage: 'assets/images/signup_background.png'),
    );
  }
}
