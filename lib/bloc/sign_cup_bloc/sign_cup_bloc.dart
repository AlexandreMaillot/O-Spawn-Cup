import "dart:async";

import "package:bloc/bloc.dart";
import "package:equatable/equatable.dart";
import "package:formz/formz.dart";

import '../../cubit/team_firestore/team_firestore_cubit.dart';
import "../../models/validator/gamerTag.dart";
import "../../models/validator/team_code.dart";

part "sign_cup_event.dart";
part "sign_cup_state.dart";

class SignCupBloc extends Bloc<SignCupEvent, SignCupState> {
  SignCupBloc() : super(SignCupState()) {
    on<SignCupGamerTagChanged>(_onGamerTagChanged);
    on<SignCupTeamCodeChanged>(_onTeamCodeChanged);
    on<SignCupSubmitted>(_onSubmitted);
  }
  FutureOr<void> _onGamerTagChanged(SignCupGamerTagChanged event, Emitter<SignCupState> emit) {
    final gamerTag = GamerTag.dirty(event.gamerTag);
    emit(state.copyWith(
      gamerTag: gamerTag,
      status: Formz.validate([gamerTag,state.teamCode]),
    ));
  }

  FutureOr<void> _onTeamCodeChanged(SignCupTeamCodeChanged event, Emitter<SignCupState> emit) {
    final teamCode = TeamCode.dirty(event.teamCode);
    emit(state.copyWith(
      teamCode: teamCode,
      status: Formz.validate([state.gamerTag,teamCode,]),
    ));
  }

  FutureOr<void> _onSubmitted(event, Emitter<SignCupState> emit) {
    print(state.gamerTag.value);
    print(state.gamerTag.valid);
    print(state.teamCode.valid);

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
