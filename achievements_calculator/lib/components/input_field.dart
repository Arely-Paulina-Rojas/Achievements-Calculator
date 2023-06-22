import 'package:achievements_calculator/components/gradient_text.dart';
import 'package:achievements_calculator/components/text_field_container.dart';
import 'package:achievements_calculator/constants.dart';
import 'package:flutter/material.dart';

class InputField extends StatelessWidget {
  final String labelName;
  final TextEditingController controller;
  final ValueChanged<String> onChanged;
  final bool isPasswordField;
  final Color lightColor;
  final Color darkColor;
  final TextInputType inputType;
  const InputField(
      {Key? key,
      required this.onChanged,
      required this.controller,
      required this.labelName,
      required this.lightColor,
      required this.darkColor,
      required this.isPasswordField,
      required this.inputType})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        GradientText(key, labelName,
            style: const TextStyle(fontWeight: FontWeight.bold),
            gradient: LinearGradient(colors: [lightColor, darkColor])),
        TextFieldContainer(
            child: TextField(
          obscureText: isPasswordField,
          style: const TextStyle(color: lightTextColor),
          onChanged: onChanged,
          decoration: const InputDecoration(
            border: InputBorder.none,
          ),
          controller: controller,
          keyboardType: inputType,
        ))
      ],
    ));
  }
}
