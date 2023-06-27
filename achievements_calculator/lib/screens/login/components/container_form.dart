import 'package:achievements_calculator/components/already_have_an_account_check.dart';
import 'package:achievements_calculator/components/input_field.dart';
import 'package:achievements_calculator/components/main_button.dart';
import 'package:achievements_calculator/database/db_helper.dart';
import 'package:achievements_calculator/screens/homepage/homepage_screen.dart';
import 'package:achievements_calculator/screens/signup/signup_screen.dart';
import 'package:another_flushbar/flushbar.dart';
import 'package:flutter/material.dart';
import '../../../constants.dart';
import '../../../database/common/user.dart';

class ContainerForm extends StatelessWidget {
  const ContainerForm({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController nickNameTextController = TextEditingController();
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
                  controller: nickNameTextController,
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
                text: 'Login',
                lightColor: lightMainButtonColor,
                darkColor: darkMainButtonColor,
                press: () async {
                  if (validateForm(nickNameTextController.text,
                      passwordTextController.text)) {
                    bool validation = await SQLHelper.validateNickname(
                        nickNameTextController.text);
                    if (!validation) {
                      final user = User(null, nickNameTextController.text,
                          passwordTextController.text);
                      User? userLogin = await SQLHelper.login(user);
                      if (userLogin != null) {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    HomepageScreen(user: userLogin)));
                        Flushbar(
                          backgroundColor: successMessageColor,
                          message: "Welcome " + userLogin.nickname + "!",
                          duration: Duration(seconds: 3),
                        ).show(context);
                        FocusScope.of(context).requestFocus(new FocusNode());
                      } else {
                        Flushbar(
                          backgroundColor: errorMessageColor,
                          message: "Incorrect password!",
                          duration: Duration(seconds: 3),
                        ).show(context);
                      }
                    } else {
                      Flushbar(
                        backgroundColor: errorMessageColor,
                        message: "Account doesn't exist",
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
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const SignUpScreen()));
                },
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
