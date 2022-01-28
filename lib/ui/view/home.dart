import "dart:math";

import "package:flutter/material.dart";
import "package:o_spawn_cup/bloc/bloc_list_game.dart";
import "package:o_spawn_cup/bloc/bloc_provider.dart";
import "package:o_spawn_cup/constant.dart";
import "package:o_spawn_cup/models/card_game.dart";
import "package:o_spawn_cup/ui/CustomsWidgets/custom_app_bar.dart";
import "package:o_spawn_cup/ui/CustomsWidgets/custom_drawer.dart";
import "package:o_spawn_cup/ui/CustomsWidgets/game_card.dart";
import "package:o_spawn_cup/ui/CustomsWidgets/no_data.dart";


class Home extends StatelessWidget {
  PageController pageController = PageController(viewportFraction: 0.3, initialPage: 1);

  Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final bloc = BlocProvider.of<BlocListGame>(context);
    Size screenSize = MediaQuery.of(context).size;

    pageController.addListener(() {
      bloc.changeGameSelect(pageController.page!);
    });
    return Scaffold(
      drawer: CustomDrawer(screenSize: screenSize),
      appBar: CustomAppBar(title: "JEUX"),
      body: StreamBuilder<double>(
        stream: bloc.streamValue,
        builder: (context, snapshot) {
          if(snapshot.hasError) {
            return NoData(string: "Erreur survenue lors du chargement...");
          }
          if(!snapshot.hasData){
            return NoData(string: "Aucune données !");
          } else {
            return Container(
              color: colorBackgroundTheme,
              height: screenSize.height,
              child: PageView.builder(
                  scrollDirection: Axis.vertical,
                  controller: pageController,
                  itemCount: listCardGame.length,
                  itemBuilder: (context, position) {
                    if (position == snapshot.data) {
                      return Transform.scale(
                        scale: 1,
                        child: GameCard(position),
                      );
                    } else if (position < snapshot.data!) {
                      return Transform.scale(
                        scale: max(1 - (snapshot.data! - position), 0.75),
                        child: GameCard(position),
                      );
                    } else {
                      return Transform.scale(
                        scale: max(1 - (position - snapshot.data!), 0.75),
                        child: GameCard(position),
                      );
                    }
                  }),
            );
          }
        }
      ),
    );
  }
}
