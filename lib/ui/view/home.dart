import "dart:math";

import "package:flutter/material.dart";
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:o_spawn_cup/bloc/select_game_bloc/select_game_bloc.dart';
import "package:o_spawn_cup/constant.dart";
import "package:o_spawn_cup/models/card_game.dart";
import "package:o_spawn_cup/ui/CustomsWidgets/custom_app_bar.dart";
import "package:o_spawn_cup/ui/CustomsWidgets/custom_drawer.dart";
import "package:o_spawn_cup/ui/CustomsWidgets/game_card.dart";
import "package:o_spawn_cup/ui/CustomsWidgets/no_data.dart";

class Home extends StatelessWidget {
  Home({
    Key? key,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) =>
          SelectGameBloc(listGameName: listCardGame,initialIndex: 1.0)..add(SelectGameInit()),
      child: HomeView(),
    );
  }
}

class HomeView extends StatelessWidget {
  PageController pageController =
      PageController(viewportFraction: 0.3, initialPage: 1);

  HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;

    pageController.addListener(() {

      context.read<SelectGameBloc>().add(SelectGameChange(indexSelect: pageController.page!));
    });
    return Scaffold(
      endDrawer: CustomDrawer(screenSize: screenSize),
      appBar: CustomAppBar(title: "JEUX",backArrow: false),
      body: BlocBuilder<SelectGameBloc, SelectGameState>(
        builder: (context, state) {
          final index = context.select((SelectGameBloc bloc) => bloc.state.index);
          if ((state.runtimeType == SelectGameNoData)) {
            return NoData(string: "Erreur survenue lors du chargement...");
          } else {
            return Container(
              color: colorBackgroundTheme,
              height: screenSize.height,
              child: PageView.builder(
                  scrollDirection: Axis.vertical,
                  controller: pageController,
                  itemCount: listCardGame.length,
                  itemBuilder: (context, position) {
                    if (position == state) {
                      return Transform.scale(
                        scale: 1,
                        child: GameCard(position),
                      );
                    } else if (position < state.index) {
                      return Transform.scale(
                        scale: max(1 - (index - position), 0.75),
                        child: GameCard(position),
                      );
                    } else {
                      return Transform.scale(
                        scale: max(1 - (position - index), 0.75),
                        child: GameCard(position),
                      );
                    }
                  }),
            );
          }
        },
      ),
    );
  }
}
