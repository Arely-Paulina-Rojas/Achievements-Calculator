import 'package:achievements_calculator/components/update_game_form.dart';
import 'package:achievements_calculator/constants.dart';
import 'package:achievements_calculator/database/common/game.dart';
import 'package:flutter/material.dart';

void customShowUpdateGameDialog(
    BuildContext context,
    TextEditingController gameNameController,
    TextEditingController percentageController) {
  showGeneralDialog(
      barrierDismissible: true,
      barrierLabel: "Add game",
      context: context,
      transitionDuration: const Duration(milliseconds: 400),
      transitionBuilder: (_, animation, __, child) {
        Tween<Offset> tween;
        tween = Tween(begin: const Offset(0, -1), end: Offset.zero);
        return SlideTransition(
          position: tween.animate(
            CurvedAnimation(parent: animation, curve: Curves.easeInOut),
          ),
          child: child,
        );
      },
      pageBuilder: (context, _, __) => Center(
            child: Container(
              height: 450,
              margin: const EdgeInsets.symmetric(horizontal: 26),
              padding: const EdgeInsets.symmetric(vertical: 32, horizontal: 24),
              decoration: const BoxDecoration(color: formBackgroundColor),
              child: Scaffold(
                  resizeToAvoidBottomInset: false,
                  backgroundColor: Colors.transparent,
                  body: Stack(
                    clipBehavior: Clip.none,
                    children: [
                      Column(
                        children: [
                          const Text(
                            "UPDATE GAME",
                            style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.bold,
                                color: lightTextColor),
                          ),
                          const Padding(
                              padding: EdgeInsets.symmetric(vertical: 16)),
                          UpdateGameForm(
                              gameNameController: gameNameController,
                              percentageController: percentageController,
                              game: Game(1, "To the moon", 100))
                        ],
                      ),
                      const Positioned(
                          left: 0,
                          right: 0,
                          bottom: -48,
                          child: CircleAvatar(
                              radius: 16,
                              backgroundColor: formBackgroundColor,
                              foregroundColor: lightDarkTextColor,
                              child: Icon(
                                Icons.close,
                                color: lightDarkTextColor,
                              ))),
                    ],
                  )),
            ),
          ));
}
