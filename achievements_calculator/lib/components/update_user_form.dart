import 'package:achievements_calculator/components/input_field.dart';
import 'package:achievements_calculator/components/main_button.dart';
import 'package:achievements_calculator/database/common/user.dart';
import 'package:achievements_calculator/database/db_helper.dart';
import 'package:achievements_calculator/database/utilities/utility.dart';
import 'package:achievements_calculator/screens/homepage/homepage_screen.dart';
import 'package:another_flushbar/flushbar.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import '../constants.dart';
import 'image_button.dart';

class UpdateUserForm extends StatelessWidget {
  final User user;
  String pathImage = "0";
  final TextEditingController nickNameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  UpdateUserForm({Key? key, required this.user}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Column(
        children: [
          InputField(
              onChanged: (value) {},
              controller: nickNameController..text = user!.nickname ?? "",
              labelName: "NICKNAME",
              lightColor: lightMainButtonColor,
              darkColor: darkMainButtonColor,
              isPasswordField: false,
              inputType: TextInputType.text),
          InputField(
              onChanged: (value) {},
              controller: passwordController..text = user!.password ?? "",
              labelName: "PASSWORD",
              lightColor: lightDarkTextColor,
              darkColor: lightDarkTextColor,
              isPasswordField: true,
              inputType: TextInputType.text),
          ImageButton(
              labelText: "AVATAR",
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
                    nickNameController.text, passwordController.text)) {
                  bool validation = await SQLHelper.validateUpdateNickname(
                      nickNameController.text, user.id);
                  if (validation) {
                    String newImage =
                        validateImage(this.user.avatar, this.pathImage);
                    final user = User(this.user.id, nickNameController.text,
                        passwordController.text, newImage);
                    await SQLHelper.updateUser(user);
                    User? updatedUser =
                        await SQLHelper.getSingleUser(this.user.id);
                    Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(
                            builder: (BuildContext context) =>
                                HomepageScreen(user: updatedUser!)),
                        (Route<dynamic> route) => false);
                    Flushbar(
                      backgroundColor: successMessageColor,
                      message: "Success!",
                      duration: Duration(seconds: 1),
                    ).show(context);
                  } else {
                    Flushbar(
                      backgroundColor: errorMessageColor,
                      message: "Nickname already in user!",
                      duration: Duration(seconds: 3),
                    ).show(context);
                  }
                } else {
                  Flushbar(
                    backgroundColor: errorMessageColor,
                    message: "Fill all the fields!",
                    duration: const Duration(seconds: 3),
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

bool validateForm(String nickname, String password) {
  if (nickname.isNotEmpty && password.isNotEmpty) {
    return true;
  } else {
    return false;
  }
}

String validateImage(String oldImage, newImage) {
  if (newImage == "0") return oldImage;
  return newImage;
}
