import 'package:achievements_calculator/components/gradient_text.dart';
import 'package:flutter/material.dart';
import '../constants.dart';

class AlreadyHaveAnAccountCheck extends StatelessWidget {
  final bool login;
  final void Function()? press;
  const AlreadyHaveAnAccountCheck({Key? key, this.login = true, this.press})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Text(
          login ? "Don’t have an account? " : "Already have an account? ",
          style: const TextStyle(color: lightTextColor),
        ),
        GestureDetector(
          onTap: press,
          child: GradientText(
            key,
            login ? "Sign Up" : "Sign In",
            style: const TextStyle(fontWeight: FontWeight.bold),
            gradient: const LinearGradient(
                colors: [lightMainButtonColor, darkMainButtonColor]),
          ),
        ),
      ],
    );
  }
}
