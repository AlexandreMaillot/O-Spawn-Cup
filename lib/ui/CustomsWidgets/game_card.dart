import 'package:flutter/material.dart';
import 'package:o_spawn_cup/bloc/bloc_router.dart';
import 'package:o_spawn_cup/list_cup/view/list_cup_page.dart';

import '../../constant.dart';

class GameCard extends StatelessWidget {
  final int index;
  bool form;
  GameCard(this.index, {Key? key,this.form = false}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 0),
      child: InkWell(
        onTap: () {
          (form == false)
              ? Navigator.of(context).push(BlocRouter().cupSelect(listCardGame[index].gameName))
              : null;
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