import 'package:achievements_calculator/constants.dart';
import 'package:flutter/material.dart';
import '../../../components/custom_show_update_game_dialog.dart';
import '../../../database/common/game.dart';

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
    return Padding(
        padding: const EdgeInsets.all(15.0), child: Image.asset(game!.image));
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
          const Icon(
            Icons.delete,
            color: lightDarkTextColor,
          )
        ],
      ),
    );
  }
}
