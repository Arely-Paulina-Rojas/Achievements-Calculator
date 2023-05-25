import 'package:achievements_calculator/screens/homepage/components/game_card.dart';
import 'package:flutter/material.dart';
import '../../../database/common/game.dart';

class GameList extends StatelessWidget {
  List<Game> games;

  GameList({Key? key, required this.games}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      itemCount: this.games.length,
      itemBuilder: (context, index) => GameCard(
        game: games[index],
      ),
    );
  }
}
