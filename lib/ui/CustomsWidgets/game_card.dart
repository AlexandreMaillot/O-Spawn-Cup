import 'package:flutter/material.dart';
import 'package:o_spawn_cup/bloc/bloc_router.dart';
import 'package:o_spawn_cup/ui/view/list_cup.dart';

import '../../constant.dart';

class GameCard extends StatelessWidget {
  final int index;

  const GameCard(this.index, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 0),
      child: InkWell(
        onTap: () => Navigator.of(context).push(BlocRouter().cupSelect(listCardGame[index].gameName)),
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