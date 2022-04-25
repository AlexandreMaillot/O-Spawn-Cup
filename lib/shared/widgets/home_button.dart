import 'package:flutter/material.dart';
import 'package:o_spawn_cup/constant.dart';
import 'package:o_spawn_cup/pages/home/view/home.dart';
import 'package:o_spawn_cup/shared/widgets/custom_button_theme.dart';

class HomeButton extends StatelessWidget {
  const HomeButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomButtonTheme(
      colorText: colorTextTheme,
      colorButton: Colors.white,
      text: 'ACCUEIL',
      onPressedMethod: () => Navigator.of(context)
          .pushAndRemoveUntil(Home.route(), (Route<dynamic> route) => false),
    );
  }
}
