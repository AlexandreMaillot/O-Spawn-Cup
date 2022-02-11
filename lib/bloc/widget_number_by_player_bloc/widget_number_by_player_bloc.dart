import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'widget_number_by_player_event.dart';
part 'widget_number_by_player_state.dart';

class WidgetNumberByPlayerBloc extends Bloc<WidgetNumberByPlayerEvent, WidgetNumberByPlayerState> {
  int? indexSelected;
  WidgetNumberByPlayerBloc() : super(WidgetNumberByPlayerInitial(null)) {
    on<WidgetNumberByPlayerChanging>(_changeIndexSelect);
    on<WidgetNumberByPlayerAnimating>(_animatedOn);
  }

  FutureOr<void> _changeIndexSelect(WidgetNumberByPlayerChanging event, Emitter<WidgetNumberByPlayerState> emit) {
    int? index = event.indexSelect;
    if(indexSelected == index){
      index = null;
    }
    indexSelected = index;
    emit(WidgetNumberByPlayerInitial(indexSelected));
  }


  Future<FutureOr<void>> _animatedOn(WidgetNumberByPlayerAnimating event, Emitter<WidgetNumberByPlayerState> emit) async {
    emit(WidgetNumberByPlayerAnimate(indexSelected));
    await Future.delayed(const Duration(milliseconds: 500), () {
    });
    emit(WidgetNumberByPlayerInitial(indexSelected));
  }
}
