import 'package:achievements_calculator/components/already_have_an_account_check.dart';
import 'package:achievements_calculator/components/input_field.dart';
import 'package:achievements_calculator/components/main_button.dart';
import 'package:achievements_calculator/screens/login/login_screen.dart';
import 'package:flutter/material.dart';
import '../../../constants.dart';

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
                  isPasswordField: false),
              SizedBox(height: size.width * 0.02),
              InputField(
                onChanged: (value) {},
                controller: passwordTextController,
                labelName: "PASSWORD",
                isPasswordField: true,
                lightColor: lightDarkTextColor,
                darkColor: lightDarkTextColor,
              ),
              MainButton(
                text: 'Sign Up',
                lightColor: lightMainButtonColor,
                darkColor: darkMainButtonColor,
                press: () {},
              ),
              SizedBox(height: size.width * 0.06),
              AlreadyHaveAnAccountCheck(
                press: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const LoginScreen()));
                },
                login: false,
              ),
            ],
          )),
    );
  }
}
