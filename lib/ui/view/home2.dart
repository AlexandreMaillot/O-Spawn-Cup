import 'dart:math';

import 'package:flutter/material.dart';
import 'package:o_spawn_cup/bloc/bloc_list_game.dart';
import 'package:o_spawn_cup/bloc/bloc_provider.dart';
import 'package:o_spawn_cup/constant.dart';
import 'package:o_spawn_cup/models/card_game.dart';
import 'package:o_spawn_cup/ui/CustomsWidgets/custom_app_bar.dart';
import 'package:o_spawn_cup/ui/CustomsWidgets/custom_drawer.dart';
import 'package:o_spawn_cup/ui/CustomsWidgets/game_card.dart';


class Home2 extends StatelessWidget {
  PageController pageController = PageController(viewportFraction: 0.3, initialPage: 1);
  double currentPageValue = 1.0;

  Home2({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final bloc = BlocProvider.of<BlocListGame>(context);
    // currentPageValue = bloc.streamValue
    pageController.addListener(() {
      currentPageValue = pageController.page!;
    });
    // currentPageValue = pageController.page!;
    Size screenSize = MediaQuery.of(context).size;
    return Scaffold(
      drawer: CustomDrawer(screenSize: screenSize),
      appBar: CustomAppBar(title: "JEUX"),
      body: StreamBuilder<List<CardGame>>(
        stream: bloc.stream,
        builder: (context, snapshot) {

          return Column(
            children: [
              Expanded(
                  child: Container(
                child: Center(
                  child: SizedBox(
                    height: screenSize.height,
                    child: PageView.builder(
                        scrollDirection: Axis.vertical,
                        controller: pageController,
                        itemCount: listCardGame.length,
                        onPageChanged: (value) {
                          print(value);
                        },
                        itemBuilder: (context, position) {

                          if (position == currentPageValue) {
                            return Transform.scale(
                              scale: 1,
                              child: GameCard(position),
                            );
                          } else if (position < currentPageValue) {
                            return Transform.scale(
                              scale: max(1 - (currentPageValue - position), 0.75),
                              child: GameCard(position),
                            );
                          } else {
                            return Transform.scale(
                              scale: max(1 - (position - currentPageValue), 0.75),
                              child: GameCard(position),
                            );
                          }

                        }),
                  ),
                ),
                color: colorBackgroundTheme,
              )),
            ],
          );
        }
      ),
    );
  }
}
