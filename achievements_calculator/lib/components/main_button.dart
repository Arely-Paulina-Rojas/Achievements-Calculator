import 'package:flutter/material.dart';
import '../constants.dart';

class MainButton extends StatelessWidget {
  final String text;
  final void Function()? press;
  final Color lightColor;
  final Color darkColor;
  const MainButton(
      {Key? key,
      required this.text,
      required this.press,
      required this.lightColor,
      required this.darkColor})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
        margin: const EdgeInsets.symmetric(vertical: 10),
        height: 38,
        width: size.width * 0.7,
        decoration: BoxDecoration(
            gradient: LinearGradient(colors: [lightColor, darkColor])),
        child: TextButton(
          onPressed: press,
          child: Text(text, style: const TextStyle(color: lightTextColor)),
        ));
  }
}
