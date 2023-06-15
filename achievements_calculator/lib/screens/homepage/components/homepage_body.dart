import 'package:achievements_calculator/constants.dart';
import 'package:achievements_calculator/screens/homepage/components/game_list.dart';
import 'package:flutter/material.dart';
import '../../../database/common/game.dart';
import '../../../database/common/user.dart';
import 'background.dart';

class HomepageBody extends StatelessWidget {
  final User user;
  List<Game> tempYourGamesList = [
    Game(1, "assets/icons/game.png", "To the moon", 100),
    Game(2, "assets/icons/game.png", "Mortal Kombat Komplete Edition", 58),
    Game(3, "assets/icons/game.png", "Papers, Please", 84),
    Game(4, "assets/icons/game.png", "Metro 2033 Redux", 100),
    Game(5, "assets/icons/game.png", "Pony Island", 100),
    Game(6, "assets/icons/game.png", "Tembo The Badass Elephant", 100),
  ];

  HomepageBody({Key? key, required this.user}) : super(key: key);

  @override
  Widget build(final BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Background(
        child: SingleChildScrollView(
      child: Column(children: <Widget>[
        SizedBox(height: 10),
        _textsHeader(context),
        _yourGameList(context),
      ]),
    ));
  }

  Widget _textsHeader(context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 30.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: const <Widget>[
          Text(
            "80%",
            style: TextStyle(
                color: lightTextColor,
                fontSize: 30,
                fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 5),
          Text(
            "Avg. Game Completion Rate",
            style: TextStyle(
                color: lightTextColor,
                fontSize: 20,
                fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }

  Widget _yourGameList(context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: GameList(games: tempYourGamesList))
      ],
    );
  }
}
