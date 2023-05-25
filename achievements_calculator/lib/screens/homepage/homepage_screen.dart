import 'package:achievements_calculator/screens/homepage/components/homepage_body.dart';
import 'package:flutter/material.dart';

class HomepageScreen extends StatelessWidget {
  HomepageScreen({Key? key}) : super(key: key);

  @override
  Widget build(final BuildContext context) {
    return Scaffold(
      body: HomepageBody(),
    );
  }
}
