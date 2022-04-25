import 'package:flow_builder/flow_builder.dart';
import 'package:flutter/material.dart';
import 'package:o_spawn_cup/app/app.dart';
import 'package:o_spawn_cup/constant.dart';

class GameCard extends StatelessWidget {
  final int index;
  final bool form;
  const GameCard(this.index, {Key? key, this.form = false}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => onTap(context),
      child: ClipRRect(
        borderRadius: const BorderRadius.all(Radius.circular(30)),
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
    );
  }

  void onTap(BuildContext context) {
    if (!form) {
      context.flow<AppState>().update(
            (app) => app.copyWith(gameName: listCardGame[index].gameName),
          );
    }
  }
}
