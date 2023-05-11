import 'dart:ui';
import 'package:achievements_calculator/constants.dart';
import 'package:flutter/material.dart';
//import 'package:rive/rive.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body:
          BackgroundImage(nameBackgroundImage: 'assets/images/background.png'),
    );
  }
}

class BackgroundImage extends StatelessWidget {
  final String nameBackgroundImage;
  const BackgroundImage({Key? key, required this.nameBackgroundImage})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage(nameBackgroundImage), fit: BoxFit.cover)),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 5.0, sigmaY: 5.0),
        child: const Center(
          child: ContainerForm(),
        ),
      ),
    ));
  }
}

class ContainerForm extends StatelessWidget {
  const ContainerForm({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController testInput = TextEditingController();
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
                controller: testInput,
                labelName: "PASSWORD",
                isPasswordField: true,
                lightColor: lightDarkTextColor,
                darkColor: lightDarkTextColor,
              ),
              MainButton(
                text: 'Sign Up',
                lightColor: secondaryButtonColor,
                darkColor: secondaryButtonColor,
                press: () {},
              ),
              AlreadyHaveAnAccountCheck(
                press: () {},
              ),
            ],
          )),
    );
  }
}

class MainButton extends StatelessWidget {
  final String text;
  final void Function()? press;
  final Color lightColor;
  final Color darkColor;
  const MainButton(
      {Key? key,
      required this.text,
      required this.press,
      required this.lightColor,
      required this.darkColor})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
        margin: const EdgeInsets.symmetric(vertical: 10),
        height: 38,
        width: size.width * 0.7,
        decoration: BoxDecoration(
            gradient: LinearGradient(colors: [lightColor, darkColor])),
        child: TextButton(
          onPressed: press,
          child: Text(text, style: const TextStyle(color: lightTextColor)),
        ));
  }
}

class AlreadyHaveAnAccountCheck extends StatelessWidget {
  final bool login;
  final void Function()? press;
  const AlreadyHaveAnAccountCheck({Key? key, this.login = true, this.press})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Text(
          login ? "Don’t have an account? " : "Already have an account?",
          style: const TextStyle(color: lightTextColor),
        ),
        GestureDetector(
          onTap: press,
          child: GradientText(
            key,
            login ? "Sign Up" : "Sign In",
            style: const TextStyle(fontWeight: FontWeight.bold),
            gradient: const LinearGradient(
                colors: [lightMainButtonColor, darkMainButtonColor]),
          ),
        ),
      ],
    );
  }
}

class GradientText extends StatelessWidget {
  final String text;
  final TextStyle? style;
  final Gradient gradient;

  const GradientText(Key? key, this.text, {required this.gradient, this.style})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ShaderMask(
      blendMode: BlendMode.srcIn,
      shaderCallback: (bounds) => gradient
          .createShader(Rect.fromLTWH(0, 0, bounds.width, bounds.height)),
      child: Text(
        text,
        style: style,
      ),
    );
  }
}

class TextFieldContainer extends StatelessWidget {
  final Widget child;
  const TextFieldContainer({Key? key, required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
        margin: const EdgeInsets.symmetric(vertical: 10),
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
        width: size.width * 0.7,
        height: 38,
        decoration: const BoxDecoration(color: textFieldColor),
        child: child);
  }
}

class InputField extends StatelessWidget {
  final String labelName;
  final TextEditingController controller;
  final ValueChanged<String> onChanged;
  final bool isPasswordField;
  final Color lightColor;
  final Color darkColor;
  const InputField(
      {Key? key,
      required this.onChanged,
      required this.controller,
      required this.labelName,
      required this.lightColor,
      required this.darkColor,
      required this.isPasswordField})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        GradientText(key, labelName,
            style: const TextStyle(fontWeight: FontWeight.bold),
            gradient: LinearGradient(colors: [lightColor, darkColor])),
        TextFieldContainer(
            child: TextField(
          obscureText: isPasswordField,
          style: const TextStyle(color: lightTextColor),
          onChanged: onChanged,
          decoration: const InputDecoration(
            border: InputBorder.none,
          ),
          controller: controller,
        ))
      ],
    ));
  }
}

/*
class PasswordField extends StatelessWidget {
  final ValueChanged<String> onChanged;
  final TextEditingController controller;
  const PasswordField(
      {Key? key, required this.onChanged, required this.controller})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        const Text("PASSWORD", style: TextStyle(color: lightDarkTextColor, fontWeight: FontWeight.bold)),
        TextFieldContainer(
          child: TextField(
            controller: controller,
            obscureText: true,
            onChanged: ,
          ))
      ],
    ));
  }
} */
