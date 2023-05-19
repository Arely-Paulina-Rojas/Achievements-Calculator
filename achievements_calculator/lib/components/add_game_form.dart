import 'package:achievements_calculator/components/image_button.dart';
import 'package:achievements_calculator/components/input_field.dart';
import 'package:achievements_calculator/components/main_button.dart';
import 'package:flutter/material.dart';
import '../constants.dart';

class AddGameForm extends StatelessWidget {
  final TextEditingController gameNameController;
  final TextEditingController percentageController;
  const AddGameForm(
      {Key? key,
      required this.gameNameController,
      required this.percentageController})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Column(
        children: [
          InputField(
              onChanged: (value) {},
              controller: gameNameController,
              labelName: "GAME NAME",
              lightColor: lightMainButtonColor,
              darkColor: darkMainButtonColor,
              isPasswordField: false),
          InputField(
              onChanged: (value) {},
              controller: percentageController,
              labelName: "PERCENGATE",
              lightColor: lightDarkTextColor,
              darkColor: lightDarkTextColor,
              isPasswordField: false),
          ImageButton(labelText: "IMAGE", buttonText: "+", press: () {}),
          const SizedBox(height: 10),
          MainButton(
              text: "Save",
              press: () {
                Navigator.pop(context);
              },
              lightColor: lightMainButtonColor,
              darkColor: darkMainButtonColor)
        ],
      ),
    );
  }
}
