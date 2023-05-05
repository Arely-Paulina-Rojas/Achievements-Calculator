import 'package:achievements_calculator/constants.dart';
import 'package:achievements_calculator/screens/onboarding/onboarding_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Achievements Calculator',
        theme: ThemeData(
          scaffoldBackgroundColor: lightTextColor,
          primarySwatch: Colors.blue,
          fontFamily: "Inter",
        ),
        home: const OnboardingScreen());
  }
}

const defaultInputBorder = OutlineInputBorder(
    borderRadius: BorderRadius.all(Radius.circular(16)),
    borderSide: BorderSide(color: lightTextColor, width: 1));
