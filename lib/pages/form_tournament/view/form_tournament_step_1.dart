import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_form_bloc/flutter_form_bloc.dart';
import 'package:o_spawn_cup/bloc/select_game_bloc/select_game_bloc.dart';
import 'package:o_spawn_cup/constant.dart';
import 'package:o_spawn_cup/pages/form_tournament/bloc/tournament_form_bloc.dart';
import 'package:o_spawn_cup/repository/tournament_repository.dart';
import 'package:o_spawn_cup/shared/widgets/game_card.dart';
import 'package:o_spawn_cup/shared/widgets/no_data.dart';
import 'package:o_spawn_cup/shared/widgets/text_element.dart';

FormBlocStep buildStep1(SelectGameBloc selectGameBloc,TournamentFormBloc tournamentFormBloc) {
  PageController pageController = PageController(viewportFraction: 0.5, initialPage: 1,keepPage: false);
  pageController.addListener(() {
    tournamentFormBloc.game.updateValue(listCardGame[pageController.page!.toInt()].gameName);
    selectGameBloc.add(SelectGameChange(indexSelect: pageController.page!));
  });
  return FormBlocStep(
    state: tournamentFormBloc.state.currentStep > 0 ? StepState.complete : StepState.disabled,
    isActive: tournamentFormBloc.state.currentStep >= 0,
    title: Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        TextElement(
          text: 'Choix du jeu',
          color: colorTheme,
        )
      ],
    ),
    content: BlocBuilder(
      bloc: tournamentFormBloc.game,
    builder: (context, state) {
      Size screenSize = MediaQuery.of(context).size;
    return BlocBuilder<SelectGameBloc, SelectGameState>(
      builder: (context, state) {
        if(state.runtimeType == SelectGameNoData) {
          return NoData(string: 'Aucun jeu disponible..');
        } else {
          final indexSelect = context.select((SelectGameBloc bloc) => (bloc.state as SelectGameChanged).index);
          return Container(
            color: colorBackgroundTheme,
            height: screenSize.height / 5,
            child: PageView.builder(
                scrollDirection: Axis.horizontal,
                controller: pageController,
                itemCount: listCardGame.length,
                itemBuilder: (context, position) {
                  if (position == indexSelect) {
                    return Transform.scale(
                      scale: 1,
                      child: GameCard(
                        position,
                        form: true,
                      ),
                    );
                  } else if (position < indexSelect) {
                    return Transform.scale(
                      scale: max(1 - (indexSelect - position), 0.75),
                      child: GameCard(
                        position,
                        form: true,
                      ),
                    );
                  } else {
                    return Transform.scale(
                      scale: max(1 - (position - indexSelect), 0.75),
                      child: GameCard(
                        position,
                        form: true,
                      ),
                    );
                  }
                }),
          );
        }

      },
    );
  },
),
  );
}