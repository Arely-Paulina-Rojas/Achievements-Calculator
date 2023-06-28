import 'package:achievements_calculator/components/image_button.dart';
import 'package:achievements_calculator/components/input_field.dart';
import 'package:achievements_calculator/components/main_button.dart';
import 'package:achievements_calculator/database/db_helper.dart';
import 'package:achievements_calculator/database/utilities/utility.dart';
import 'package:achievements_calculator/screens/homepage/homepage_screen.dart';
import 'package:another_flushbar/flushbar.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import '../constants.dart';
import '../database/common/game.dart';
import '../database/common/user.dart';

class AddGameForm extends StatelessWidget {
  final User user;
  String pathImage = "";
  final TextEditingController gameNameController = TextEditingController();
  final TextEditingController percentageController = TextEditingController();
  AddGameForm({Key? key, required this.user}) : super(key: key);

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
          ImageButton(
              labelText: "IMAGE",
              buttonText: "+",
              press: () async {
                ImagePicker()
                    .pickImage(source: ImageSource.gallery)
                    .then((imgFile) async {
                  String imgString =
                      Utility.base64String(await imgFile!.readAsBytes());
                  this.pathImage = imgString;
                });
              }),
          const SizedBox(height: 10),
          MainButton(
              text: "Save",
              press: () async {
                if (validateForm(
                    gameNameController.text, percentageController.text)) {
                  if (validateNumber(percentageController.text)) {
                    this.pathImage = validateImage(pathImage);
                    final game = Game(
                        null,
                        this.pathImage,
                        gameNameController.text,
                        double.parse(percentageController.text),
                        this.user.id!);
                    await SQLHelper.createGame(game);
                    Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(
                            builder: (BuildContext context) =>
                                HomepageScreen(user: this.user)),
                        (Route<dynamic> route) => false);
                    Flushbar(
                      backgroundColor: successMessageColor,
                      message: "Success!",
                      duration: Duration(seconds: 3),
                    ).show(context);
                  } else {
                    Flushbar(
                      backgroundColor: errorMessageColor,
                      message: "Enter a valid percentage!",
                      duration: Duration(seconds: 3),
                    ).show(context);
                  }
                } else {
                  Flushbar(
                    backgroundColor: errorMessageColor,
                    message: "Fill all the fields!",
                    duration: Duration(seconds: 3),
                  ).show(context);
                }
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

String validateImage(String image) {
  if (image.isNotEmpty) return image;
  return "assets/icons/game.png";
}

bool validateNumber(String percentage) {
  if (double.tryParse(percentage) == null) return false;
  return true;
}
