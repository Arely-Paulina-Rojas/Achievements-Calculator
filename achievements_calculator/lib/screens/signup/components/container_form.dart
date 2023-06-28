import 'package:achievements_calculator/components/already_have_an_account_check.dart';
import 'package:achievements_calculator/components/input_field.dart';
import 'package:achievements_calculator/components/main_button.dart';
import 'package:achievements_calculator/database/db_helper.dart';
import 'package:achievements_calculator/screens/login/login_screen.dart';
import 'package:another_flushbar/flushbar.dart';
import 'package:flutter/material.dart';
import '../../../constants.dart';
import '../../../database/common/user.dart';

class ContainerForm extends StatelessWidget {
  const ContainerForm({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController nicknameTextController = TextEditingController();
    TextEditingController passwordTextController = TextEditingController();
    Size size = MediaQuery.of(context).size;

    return Center(
      child: Container(
          margin: const EdgeInsets.symmetric(vertical: 10),
          color: formBackgroundColor,
          height: 370,
          width: size.width * 0.8,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              InputField(
                  onChanged: (value) {},
                  controller: nicknameTextController,
                  labelName: "YOUR NICKNAME",
                  lightColor: lightMainButtonColor,
                  darkColor: darkMainButtonColor,
                  isPasswordField: false,
                  inputType: TextInputType.text),
              SizedBox(height: size.width * 0.02),
              InputField(
                onChanged: (value) {},
                controller: passwordTextController,
                labelName: "PASSWORD",
                isPasswordField: true,
                lightColor: lightDarkTextColor,
                darkColor: lightDarkTextColor,
                inputType: TextInputType.text,
              ),
              MainButton(
                text: 'Sign Up',
                lightColor: lightMainButtonColor,
                darkColor: darkMainButtonColor,
                press: () async {
                  if (validateForm(nicknameTextController.text,
                      passwordTextController.text)) {
                    bool validation = await SQLHelper.validateNickname(
                        nicknameTextController.text);
                    if (validation) {
                      final user = User(null, nicknameTextController.text,
                          passwordTextController.text);
                      await SQLHelper.createUser(user);
                      Navigator.pushAndRemoveUntil(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const LoginScreen()),
                          (Route<dynamic> route) => false);
                      Flushbar(
                        backgroundColor: successMessageColor,
                        message: "Success!",
                        duration: Duration(seconds: 3),
                      ).show(context);
                    } else {
                      Flushbar(
                        backgroundColor: errorMessageColor,
                        message: "Nickname already in use!",
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
              ),
              SizedBox(height: size.width * 0.06),
              AlreadyHaveAnAccountCheck(
                press: () {
                  Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const LoginScreen()),
                      (Route<dynamic> route) => false);
                },
                login: false,
              ),
            ],
          )),
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
