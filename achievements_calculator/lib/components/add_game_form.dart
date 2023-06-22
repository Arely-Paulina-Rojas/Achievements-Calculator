import 'package:achievements_calculator/components/image_button.dart';
import 'package:achievements_calculator/components/input_field.dart';
import 'package:achievements_calculator/components/main_button.dart';
import 'package:another_flushbar/flushbar.dart';
import 'package:flutter/material.dart';
import '../constants.dart';

class AddGameForm extends StatelessWidget {
  final TextEditingController gameNameController = TextEditingController();
  final TextEditingController percentageController = TextEditingController();
  AddGameForm({Key? key}) : super(key: key);

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
              isPasswordField: false,
              inputType: TextInputType.text),
          InputField(
              onChanged: (value) {},
              controller: percentageController,
              labelName: "PERCENGATE",
              lightColor: lightDarkTextColor,
              darkColor: lightDarkTextColor,
              isPasswordField: false,
              inputType: TextInputType.number),
          ImageButton(labelText: "IMAGE", buttonText: "+", press: () {}),
          const SizedBox(height: 10),
          MainButton(
              text: "Save",
              press: () {
                if (validateForm(
                    gameNameController.text, percentageController.text)) {
                  if (validateNumber(percentageController.text)) {
                  } else {
                    Flushbar(
                      backgroundColor: Colors.red,
                      message: "Enter a valid percentage!",
                      duration: Duration(seconds: 3),
                    ).show(context);
                  }
                } else {
                  Flushbar(
                    backgroundColor: Colors.red,
                    message: "Fill all the fields!",
                    duration: Duration(seconds: 3),
                  ).show(context);
                }
                /*
                Future.delayed(Duration(seconds: 3), () {
                  Navigator.pop(context); 
                });*/
              },
              lightColor: lightMainButtonColor,
              darkColor: darkMainButtonColor)
        ],
      ),
    );
  }
}

bool validateForm(String name, String percentage) {
  if (name.isNotEmpty && percentage.isNotEmpty) {
    return true;
  } else {
    return false;
  }
}

bool validateNumber(String percentage) {
  if (double.tryParse(percentage) == null) return false;
  return true;
}
