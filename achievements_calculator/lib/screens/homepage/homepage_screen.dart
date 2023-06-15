import 'package:achievements_calculator/components/custom_show_add_game_dialog.dart';
import 'package:achievements_calculator/components/custom_show_update_user_dialog.dart';
import 'package:achievements_calculator/constants.dart';
import 'package:achievements_calculator/database/common/user.dart';
import 'package:achievements_calculator/screens/homepage/components/homepage_body.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';

import '../login/login_screen.dart';

class HomepageScreen extends StatelessWidget {
  final User? user;
  HomepageScreen({Key? key, required this.user}) : super(key: key);

  @override
  Widget build(final BuildContext context) {
    return Scaffold(
      bottomNavigationBar: CurvedNavigationBar(
        backgroundColor: backgroundColor,
        color: cardBackgroundColor,
        animationDuration: Duration(milliseconds: 300),
        items: const [
          Icon(Icons.account_box_rounded, color: lightTextColor),
          Icon(Icons.add, color: lightTextColor),
          Icon(
            Icons.logout,
            color: lightTextColor,
          )
        ],
        onTap: (index) {
          switch (index) {
            case 0:
              customShowUpdateUserDialog(context, User(1, "Arely", "1234"));
              print(1);
              break;
            case 1:
              customShowAddGameDialog(context);
              break;
            case 2:
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const LoginScreen()));
              break;
          }
        },
      ),
      body: HomepageBody(
        user: user,
      ),
    );
  }
}
