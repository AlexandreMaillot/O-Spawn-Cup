import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:formz/formz.dart';

import '../../models/validator/gamerTag.dart';
import '../../models/validator/team_code.dart';

part 'sign_cup_event.dart';
part 'sign_cup_state.dart';

class SignCupBloc extends Bloc<SignCupEvent, SignCupState> {
  SignCupBloc() : super(SignCupState()) {
    on<SignCupGamerTagChanged>(_onGamerTagChanged);
    on<SignCupTeamCodeChanged>(_onTeamCodeChanged);
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
}
