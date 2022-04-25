import 'package:flutter/material.dart';
import 'package:flutter_form_bloc/flutter_form_bloc.dart';
import 'package:o_spawn_cup/constant.dart';
import 'package:o_spawn_cup/pages/form_tournament/form_tournament.dart';
import 'package:o_spawn_cup/shared/widgets/text_element.dart';

FormBlocStep buildStep2(TournamentFormBloc tournamentFormBloc) {
  const espaceEntreChamp = Padding(padding: EdgeInsets.only(bottom: 5));

  return FormBlocStep(
    state: tournamentFormBloc.state.currentStep > 1
        ? StepState.complete
        : StepState.disabled,
    isActive: tournamentFormBloc.state.currentStep >= 1,
    title: Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: const [
        TextElement(
          text: 'Informations',
          color: colorTheme,
        ),
      ],
    ),
    content: SizedBox(
      // height: screenSize.height * 0.48,
      child: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          TextFieldForm(
            textFieldBloc: tournamentFormBloc.nameTournament,
            hintText: 'NOM DU TOURNOIS',
            textInputAction: TextInputAction.next,
          ),
          espaceEntreChamp,
          TextFieldForm(
            textFieldBloc: tournamentFormBloc.gameNumber,
            textInputType: TextInputType.number,
            hintText: 'NOMBRE DE GAME(S)',
            textInputAction: TextInputAction.next,
          ),
          espaceEntreChamp,
          const TextElement(
            text: 'Date début des inscriptions',
            color: Colors.white,
            textAlign: TextAlign.center,
          ),
          espaceEntreChamp,
          RowDatePick(
            inputFieldBloc: tournamentFormBloc.signCupDate,
            hintText: 'Date début des inscriptions',
          ),
          espaceEntreChamp,
          const TextElement(
            text: 'Date début du tournois',
            color: Colors.white,
            textAlign: TextAlign.center,
          ),
          espaceEntreChamp,
          RowDatePick(
            inputFieldBloc: tournamentFormBloc.startCupDate,
            hintText: 'Date début du tournois',
          ),
          espaceEntreChamp,
          const TextElement(
            text: 'Heure début du tournois',
            color: Colors.white,
            textAlign: TextAlign.center,
          ),
          espaceEntreChamp,
          TimePick(
            inputFieldBloc: tournamentFormBloc.startTime,
            hintText: 'Heure début',
          ),
          espaceEntreChamp,
          const TextElement(
            text: 'NOMBRE DE JOUEURS PAR EQUIPE',
            color: Colors.white,
            textAlign: TextAlign.center,
          ),
          espaceEntreChamp,
          RowNumberPlayerByTeam(
            inputFieldBloc: tournamentFormBloc.numberPlayerByTeam,
          ),
          espaceEntreChamp,
          TextFieldForm(
            textFieldBloc: tournamentFormBloc.numberTeam,
            hintText: "NOMBRE D'EQUIPES",
            textInputType: TextInputType.number,
            textInputAction: TextInputAction.done,
          ),
          espaceEntreChamp,
          DropdownServer(selectFieldBloc: tournamentFormBloc.server),
        ],
      ),
    ),
  );
}
