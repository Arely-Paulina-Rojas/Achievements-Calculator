import 'dart:ui';

import 'package:achievements_calculator/constants.dart';
import 'package:flutter/material.dart';
import 'package:rive/rive.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BackgroundImage(nameBackgroundImage: 'images/background.png'),
    );
  }
}

class BackgroundImage extends StatelessWidget {
  final String nameBackgroundImage;
  const BackgroundImage({Key? key, required this.nameBackgroundImage})
      : super(key: key);

  @override
  Widget build(BuildContext) {
    return Scaffold(
        body: Container(
      decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage(nameBackgroundImage), fit: BoxFit.cover)),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 5.0, sigmaY: 5.0),
        child: Center(
          child: containerForm(),
        ),
      ),
    ));
  }
}

class containerForm extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        color: formBackgroundColor,
        height: 370,
        width: 277,
        child: Center(
          child: Text("Test", selectionColor: lightTextColor),
        ),
      ),
    );
  }
}
