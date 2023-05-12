import 'package:achievements_calculator/screens/login/components/body.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: BackgroundImage(
          nameBackgroundImage: 'assets/images/login_background.png'),
    );
  }
}
