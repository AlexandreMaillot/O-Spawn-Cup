import 'package:flutter/material.dart';
import 'package:o_spawn_cup/constant.dart';
import 'package:o_spawn_cup/shared/widgets/text_element.dart';

class RowTournamentState extends StatelessWidget {
  const RowTournamentState({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.only(right: 4.0),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(2),
                color: colorOpen,
              ),
              width: 17,
              height: 17,
            ),
          ),
          TextElement(
            text: "Ouvert",
            color: Colors.white,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 16,right: 4),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(2),
                color: colorInProgress,
              ),
              width: 17,
              height: 17,
            ),
          ),
          TextElement(
            text: "En cours",
            color: Colors.white,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 16,right: 4),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(2),
                color: colorClose,
              ),
              width: 17,
              height: 17,
            ),
          ),
          TextElement(
            text: "Fermé",
            color: Colors.white,
          ),
        ],
      ),
    );
  }
}