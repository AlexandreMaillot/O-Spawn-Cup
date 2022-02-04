part of 'step_by_step_widget_bloc.dart';

abstract class StepByStepWidgetState extends Equatable {
  final int indexCurrent;
  const StepByStepWidgetState({required this.indexCurrent});
  @override
  List<Object> get props => [indexCurrent];
}

class StepByStepWidgetInitial extends StepByStepWidgetState {
  StepByStepWidgetInitial(int initialIndex) : super(indexCurrent: initialIndex);
}
class StepByStepWidgetChanged extends StepByStepWidgetState {
  StepByStepWidgetChanged(int index) : super(indexCurrent: index);
}
