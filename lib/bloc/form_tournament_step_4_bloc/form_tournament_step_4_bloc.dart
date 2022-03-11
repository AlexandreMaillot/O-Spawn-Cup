
import "dart:async";
import 'dart:io';

import "package:bloc/bloc.dart";
import "package:equatable/equatable.dart";
import "package:formz/formz.dart";
import "package:o_spawn_cup/models/validator/point_per_kill.dart";

import '../../models/validator/cash_prize.dart';
import '../../models/validator/image_cup.dart';


part "form_tournament_step_4_event.dart";
part "form_tournament_step_4_state.dart";

class FormTournamentStep4Bloc extends Bloc<FormTournamentEventStep4, FormTournamentStep4State> {
  FormTournamentStep4Bloc() : super(FormTournamentStep4State()) {
    on<FormTournamentImageCupChanged>(_onImageCupChanged);
    on<FormTournamentSubmitted4>(_onSubmittedStep4);
  }




  FutureOr<void> _onImageCupChanged(FormTournamentImageCupChanged event, Emitter<FormTournamentStep4State> emit) {
    final imageCup = ImageCup.dirty(event.imageCup);
    emit(state.copyWith(
      imageCup: imageCup,
      status: Formz.validate([imageCup]),
    ));
  }




  FutureOr<void> _onSubmittedStep4(FormTournamentSubmitted4 event, Emitter<dynamic> emit) {
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
