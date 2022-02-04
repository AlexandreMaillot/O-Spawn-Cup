import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'step_by_step_widget_event.dart';
part 'step_by_step_widget_state.dart';

class StepByStepWidgetBloc extends Bloc<StepByStepWidgetEvent, StepByStepWidgetState> {
  int _currentIndex = 0;

  StepByStepWidgetBloc({required int initialIndex}) : _currentIndex = initialIndex,
  super(StepByStepWidgetInitial(initialIndex)) {
    on<StepByStepWidgetEvent>((event, emit) {});
    on<StepByStepWidgetContinue>(_changeStepContinue);
    on<StepByStepWidgetCancel>(_changeStepCancel);
    on<StepByStepWidgetByTap>(_changeStepByTap);
  }

  FutureOr<void> _changeStepContinue(StepByStepWidgetContinue event, Emitter<StepByStepWidgetState> emit) {
    if(_currentIndex < 4){
      _currentIndex++;
      emit(StepByStepWidgetChanged(_currentIndex));
    }
  }

  FutureOr<void> _changeStepCancel(StepByStepWidgetCancel event, Emitter<StepByStepWidgetState> emit) {
    if(_currentIndex > 0) {
      _currentIndex--;
      emit(StepByStepWidgetChanged(_currentIndex));
    }
  }

  FutureOr<void> _changeStepByTap(StepByStepWidgetByTap event, Emitter<StepByStepWidgetState> emit) {
    _currentIndex = event.indexTap;
    emit(StepByStepWidgetChanged(_currentIndex));
  }
}