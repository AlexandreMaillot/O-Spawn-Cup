import 'package:flutter/material.dart';
import 'package:o_spawn_cup/ui/view/list_cup.dart';

import '../../constant.dart';

class GameCard extends StatelessWidget {
  final int index;

  GameCard(this.index);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 0),
      child: InkWell(
        onTap: () {
          Navigator.push(context, MaterialPageRoute(
            builder: (context) {
              return ListCup(gameName: listCardGame[index].gameName);
            },
          ));
        },
        child: ClipRRect(
          borderRadius: BorderRadius.circular(30),
          child: Container(
            color: Colors.white,
            child: Stack(
              children: [
                Image.asset(
                  listCardGame[index].img,
                  height: double.infinity,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}