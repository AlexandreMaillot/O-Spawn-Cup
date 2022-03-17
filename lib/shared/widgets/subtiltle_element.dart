import 'package:flutter/material.dart';
import 'package:o_spawn_cup/models/make_it_responsive.dart';


class SubtitleElement extends StatelessWidget {
  String text;
  final Color? color;
  TextAlign? textAlign;
  FontWeight? fontWeight;

  @override
  Widget build(BuildContext context) {
    ScreenSize screenSize = MakeItResponsive().getScreenSize(context);
    return Text(
      text,
      textAlign: textAlign,
      style: TextStyle(
          color: color,
          fontWeight: fontWeight,
          fontSize: (screenSize == ScreenSize.small) ? 20 : 28,
          fontFamily: "o_spawn_cup_font"),
    );
  }

  SubtitleElement(
      {Key? key, required this.text,
      this.textAlign = TextAlign.justify,
      this.color = const Color(0xff201607),
      this.fontWeight}) : super(key: key);
}
