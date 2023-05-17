import 'package:achievements_calculator/components/gradient_text.dart';
import 'package:achievements_calculator/components/main_button.dart';
import 'package:flutter/material.dart';
import '../constants.dart';

class ImageButton extends StatelessWidget {
  final String labelText;
  final String buttonText;
  final void Function()? press;
  const ImageButton({
    Key? key,
    required this.labelText,
    required this.buttonText,
    required this.press,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Center(
        child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        GradientText(key, labelText,
            style: const TextStyle(fontWeight: FontWeight.bold),
            gradient: const LinearGradient(
                colors: [lightDarkTextColor, lightDarkTextColor])),
        MainButton(
            text: buttonText,
            press: press,
            lightColor: textFieldColor,
            darkColor: textFieldColor)
      ],
    ));
  }
}
