import 'package:flow_builder/flow_builder.dart';
import 'package:flutter/material.dart';
import 'package:o_spawn_cup/app/app.dart';
import 'package:o_spawn_cup/pages/list_cup/list_cup.dart';

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
              ? context.flow<AppState>().update((app) => app.copyWith(gameName: listCardGame[index].gameName))
          // Navigator.of(context).push<void>(ListCupPage(gameName: listCardGame[index].gameName).route())
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