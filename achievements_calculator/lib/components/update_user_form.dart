import 'package:achievements_calculator/components/input_field.dart';
import 'package:achievements_calculator/components/main_button.dart';
import 'package:achievements_calculator/components/update_game_form.dart';
import 'package:achievements_calculator/database/common/user.dart';
import 'package:achievements_calculator/database/db_helper.dart';
import 'package:achievements_calculator/screens/homepage/homepage_screen.dart';
import 'package:another_flushbar/flushbar.dart';
import 'package:flutter/material.dart';
import '../constants.dart';

class UpdateUserForm extends StatelessWidget {
  final User user;
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
              isPasswordField: false),
          InputField(
              onChanged: (value) {},
              controller: passwordController..text = user!.password ?? "",
              labelName: "PASSWORD",
              lightColor: lightDarkTextColor,
              darkColor: lightDarkTextColor,
              isPasswordField: true),
          const SizedBox(height: 10),
          MainButton(
              text: "Save",
              press: () async {
                if (validateForm(
                    nickNameController.text, passwordController.text)) {
                  bool validation = await SQLHelper.validateUpdateNickname(
                      nickNameController.text, user.id);
                  if (validation) {
                    final user = User(this.user?.id, nickNameController.text,
                        passwordController.text);
                    await SQLHelper.updateUser(user);
                    ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text("Success!")));
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => HomepageScreen(user: user)));
                  } else {
                    Flushbar(
                      backgroundColor: Colors.red,
                      message: "Nickname already in user!",
                      duration: Duration(seconds: 3),
                    ).show(context);
                  }
                } else {
                  Flushbar(
                    backgroundColor: Colors.red,
                    message: "Empty fields",
                    duration: Duration(seconds: 3),
                  ).show(context);
                  /*
                  ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text("Empty fields!")));*/
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
