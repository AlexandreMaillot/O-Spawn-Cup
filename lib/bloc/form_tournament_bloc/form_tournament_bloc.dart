
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
import '../../models/validator/years.dart';

part "form_tournament_event.dart";
part "form_tournament_state.dart";

class FormTournamentBloc extends Bloc<FormTournamentEvent, FormTournamentState> {
  FormTournamentBloc() : super(FormTournamentState()) {
    on<FormTournamentNameCupChanged>(_onNameCupChanged);
    on<FormTournamentNumberRoundChanged>(_onNumberRoundChanged);
    on<FormTournamentDayChanged>(_onDayChanged);
    on<FormTournamentMonthChanged>(_onMonthChanged);
    on<FormTournamentYearsChanged>(_onYearsChanged);
    on<FormTournamentPlayerByTeamChanged>(_onPlayerByTeamChanged);
    on<FormTournamentServerTypeChanged>(_onServerTypeChanged);
    on<FormTournamentSubmitted>(_onSubmitted);
  }



  FutureOr<void> _onNameCupChanged(FormTournamentNameCupChanged event, Emitter<FormTournamentState> emit) {
    final nameCup = NameCup.dirty(event.nameCup);
    emit(state.copyWith(
      nameCup: nameCup,
      status: Formz.validate([state.numberRound,state.day,state.month,state.years,state.playerByTeam,state.serverType, nameCup,]),
    ));
  }

  FutureOr<void> _onNumberRoundChanged(FormTournamentNumberRoundChanged event, Emitter<FormTournamentState> emit) {
    final numberRound = NumberRound.dirty(event.numberRound);
    emit(state.copyWith(
      numberRound: numberRound,
      status: Formz.validate([numberRound,state.day,state.month,state.years,state.playerByTeam,state.serverType, state.nameCup,]),
    ));
  }

  FutureOr<void> _onDayChanged(FormTournamentDayChanged event, Emitter<FormTournamentState> emit) {
    final day = Day.dirty(event.day);
    emit(state.copyWith(
      day: day,
      status: Formz.validate([state.numberRound,day,state.month,state.years,state.playerByTeam,state.serverType, state.nameCup,]),
    ));
  }

  FutureOr<void> _onMonthChanged(FormTournamentMonthChanged event, Emitter<FormTournamentState> emit) {
    final month = Month.dirty(event.month);
    emit(state.copyWith(
      month: month,
      status: Formz.validate([state.numberRound,state.day,month,state.years,state.playerByTeam,state.serverType, state.nameCup,]),
    ));
  }

  FutureOr<void> _onYearsChanged(FormTournamentYearsChanged event, Emitter<FormTournamentState> emit) {
    final years = Years.dirty(event.years);
    emit(state.copyWith(
      years: years,
      status: Formz.validate([state.numberRound,state.day,state.month,years,state.playerByTeam,state.serverType, state.nameCup,]),
    ));
  }

  FutureOr<void> _onPlayerByTeamChanged(FormTournamentPlayerByTeamChanged event, Emitter<FormTournamentState> emit) {
    final playerByTeam = PlayerByTeam.dirty(event.playerByTeam);
    emit(state.copyWith(
      playerByTeam: playerByTeam,
      status: Formz.validate([state.numberRound,state.day,state.month,state.years,playerByTeam,state.serverType, state.nameCup,]),
    ));
  }

  FutureOr<void> _onServerTypeChanged(FormTournamentServerTypeChanged event, Emitter<FormTournamentState> emit) {
    final serverType = ServerType.dirty(event.serverType);
    emit(state.copyWith(
      serverType: serverType,
      status: Formz.validate([state.numberRound,state.day,state.month,state.years,state.playerByTeam,serverType, state.nameCup,]),
    ));
  }

  FutureOr<void> _onSubmitted(FormTournamentSubmitted event, Emitter<FormTournamentState> emit) {
  }
}
