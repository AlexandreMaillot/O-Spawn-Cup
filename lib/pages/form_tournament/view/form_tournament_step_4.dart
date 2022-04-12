import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_form_bloc/flutter_form_bloc.dart';
import 'package:o_spawn_cup/bloc/select_game_bloc/select_game_bloc.dart';
import 'package:o_spawn_cup/constant.dart';
import 'package:o_spawn_cup/pages/form_tournament/bloc/tournament_form_bloc.dart';
import 'package:o_spawn_cup/pages/form_tournament/widgets/widget_choose_image.dart';
import 'package:o_spawn_cup/shared/widgets/text_element.dart';

FormBlocStep buildStep4(TournamentFormBloc tournamentFormBloc,) {
  return FormBlocStep(
      state: tournamentFormBloc.state.currentStep > 3 ? StepState.complete : StepState.disabled,
      isActive: tournamentFormBloc.state.currentStep >= 3,
      title: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          TextElement(
            text: 'Personnalisation',
            color: colorTheme,
          )
        ],
      ),
      content: Column(
        children: [
          const WidgetChooseImage(),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextElement(
              text: 'ou',
              color: Colors.white,
            ),
          ),
          TextElement(
            text: 'IMAGES PRE-DEFINIES',
            color: Colors.white,
          ),
          Padding(
            padding: const EdgeInsets.only(top: 8.0),
            child: BlocBuilder<SelectGameBloc, SelectGameState>(
              builder: (context, state) {
                return GridView.count(
                  shrinkWrap: true,
                  primary: false,
                  mainAxisSpacing: 10,
                  crossAxisSpacing: 10,
                  crossAxisCount: 3,
                  children: listImagePre.where((element) => element.gameName == tournamentFormBloc.game.value).toList(),
                );
              },
            ),
          ),
        ],
      ));
}