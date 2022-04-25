import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'round_stat_state.dart';

class RoundStatCubit extends Cubit<RoundStatState> {
  int roundMax;
  RoundStatCubit({required this.roundMax}) : super(const RoundStatInitial());

  void changeTabContinue() {
    if (state.roundShow == 0) {
      emit(RoundStatChanged(roundMax - 1));
    } else {
      emit(RoundStatChanged(state.roundShow - 1));
    }
  }

  void changeTabCancel() {
    if (state.roundShow == roundMax - 1) {
      emit(const RoundStatChanged(0));
    } else {
      emit(RoundStatChanged(state.roundShow + 1));
    }
  }

  void changeTabOnTap(int index) {
    // TODO(Tamarok): Change tab on tap.
  }
}
