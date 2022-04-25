import 'package:flutter/material.dart';
import 'package:o_spawn_cup/constant.dart';
import 'package:o_spawn_cup/shared/widgets/text_element.dart';

class RowInformationTournament extends StatelessWidget {
  const RowInformationTournament({
    Key? key,
    required this.leftText,
    required this.rightText,
  }) : super(key: key);

  final String leftText;
  final String rightText;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        top: 4,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          TextElement(
            text: leftText,
            color: Colors.white,
          ),
          TextElement(
            text: rightText,
            color: colorTheme,
          ),
        ],
      ),
    );
  }
}
