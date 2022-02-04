import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'widget_number_by_player_event.dart';
part 'widget_number_by_player_state.dart';

class WidgetNumberByPlayerBloc extends Bloc<WidgetNumberByPlayerEvent, WidgetNumberByPlayerState> {
  int? indexSelected;
  WidgetNumberByPlayerBloc() : super(WidgetNumberByPlayerInitial(null)) {
    on<WidgetNumberByPlayerChanging>(_changeIndexSelect);
  }

  FutureOr<void> _changeIndexSelect(WidgetNumberByPlayerChanging event, Emitter<WidgetNumberByPlayerState> emit) {
    int? index = event.indexSelect;
    if(indexSelected == index){
      index = null;
    }
    indexSelected = index;
    emit(WidgetNumberByPlayerInitial(indexSelected));
  }
}
