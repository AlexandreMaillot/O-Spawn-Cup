import 'package:flutter/material.dart';
import 'package:o_spawn_cup/models/tournament/tournament.dart';
import 'package:o_spawn_cup/pages/list_cup/widgets/widgets_shared.dart';

class ListCardCup extends StatelessWidget {
  const ListCardCup({
    Key? key,
    required this.listCup,
  }) : super(key: key);

  final List<Tournament> listCup;

  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: GridView.builder(
        itemCount: listCup.length,
        itemBuilder: (BuildContext context, int index) {
          return CardCup(tournament: listCup[index]);
        },
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          mainAxisSpacing: 10,
          crossAxisSpacing: 10,
          crossAxisCount: 2,
        ),
      ),
    );
  }
}
