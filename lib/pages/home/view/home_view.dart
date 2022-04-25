import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:o_spawn_cup/bloc/select_game_bloc/select_game_bloc.dart';
import 'package:o_spawn_cup/constant.dart';
import 'package:o_spawn_cup/pages/list_cup/widgets/widgets_shared.dart';
import 'package:o_spawn_cup/shared/widgets/game_card.dart';

class HomeView extends StatelessWidget {
  final PageController pageController =
      PageController(viewportFraction: 0.3, initialPage: 1);

  HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    pageController.addListener(() {
      context
          .read<SelectGameBloc>()
          .add(SelectGameChange(indexSelect: pageController.page!));
    });

    return Scaffold(
      endDrawer: const CustomDrawer(),
      appBar: const CustomAppBar(title: 'JEUX', backArrow: false),
      body: BlocBuilder<SelectGameBloc, SelectGameState>(
        builder: (context, state) {
          if (state.runtimeType == SelectGameNoData) {
            return const NoData(string: 'Aucun jeu disponible !');
          } else {
            final index = context.select(
              (SelectGameBloc bloc) => (bloc.state as SelectGameChanged).index,
            );

            return Container(
              color: colorBackgroundTheme,
              height: screenSize.height,
              child: PageView.builder(
                scrollDirection: Axis.vertical,
                controller: pageController,
                itemCount: listCardGame.length,
                itemBuilder: (context, position) {
                  if (position == index) {
                    return Transform.scale(
                      scale: 1,
                      child: GameCard(position),
                    );
                  } else if (position < index) {
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
                },
              ),
            );
          }
        },
      ),
    );
  }
}
