import "dart:async";

import "package:bloc/bloc.dart";
import "package:equatable/equatable.dart";
import "package:o_spawn_cup/models/card_game.dart";
import "package:o_spawn_cup/models/game_name.dart";

part "select_game_event.dart";
part "select_game_state.dart";

class SelectGameBloc extends Bloc<SelectGameEvent, SelectGameState> {
  List<CardGame> listGameName;
  double _index;
  SelectGameBloc({required this.listGameName,required double initialIndex}) : _index = initialIndex,
        super(SelectGameInitial(initialIndex)) {
    on<SelectGameInit>(_initSelector);
    on<SelectGameChange>(_changeGameSelect);
  }




  FutureOr<void> _changeGameSelect(SelectGameChange event, Emitter<SelectGameState> emit) {
    _index = event.indexSelect;

    emit(SelectGameChanged(_index));
  }

  FutureOr<void> _initSelector(SelectGameInit event, Emitter<SelectGameState> emit) {
    if(listGameName.isEmpty) {
      emit(SelectGameNoData());
    }
  }
}
