import 'package:achievements_calculator/components/image_button.dart';
import 'package:achievements_calculator/components/input_field.dart';
import 'package:achievements_calculator/components/main_button.dart';
import 'package:achievements_calculator/database/common/game.dart';
import 'package:flutter/material.dart';
import '../constants.dart';

class UpdateGameForm extends StatelessWidget {
  final Game? game;
  final TextEditingController gameNameController;
  final TextEditingController percentageController;
  const UpdateGameForm(
      {Key? key,
      required this.game,
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
              controller: gameNameController..text = game!.name ?? "",
              labelName: "GAME NAME",
              lightColor: lightMainButtonColor,
              darkColor: darkMainButtonColor,
              isPasswordField: false),
          InputField(
              onChanged: (value) {},
              controller: percentageController
                ..text = game!.percentage.toString() ?? "",
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
