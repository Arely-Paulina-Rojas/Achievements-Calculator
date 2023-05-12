import 'dart:ui';
import 'package:achievements_calculator/screens/signup/components/container_form.dart';
import 'package:flutter/material.dart';
import '../../../constants.dart';

class SignUpBody extends StatelessWidget {
  final String nameBackgroundImage;
  const SignUpBody({Key? key, required this.nameBackgroundImage})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
        body: Container(
      decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage(nameBackgroundImage), fit: BoxFit.cover)),
      child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 5.0, sigmaY: 5.0),
          child: Column(
            children: <Widget>[
              SizedBox(height: size.height * 0.14),
              const Text("Achievements Calculator",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: lightTextColor,
                      fontSize: 22)),
              SizedBox(height: size.width * 0.02),
              Image.asset('assets/icons/agregar-usuario.png',
                  height: size.height * 0.12),
              SizedBox(height: size.width * 0.05),
              SizedBox(
                width: size.width * 0.8,
                child: const Text(
                  "SIGN UP",
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: lightTextColor,
                  ),
                ),
              ),
              const ContainerForm()
            ],
          )),
    ));
  }
}
