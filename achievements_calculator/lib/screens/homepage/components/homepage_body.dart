import 'package:achievements_calculator/constants.dart';
import 'package:achievements_calculator/database/db_helper.dart';
import 'package:achievements_calculator/screens/homepage/components/game_list.dart';
import 'package:flutter/material.dart';
import '../../../database/common/game.dart';
import '../../../database/common/user.dart';
import 'background.dart';

class HomepageBody extends StatelessWidget {
  final User user;

  HomepageBody({Key? key, required this.user}) : super(key: key);

  @override
  Widget build(final BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Background(
        child: SingleChildScrollView(
      child: Column(children: <Widget>[
        SizedBox(height: 10),
        _textsHeader(context),
        _loadGames()
        //_yourGameList(context),
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

  Widget _loadGames() {
    return FutureBuilder(
        future: SQLHelper.getAllGamesByUser(user.id!),
        builder: (BuildContext context, AsyncSnapshot<List<Game>?> model) {
          if (model.hasData) {
            return _yourGameList(model.data);
          }
          return const Center(child: CircularProgressIndicator());
        });
  }

  Widget _yourGameList(context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: GameList(games: context))
      ],
    );
  }
}
