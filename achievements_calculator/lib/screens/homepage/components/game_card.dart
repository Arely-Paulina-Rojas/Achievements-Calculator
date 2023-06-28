import 'package:achievements_calculator/constants.dart';
import 'package:achievements_calculator/database/db_helper.dart';
import 'package:achievements_calculator/database/utilities/utility.dart';
import 'package:achievements_calculator/screens/homepage/homepage_screen.dart';
import 'package:another_flushbar/flushbar.dart';
import 'package:flutter/material.dart';
import '../../../components/custom_show_update_game_dialog.dart';
import '../../../database/common/game.dart';
import '../../../database/common/user.dart';

class GameCard extends StatelessWidget {
  final Game game;

  const GameCard({Key? key, required this.game}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 7.0),
      child: Container(
        decoration: _boxDecoration(),
        height: 100.0,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Row(
              children: <Widget>[_gameLogo(), _infoGameTexts(context)],
            ),
            _iconsOptions(context)
          ],
        ),
      ),
    );
  }

  BoxDecoration _boxDecoration() {
    return const BoxDecoration(
        color: cardBackgroundColor,
        boxShadow: <BoxShadow>[
          BoxShadow(
              color: Colors.black26, offset: Offset(2.0, 2.0), blurRadius: 8.0)
        ]);
  }

  Widget _gameLogo() {
    if (game!.image == "assets/icons/game.png") {
      return Padding(
          padding: const EdgeInsets.all(15.0), child: Image.asset(game!.image));
    } else {
      return Padding(
          padding: const EdgeInsets.all(15.0),
          child: Utility.imageFromBase64String(game!.image));
    }
  }

  Widget _infoGameTexts(context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Text(
          cutText(game!.name),
          style: const TextStyle(
              color: lightTextColor, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 15),
        Text(
          game!.percentage.toString() + "%",
          style: const TextStyle(
              color: lightTextColor, fontSize: 25, fontWeight: FontWeight.bold),
        )
      ],
    );
  }

  String cutText(String text) {
    if (text.length >= 30) {
      return text.substring(0, 27);
    } else {
      return text;
    }
  }

  Widget _iconsOptions(context) {
    return Padding(
      padding: const EdgeInsets.only(top: 20.0, right: 20.0),
      child: Column(
        children: <Widget>[
          GestureDetector(
            child: const Icon(Icons.edit, color: lightMainButtonColor),
            onTap: () {
              customShowUpdateGameDialog(context, game);
            },
          ),
          const SizedBox(height: 3),
          GestureDetector(
            child: const Icon(
              Icons.delete,
              color: lightDarkTextColor,
            ),
            onTap: () async {
              _showAlertDialog(context);
            },
          )
        ],
      ),
    );
  }

  void _showAlertDialog(context) {
    showDialog(
        context: context,
        builder: (buildcontext) {
          return AlertDialog(
            backgroundColor: cardBackgroundColor,
            title: const Text("Confirmation",
                style: TextStyle(color: lightTextColor)),
            content: const Text(
                "Would you like to remove the game from the list?",
                style: TextStyle(color: lightTextColor)),
            actions: <Widget>[
              TextButton(
                  child: const Text(
                    "Yes",
                    style: TextStyle(color: lightMainButtonColor),
                  ),
                  onPressed: () async {
                    await SQLHelper.deleteGame(game.id!);
                    User? user = await SQLHelper.getSingleUser(game.idUser);
                    Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(
                            builder: (BuildContext context) =>
                                HomepageScreen(user: user!)),
                        (Route<dynamic> route) => false);
                    Flushbar(
                      backgroundColor: successMessageColor,
                      message: "Success!",
                      duration: Duration(seconds: 3),
                    ).show(context);
                  }),
              TextButton(
                  child: const Text("No",
                      style: TextStyle(color: lightDarkTextColor)),
                  onPressed: () {
                    Navigator.of(context).pop();
                  })
            ],
          );
        });
  }
}
