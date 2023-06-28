import 'package:achievements_calculator/components/custom_show_add_game_dialog.dart';
import 'package:achievements_calculator/components/custom_show_update_user_dialog.dart';
import 'package:achievements_calculator/constants.dart';
import 'package:achievements_calculator/database/common/user.dart';
import 'package:achievements_calculator/database/db_helper.dart';
import 'package:achievements_calculator/screens/homepage/components/homepage_body.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import '../login/login_screen.dart';

class HomepageScreen extends StatelessWidget {
  final User user;
  const HomepageScreen({Key? key, required this.user}) : super(key: key);

  @override
  Widget build(final BuildContext context) {
    return Scaffold(
      bottomNavigationBar: CurvedNavigationBar(
        backgroundColor: backgroundColor,
        color: cardBackgroundColor,
        animationDuration: const Duration(milliseconds: 300),
        items: const [
          Icon(Icons.account_box_rounded, color: lightTextColor),
          Icon(Icons.add, color: lightTextColor),
          Icon(
            Icons.logout,
            color: lightTextColor,
          )
        ],
        onTap: (index) async {
          switch (index) {
            case 0:
              User? profileUser = await SQLHelper.getSingleUser(user.id!);
              customShowUpdateUserDialog(context, profileUser!);
              print(1);
              break;
            case 1:
              customShowAddGameDialog(context, user!);
              break;
            case 2:
              Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(
                      builder: (BuildContext context) => const LoginScreen()),
                  (Route<dynamic> route) => false);
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
