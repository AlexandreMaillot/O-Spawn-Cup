import 'package:flutter/material.dart';
import 'package:flutter_form_bloc/flutter_form_bloc.dart';
import 'package:o_spawn_cup/constant.dart';
import 'package:o_spawn_cup/pages/form_tournament/form_tournament.dart';
import 'package:o_spawn_cup/shared/widgets/text_element.dart';

FormBlocStep buildStep3(
  TournamentFormBloc tournamentFormBloc,
) {
  return FormBlocStep(
    state: tournamentFormBloc.state.currentStep > 2
        ? StepState.complete
        : StepState.disabled,
    isActive: tournamentFormBloc.state.currentStep >= 2,
    title: Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: const [
        TextElement(
          text: 'Points',
          color: colorTheme,
        ),
      ],
    ),
    content: SizedBox(
      child: Column(
        // mainAxisSize: MainAxisSize.max,
        // mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          TextFieldForm(
            textFieldBloc: tournamentFormBloc.pointPerKill,
            hintText: 'POINT PAR KILL',
            textInputType: TextInputType.number,
          ),
          TextFieldForm(
            textFieldBloc: tournamentFormBloc.pointPerRang,
            hintText: 'POINT PAR RANG',
            textInputType: TextInputType.number,
          ),
          TextFieldForm(
            textFieldBloc: tournamentFormBloc.pointStart,
            hintText: 'RANG DEBUT DU DECOMPTE',
            textInputType: TextInputType.number,
          ),
        ],
      ),
    ),
  );
}
