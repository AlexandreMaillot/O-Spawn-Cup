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
          Container(
            padding: const EdgeInsets.only(right: 4),
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(2)),
              color: colorOpen,
            ),
            width: 17,
            height: 17,
          ),
          const TextElement(
            text: 'Ouvert',
            color: Colors.white,
          ),
          Container(
            padding: const EdgeInsets.only(left: 16, right: 4),
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(2)),
              color: colorInProgress,
            ),
            width: 17,
            height: 17,
          ),
          const TextElement(
            text: 'En cours',
            color: Colors.white,
          ),
          Container(
            padding: const EdgeInsets.only(left: 16, right: 4),
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(2)),
              color: colorClose,
            ),
            width: 17,
            height: 17,
          ),
          const TextElement(
            text: 'Fermé',
            color: Colors.white,
          ),
        ],
      ),
    );
  }
}
