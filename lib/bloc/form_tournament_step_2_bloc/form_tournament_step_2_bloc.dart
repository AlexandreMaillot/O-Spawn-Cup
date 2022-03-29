
import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:formz/formz.dart';
import 'package:o_spawn_cup/models/validator/name_cup.dart';
import 'package:o_spawn_cup/models/validator/number_round.dart';
import 'package:o_spawn_cup/models/validator/player_by_team.dart';
import 'package:o_spawn_cup/models/validator/server_type.dart';

import '../../models/validator/day.dart';
import '../../models/validator/hours.dart';
import '../../models/validator/month.dart';
import '../../models/validator/number_team.dart';
import '../../models/validator/years.dart';

part 'form_tournament_step_2_event.dart';
part 'form_tournament_step_2_state.dart';

class FormTournamentStep2Bloc extends Bloc<FormTournamentEventStep2, FormTournamentStep2State> {
  FormTournamentStep2Bloc() : super(FormTournamentStep2State()) {
    on<FormTournamentNameCupChanged>(_onNameCupChanged);
    on<FormTournamentNumberRoundChanged>(_onNumberRoundChanged);
    on<FormTournamentDaySignChanged>(_onDaySignChanged);
    on<FormTournamentMonthSignChanged>(_onMonthSignChanged);
    on<FormTournamentYearsSignChanged>(_onYearsSignChanged);
    on<FormTournamentDayStartChanged>(_onDayStartChanged);
    on<FormTournamentMonthStartChanged>(_onMonthStartChanged);
    on<FormTournamentYearsStartChanged>(_onYearsStartChanged);
    on<FormTournamentHoursStartChanged>(_onHoursStartChanged);
    on<FormTournamentPlayerByTeamChanged>(_onPlayerByTeamChanged);
    on<FormTournamentServerTypeChanged>(_onServerTypeChanged);
    on<FormTournamentNumberTeamChanged>(_onNumberTeamChanged);
    on<FormTournamentSubmitted2>(_onSubmittedStep2);
  }



  FutureOr<void> _onNameCupChanged(FormTournamentNameCupChanged event, Emitter<FormTournamentStep2State> emit) {
    final nameCup = NameCup.dirty(event.nameCup);
    emit(state.copyWith(
      nameCup: nameCup,
      status: Formz.validate([state.numberRound,state.daySign,state.monthSign,state.yearsSign,state.playerByTeam,state.serverType, nameCup,state.numberTeam]),
    ));
  }

  FutureOr<void> _onNumberRoundChanged(FormTournamentNumberRoundChanged event, Emitter<FormTournamentStep2State> emit) {

      final numberRound = NumberRound.dirty(event.numberRound);
      emit(state.copyWith(
        numberRound: numberRound,
        status: Formz.validate([numberRound,state.daySign,state.monthSign,state.yearsSign,state.dayStart,state.monthStart,state.yearsStart,state.hoursStart,state.playerByTeam,state.serverType, state.nameCup,state.numberTeam,]),
      ));

  }
  FutureOr<void> _onNumberTeamChanged(FormTournamentNumberTeamChanged event, Emitter<FormTournamentStep2State> emit) {
    final numberTeam = NumberTeam.dirty(event.numberTeam);
    emit(state.copyWith(
      numberTeam: numberTeam,
      status: Formz.validate([state.numberRound,state.daySign,state.monthSign,state.yearsSign,state.playerByTeam,state.serverType, state.nameCup,numberTeam]),
    ));
  }

  FutureOr<void> _onDaySignChanged(FormTournamentDaySignChanged event, Emitter<FormTournamentStep2State> emit) {
    final daySign = Day.dirty(event.daySign);
    emit(state.copyWith(
      daySign: daySign,
      status: Formz.validate([state.numberRound,daySign,state.monthSign,state.yearsSign,state.dayStart,state.monthStart,state.yearsStart,state.hoursStart,state.playerByTeam,state.serverType, state.nameCup,state.numberTeam]),
    ));
  }

