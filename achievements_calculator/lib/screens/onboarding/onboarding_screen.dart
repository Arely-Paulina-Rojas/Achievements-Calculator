import 'dart:ui';
import 'package:achievements_calculator/components/already_have_an_account_check.dart';
import 'package:achievements_calculator/components/custom_show_general_dialog.dart';
import 'package:achievements_calculator/components/game_form.dart';
import 'package:achievements_calculator/components/image_button.dart';
import 'package:achievements_calculator/components/input_field.dart';
import 'package:achievements_calculator/constants.dart';
import 'package:flutter/material.dart';
import '../../components/main_button.dart';

class OnboardingScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    TextEditingController gameNameController = TextEditingController();
    TextEditingController percengateController = TextEditingController();
    Size size = MediaQuery.of(context).size;
    return Background(
      child: SingleChildScrollView(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          MainButton(
              text: "Pruebita",
              press: () {
                customShowGeneralDialog(
                    context, gameNameController, percengateController);
              },
              lightColor: lightMainButtonColor,
              darkColor: darkMainButtonColor)
        ],
      )),
    );
  }
}

class Background extends StatelessWidget {
  final Widget child;
  const Background({Key? key, required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      color: backgroundColor,
      width: double.infinity,
      height: size.height,
      child: Stack(
        alignment: Alignment.center,
        children: <Widget>[child],
      ),
    );
  }
}

//import 'package:rive/rive.dart';

/*
class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: BackgroundImage(
          nameBackgroundImage: 'assets/images/login_background.png'),
    );
  }
}
*/
