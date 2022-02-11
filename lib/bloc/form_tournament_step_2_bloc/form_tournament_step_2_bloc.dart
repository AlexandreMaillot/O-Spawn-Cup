
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

part "form_tournament_step_2_event.dart";
part "form_tournament_step_2_state.dart";

class FormTournamentStep2Bloc extends Bloc<FormTournamentEventStep2, FormTournamentStep2State> {
  FormTournamentStep2Bloc() : super(FormTournamentStep2State()) {
    on<FormTournamentNameCupChanged>(_onNameCupChanged);
    on<FormTournamentNumberRoundChanged>(_onNumberRoundChanged);
    on<FormTournamentDayChanged>(_onDayChanged);
    on<FormTournamentMonthChanged>(_onMonthChanged);
    on<FormTournamentYearsChanged>(_onYearsChanged);
    on<FormTournamentPlayerByTeamChanged>(_onPlayerByTeamChanged);
    on<FormTournamentServerTypeChanged>(_onServerTypeChanged);
    on<FormTournamentNumberTeamChanged>(_onNumberTeamChanged);
    // on<FormTournamentSubmitted1>(_onSubmittedStep1);
    on<FormTournamentSubmitted2>(_onSubmittedStep2);
  }



  FutureOr<void> _onNameCupChanged(FormTournamentNameCupChanged event, Emitter<FormTournamentStep2State> emit) {
    final nameCup = NameCup.dirty(event.nameCup);
    emit(state.copyWith(
      nameCup: nameCup,
      status: Formz.validate([state.numberRound,state.day,state.month,state.years,state.playerByTeam,state.serverType, nameCup,state.numberTeam]),
    ));
  }

  FutureOr<void> _onNumberRoundChanged(FormTournamentNumberRoundChanged event, Emitter<FormTournamentStep2State> emit) {

      final numberRound = NumberRound.dirty(event.numberRound);
      emit(state.copyWith(
        numberRound: numberRound,
        status: Formz.validate([numberRound,state.day,state.month,state.years,state.playerByTeam,state.serverType, state.nameCup,state.numberTeam]),
      ));

  }
  FutureOr<void> _onNumberTeamChanged(FormTournamentNumberTeamChanged event, Emitter<FormTournamentStep2State> emit) {
    final numberTeam = NumberTeam.dirty(event.numberTeam);
    emit(state.copyWith(
      numberTeam: numberTeam,
      status: Formz.validate([state.numberRound,state.day,state.month,state.years,state.playerByTeam,state.serverType, state.nameCup,numberTeam]),
    ));
  }

  FutureOr<void> _onDayChanged(FormTournamentDayChanged event, Emitter<FormTournamentStep2State> emit) {
    final day = Day.dirty(event.day);
    emit(state.copyWith(
      day: day,
      status: Formz.validate([state.numberRound,day,state.month,state.years,state.playerByTeam,state.serverType, state.nameCup,state.numberTeam]),
    ));
  }

  FutureOr<void> _onMonthChanged(FormTournamentMonthChanged event, Emitter<FormTournamentStep2State> emit) {
    final month = Month.dirty(event.month);
    emit(state.copyWith(
      month: month,
      status: Formz.validate([state.numberRound,state.day,month,state.years,state.playerByTeam,state.serverType, state.nameCup,state.numberTeam]),
    ));
  }

  FutureOr<void> _onYearsChanged(FormTournamentYearsChanged event, Emitter<FormTournamentStep2State> emit) {
    final years = Years.dirty(event.years);
    emit(state.copyWith(
      years: years,
      status: Formz.validate([state.numberRound,state.day,state.month,years,state.playerByTeam,state.serverType, state.nameCup,state.numberTeam]),
    ));
  }

  FutureOr<void> _onPlayerByTeamChanged(FormTournamentPlayerByTeamChanged event, Emitter<FormTournamentStep2State> emit) {
    final playerByTeam = PlayerByTeam.dirty(event.playerByTeam);
    emit(state.copyWith(
      playerByTeam: playerByTeam,
      status: Formz.validate([state.numberRound,state.day,state.month,state.years,playerByTeam,state.serverType, state.nameCup,state.numberTeam]),
    ));
  }

  FutureOr<void> _onServerTypeChanged(FormTournamentServerTypeChanged event, Emitter<FormTournamentStep2State> emit) {
    final serverType = ServerType.dirty(event.serverType);
    emit(state.copyWith(
      serverType: serverType,
      status: Formz.validate([state.numberRound,state.day,state.month,state.years,state.playerByTeam,serverType, state.nameCup,state.numberTeam]),
    ));
  }

  FutureOr<void> _onSubmittedStep2(FormTournamentSubmitted2 event, Emitter<FormTournamentStep2State> emit) async {
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
