
import 'dart:async';

import "package:bloc/bloc.dart";
import "package:equatable/equatable.dart";
import 'package:formz/formz.dart';
import 'package:o_spawn_cup/models/validator/name_cup.dart';
import 'package:o_spawn_cup/models/validator/number_round.dart';
import 'package:o_spawn_cup/models/validator/player_by_team.dart';
import 'package:o_spawn_cup/models/validator/server_type.dart';

import '../../models/validator/day.dart';
import '../../models/validator/month.dart';
import '../../models/validator/number_team.dart';
import '../../models/validator/years.dart';

part "form_tournament_step_3_event.dart";
part "form_tournament_step_3_state.dart";

class FormTournamentStep3Bloc extends Bloc<FormTournamentEventStep3, FormTournamentStep3State> {
  FormTournamentStep3Bloc() : super(FormTournamentStep3State()) {
    on<FormTournamentNameCupChanged>(_onNameCupChanged);

    on<FormTournamentSubmitted3>(_onSubmittedStep3);
  }



  FutureOr<void> _onNameCupChanged(FormTournamentNameCupChanged event, Emitter<FormTournamentStep3State> emit) {
    final nameCup = NameCup.dirty(event.nameCup);
    emit(state.copyWith(
      nameCup: nameCup,
      status: Formz.validate([state.numberRound,state.day,state.month,state.years,state.playerByTeam,state.serverType, nameCup,state.numberTeam]),
    ));
  }


  FutureOr<void> _onSubmittedStep3(FormTournamentSubmitted3 event, Emitter<FormTournamentStep3State> emit) async {
    if (state.status.isValidated) {
      emit(state.copyWith(status: FormzStatus.submissionInProgress));

      try {
        emit(state.copyWith(status: FormzStatus.submissionSuccess));
      } catch (_) {
        emit(state.copyWith(status: FormzStatus.submissionFailure));
      }
    }
  }



}
