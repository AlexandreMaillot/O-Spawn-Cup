import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_form_bloc/flutter_form_bloc.dart';
import 'package:o_spawn_cup/bloc/form_tournament_step_2_bloc/form_tournament_step_2_bloc.dart';
import 'package:o_spawn_cup/constant.dart';
import 'package:o_spawn_cup/cubit/generate_code_cubit/generate_code_cubit.dart';
import 'package:o_spawn_cup/pages/form_tournament/bloc/tournament_form_bloc.dart';
import 'package:o_spawn_cup/pages/form_tournament/form_tournament.dart';
import 'package:o_spawn_cup/pages/form_tournament/widgets/dropdown_server.dart';
import 'package:o_spawn_cup/shared/widgets/custom_row_textfield_date.dart';
import 'package:o_spawn_cup/shared/widgets/custom_text_field.dart';
import 'package:o_spawn_cup/shared/widgets/text_element.dart';

FormBlocStep buildStep2(TournamentFormBloc tournamentFormBloc) {
  Padding espaceEntreChamp = const Padding(padding: EdgeInsets.only(bottom: 5));
  return FormBlocStep(
      state: tournamentFormBloc.state.currentStep > 1 ? StepState.complete : StepState.disabled,
      isActive: tournamentFormBloc.state.currentStep >= 1,
      title: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          TextElement(
            text: 'Informations',
            color: colorTheme,
          )
        ],
      ),
      content: SizedBox(
        // height: screenSize.height * 0.48,
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            TextFieldForm(textFieldBloc: tournamentFormBloc.nameTournament, hintText: 'NOM DU TOURNOIS'),
            espaceEntreChamp,
            TextFieldForm(textFieldBloc: tournamentFormBloc.gameNumber, textInputType: TextInputType.number,hintText: 'NOMBRE DE GAME(S)',onChanged: (value) => tournamentFormBloc.numGameChange(value)),
            espaceEntreChamp,
            TextElement(text: 'Date début des inscriptions',
              color: Colors.white,
              textAlign: TextAlign.center,
            ),
            espaceEntreChamp,
            RowDatePick(inputFieldBloc: tournamentFormBloc.signCupDate,hintText: 'Date début des inscriptions'),
            espaceEntreChamp,
            TextElement(text: 'Date début du tournois',
              color: Colors.white,
              textAlign: TextAlign.center,
            ),
            espaceEntreChamp,
            RowDatePick(inputFieldBloc: tournamentFormBloc.startCupDate,hintText: 'Date début du tournois'),
            espaceEntreChamp,
            TextElement(text: 'Heure début du tournois',
              color: Colors.white,
              textAlign: TextAlign.center,
            ),
            espaceEntreChamp,
            TimePick(inputFieldBloc: tournamentFormBloc.startTime, hintText: "Heure début"),
            espaceEntreChamp,
            TextElement(
              text: 'NOMBRE DE JOUEURS PAR EQUIPE',
              color: Colors.white,
              textAlign: TextAlign.center,
            ),
            espaceEntreChamp,
            RowNumberPlayerByTeam(inputFieldBloc: tournamentFormBloc.numberPlayerByTeam),
            espaceEntreChamp,
            TextFieldForm(textFieldBloc: tournamentFormBloc.numberTeam, hintText: "NOMBRE D'EQUIPES",textInputType: TextInputType.number),
            espaceEntreChamp,
            DropdownServer(selectFieldBloc: tournamentFormBloc.server),

          ],
        ),
      ));
}