  FutureOr<void> _onMonthSignChanged(FormTournamentMonthSignChanged event, Emitter<FormTournamentStep2State> emit) {
    final monthSign = Month.dirty(event.monthSign);
    emit(state.copyWith(
      monthSign: monthSign,
      status: Formz.validate([state.numberRound,state.daySign,monthSign,state.yearsSign,state.dayStart,state.monthStart,state.yearsStart,state.hoursStart,state.playerByTeam,state.serverType, state.nameCup,state.numberTeam]),
    ));
  }

  FutureOr<void> _onYearsSignChanged(FormTournamentYearsSignChanged event, Emitter<FormTournamentStep2State> emit) {
    final yearsSign = Years.dirty(event.yearsSign);
    emit(state.copyWith(
      yearsSign: yearsSign,
      status: Formz.validate([state.numberRound,state.daySign,state.monthSign,yearsSign,state.dayStart,state.monthStart,state.yearsStart,state.hoursStart,state.playerByTeam,state.serverType, state.nameCup,state.numberTeam]),
    ));
  }
  FutureOr<void> _onDayStartChanged(FormTournamentDayStartChanged event, Emitter<FormTournamentStep2State> emit) {
    final dayStart = Day.dirty(event.dayStart);
    emit(state.copyWith(
      dayStart: dayStart,
      status: Formz.validate([state.numberRound,state.daySign,state.monthSign,state.yearsSign,dayStart,state.monthStart,state.yearsStart,state.hoursStart,state.playerByTeam,state.serverType, state.nameCup,state.numberTeam]),
    ));
  }

  FutureOr<void> _onMonthStartChanged(FormTournamentMonthStartChanged event, Emitter<FormTournamentStep2State> emit) {
    final monthStart = Month.dirty(event.monthStart);
    emit(state.copyWith(
      monthStart: monthStart,
      status: Formz.validate([state.numberRound,state.daySign,state.monthSign,state.yearsSign,state.dayStart,monthStart,state.yearsStart,state.hoursStart,state.playerByTeam,state.serverType, state.nameCup,state.numberTeam]),
    ));
  }

  FutureOr<void> _onYearsStartChanged(FormTournamentYearsStartChanged event, Emitter<FormTournamentStep2State> emit) {
    final yearsStart = Years.dirty(event.yearsStart);
    emit(state.copyWith(
      yearsStart: yearsStart,
      status: Formz.validate([state.numberRound,state.daySign,state.monthSign,state.yearsSign,state.dayStart,state.monthStart,yearsStart,state.hoursStart,state.playerByTeam,state.serverType, state.nameCup,state.numberTeam]),
    ));
  }
  FutureOr<void> _onHoursStartChanged(FormTournamentHoursStartChanged event, Emitter<FormTournamentStep2State> emit) {
    final hoursStart = Hours.dirty(event.hoursStart);
    emit(state.copyWith(
      hoursStart: hoursStart,
      status: Formz.validate([state.numberRound,state.daySign,state.monthSign,state.yearsSign,state.dayStart,state.monthStart,state.yearsStart,hoursStart,state.playerByTeam,state.serverType, state.nameCup,state.numberTeam]),
    ));
  }
  FutureOr<void> _onPlayerByTeamChanged(FormTournamentPlayerByTeamChanged event, Emitter<FormTournamentStep2State> emit) {
    var playerByTeam = PlayerByTeam.dirty(event.playerByTeam);
    emit(state.copyWith(
      playerByTeam: playerByTeam,
      status: Formz.validate([playerByTeam,state.daySign,state.monthSign,state.yearsSign,playerByTeam,state.dayStart,state.monthStart,state.yearsStart,state.hoursStart,state.serverType, state.nameCup,state.numberTeam]),
    ));
  }

  FutureOr<void> _onServerTypeChanged(FormTournamentServerTypeChanged event, Emitter<FormTournamentStep2State> emit) {
    final serverType = ServerType.dirty(event.serverType);
    emit(state.copyWith(
      serverType: serverType,
      status: Formz.validate([state.numberRound,state.daySign,state.monthSign,state.yearsSign,state.dayStart,state.monthStart,state.yearsStart,state.hoursStart,state.playerByTeam,serverType, state.nameCup,state.numberTeam]),
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
