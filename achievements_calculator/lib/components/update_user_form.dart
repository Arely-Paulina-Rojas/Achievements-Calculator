import 'package:achievements_calculator/components/input_field.dart';
import 'package:achievements_calculator/components/main_button.dart';
import 'package:achievements_calculator/database/common/user.dart';
import 'package:flutter/material.dart';
import '../constants.dart';

class UpdateUserForm extends StatelessWidget {
  final User? user;
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
              labelName: "PERCENGATE",
              lightColor: lightDarkTextColor,
              darkColor: lightDarkTextColor,
              isPasswordField: true),
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
