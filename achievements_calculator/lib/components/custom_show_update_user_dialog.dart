import 'package:achievements_calculator/components/update_user_form.dart';
import 'package:achievements_calculator/constants.dart';
import 'package:achievements_calculator/database/common/user.dart';
import 'package:flutter/material.dart';

void customShowUpdateUserDialog(
    BuildContext context,
    TextEditingController nickNameController,
    TextEditingController passwordController) {
  showGeneralDialog(
      barrierDismissible: true,
      barrierLabel: "Update profile",
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
              height: 350,
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
                            "UPDATE PROFILE",
                            style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.bold,
                                color: lightTextColor),
                          ),
                          const Padding(
                              padding: EdgeInsets.symmetric(vertical: 16)),
                          UpdateUserForm(
                              nickNameController: nickNameController,
                              passwordController: passwordController,
                              user: User(1, "Arely Paulina", "amarillo"))
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
