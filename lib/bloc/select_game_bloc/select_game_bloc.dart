import "dart:async";

import "package:bloc/bloc.dart";
import "package:equatable/equatable.dart";
import "package:o_spawn_cup/models/card_game.dart";
import "package:o_spawn_cup/models/game_name.dart";
import 'package:o_spawn_cup/shared/widgets/tile_image_pre.dart';

import '../../constant.dart';

part "select_game_event.dart";
part "select_game_state.dart";

class SelectGameBloc extends Bloc<SelectGameEvent, SelectGameState> {
  List<CardGame> listGameName;
  double _index;
  SelectGameBloc({required this.listGameName,required double initialIndex}) : _index = initialIndex,
        super(SelectGameChanged(initialIndex)) {
    on<SelectGameloadList>(_loadGames);
    on<SelectGameChange>(_changeGameSelect);
  }


  FutureOr<void> _changeGameSelect(SelectGameChange event, Emitter<SelectGameState> emit) {
    if(event.indexSelect != -1) {
      _index = event.indexSelect;

      emit(SelectGameChanged(_index));
    }

  }

  FutureOr<void> _loadGames(SelectGameloadList event, Emitter<SelectGameState> emit) {
    if(listGameName.isEmpty) {
      emit(SelectGameNoData());
    } else {
      emit(SelectGameChanged(_index));
    }
  }

  List<TileImagePre> filteredImageByGame(){
    if(state == SelectGameChanged){
      return listImagePre.where((element) => element.gameName == listCardGame[(state as SelectGameChanged).index.toInt()].gameName).toList();
    } else {
      return [];
    }

  }
}
