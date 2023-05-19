import 'package:achievements_calculator/constants.dart';
import 'package:achievements_calculator/screens/login/login_screen.dart';
import 'package:achievements_calculator/screens/onboarding/onboarding_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp])
      .then((_) {
    runApp(const MyApp());
  });
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Achievements Calculator',
        theme: ThemeData(
          scaffoldBackgroundColor: lightTextColor,
          primarySwatch: Colors.blue,
          fontFamily: "Inter",
        ),
        home: OnboardingScreen());
  }
}

/*
const defaultInputBorder = OutlineInputBorder(
    borderRadius: BorderRadius.all(Radius.circular(16)),
    borderSide: BorderSide(color: lightTextColor, width: 1));
*/