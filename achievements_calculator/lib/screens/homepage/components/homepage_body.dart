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
      ]),
    ));
  }

  Widget _textsHeader(context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 30.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          _loadAverage(context),
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

  Widget _loadAverage(context) {
    return FutureBuilder(
        future: SQLHelper.caculateAverage(user.id!),
        builder: (BuildContext context, AsyncSnapshot<double> model) {
          if (model.hasData) {
            print(model.data);
            return _yourAverage(model.data);
          }
          return const Center(child: CircularProgressIndicator());
        });
  }

  Widget _yourAverage(context) {
    return Text(
      context.toString() + "%",
      style: TextStyle(
          color: lightTextColor, fontSize: 30, fontWeight: FontWeight.bold),
    );
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
