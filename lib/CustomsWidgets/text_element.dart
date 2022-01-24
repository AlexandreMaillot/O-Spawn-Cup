import 'package:flutter/material.dart';
import 'package:o_spawn_cup/model/make_it_responsive.dart';

import '../constant.dart';

class TextElement extends StatelessWidget {
  String text;
  final Color? color;
  TextAlign? textAlign;
  FontWeight? fontWeight;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    ScreenSize screenSize = MakeItResponsive().getScreenSize(context);
    return Text(
      text,
      textAlign: textAlign,
      style: TextStyle(
          color: color,
          fontWeight: fontWeight,
          fontSize: (screenSize == ScreenSize.small) ? 12 : 28,
          fontFamily: "ospawn_text"),
    );
  }

  TextElement(
      {Key? key, required this.text,
      this.textAlign = TextAlign.justify,
      this.color = const Color(0xff201607),
      this.fontWeight}) : super(key: key);
}
