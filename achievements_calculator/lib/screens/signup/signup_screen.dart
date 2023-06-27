import 'package:achievements_calculator/constants.dart';
import 'package:achievements_calculator/screens/signup/components/signup_body.dart';
import 'package:flutter/material.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: backgroundColor,
      body: SignUpBody(
          nameBackgroundImage: 'assets/images/signup_background.png'),
    );
  }
}
