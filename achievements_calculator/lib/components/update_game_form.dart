import 'package:achievements_calculator/components/image_button.dart';
import 'package:achievements_calculator/components/input_field.dart';
import 'package:achievements_calculator/components/main_button.dart';
import 'package:achievements_calculator/database/common/game.dart';
import 'package:achievements_calculator/database/db_helper.dart';
import 'package:achievements_calculator/database/utilities/utility.dart';
import 'package:achievements_calculator/screens/homepage/homepage_screen.dart';
import 'package:another_flushbar/flushbar.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import '../constants.dart';
import '../database/common/user.dart';

class UpdateGameForm extends StatelessWidget {
  final Game? game;
  String pathImage = "0";
  final TextEditingController gameNameController = TextEditingController();
  final TextEditingController percentageController = TextEditingController();

  UpdateGameForm({
    Key? key,
    required this.game,
  }) : super(key: key);

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
              isPasswordField: false,
              inputType: TextInputType.text),
          InputField(
              onChanged: (value) {},
              controller: percentageController
                ..text = game!.percentage.toString() ?? "",
              labelName: "PERCENTAGE",
              lightColor: lightDarkTextColor,
              darkColor: lightDarkTextColor,
              isPasswordField: false,
              inputType: TextInputType.number),
          ImageButton(
              labelText: "IMAGE",
              buttonText: "+",
              press: () {
                ImagePicker()
                    .pickImage(source: ImageSource.gallery)
                    .then((imgFile) async {
                  String imgString =
                      Utility.base64String(await imgFile!.readAsBytes());
                  pathImage = imgString;
                });
              }),
          const SizedBox(height: 10),
          MainButton(
              text: "Save",
              press: () async {
                if (validateForm(
                    gameNameController.text, percentageController.text)) {
                  if (validateNumber(percentageController.text)) {
                    String newImage =
                        validateImage(this.game!.image, this.pathImage);
                    final game = Game(
                        this.game!.id,
                        newImage,
                        gameNameController.text,
                        double.parse(percentageController.text),
                        this.game!.idUser);
                    await SQLHelper.updateGame(game);
                    User? user =
                        await SQLHelper.getSingleUser(this.game!.idUser);
                    Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(
                            builder: (BuildContext context) =>
                                HomepageScreen(user: user!)),
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
  if (name.isNotEmpty && percentage.isNotEmpty) return true;
  return false;
}

String validateImage(String oldImage, newImage) {
  if (newImage == "0") return oldImage;
  return newImage;
}

bool validateNumber(String percentage) {
  if (double.tryParse(percentage) == null) return false;
  return true;
}
