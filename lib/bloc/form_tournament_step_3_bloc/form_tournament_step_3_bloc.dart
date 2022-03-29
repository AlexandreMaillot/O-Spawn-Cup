
import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:formz/formz.dart';
import 'package:o_spawn_cup/models/validator/point_per_kill.dart';
import 'package:o_spawn_cup/models/validator/point_per_rang.dart';
import 'package:o_spawn_cup/models/validator/start_rang.dart';


part 'form_tournament_step_3_event.dart';
part 'form_tournament_step_3_state.dart';

class FormTournamentStep3Bloc extends Bloc<FormTournamentEventStep3, FormTournamentStep3State> {
  FormTournamentStep3Bloc() : super(FormTournamentStep3State()) {
    on<FormTournamentPointPerKillChanged>(_onPointPerKillChanged);
    on<FormTournamentPointPerRangChanged>(_onPointPerRangChanged);
    on<FormTournamentStartRangChanged>(_onStartRangChanged);

    on<FormTournamentSubmitted3>(_onSubmittedStep3);
  }

  FutureOr<void> _onPointPerKillChanged(FormTournamentPointPerKillChanged event, Emitter<FormTournamentStep3State> emit) {
    final pointPerKill = PointPerKill.dirty(event.pointPerKill);
    emit(state.copyWith(
      pointPerKill: pointPerKill,
      status: Formz.validate([pointPerKill,state.pointPerRang,state.startRang,]),
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







  FutureOr<void> _onPointPerRangChanged(FormTournamentPointPerRangChanged event, Emitter<FormTournamentStep3State> emit) {
    final pointPerRang = PointPerRang.dirty(event.pointPerRang);
    emit(state.copyWith(
      pointPerRang: pointPerRang,
      status: Formz.validate([state.pointPerKill,pointPerRang,state.startRang,]),
    ));
  }

  FutureOr<void> _onStartRangChanged(FormTournamentStartRangChanged event, Emitter<FormTournamentStep3State> emit) {
    final startRang = StartRang.dirty(event.startRang);
    emit(state.copyWith(
      startRang: startRang,
      status: Formz.validate([state.pointPerKill,state.pointPerRang,startRang,]),
    ));
  }
}
