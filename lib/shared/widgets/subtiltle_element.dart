import 'package:flutter/material.dart';
import 'package:o_spawn_cup/models/make_it_responsive.dart';

class SubtitleElement extends StatelessWidget {
  final String text;
  final Color? color;
  final TextAlign? textAlign;
  final FontWeight? fontWeight;

  @override
  Widget build(BuildContext context) {
    final screenSize = MakeItResponsive().getScreenSize(context);

    return Text(
      text,
      textAlign: textAlign,
      style: TextStyle(
        color: color,
        fontWeight: fontWeight,
        fontSize: (screenSize == ScreenSize.small) ? 20 : 28,
        fontFamily: 'o_spawn_cup_font',
      ),
    );
  }

  const SubtitleElement({
    Key? key,
    required this.text,
    this.textAlign = TextAlign.justify,
    this.color = const Color(0xff201607),
    this.fontWeight,
  }) : super(key: key);
}
