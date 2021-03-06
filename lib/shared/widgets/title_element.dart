import 'package:flutter/material.dart';
import 'package:o_spawn_cup/models/make_it_responsive.dart';

class TitleElement extends StatelessWidget {
  final String text;
  final Color? color;
  final TextAlign? textAlign;
  @override
  Widget build(BuildContext context) {
    final screenSize = MakeItResponsive().getScreenSize(context);

    return Text(
      text,
      textAlign: textAlign,
      style: TextStyle(
        color: color,
        fontSize: (screenSize == ScreenSize.small) ? 22 : 50,
        fontFamily: 'ospawn_title',
      ),
    );
  }

  const TitleElement({
    Key? key,
    required this.text,
    this.textAlign = TextAlign.left,
    this.color = Colors.white,
  }) : super(key: key);
}
