part of 'step_by_step_widget_bloc.dart';

abstract class StepByStepWidgetState extends Equatable {
  final int indexCurrent;
  const StepByStepWidgetState({required this.indexCurrent});
  @override
  List<int> get props => [indexCurrent];
}

class StepByStepWidgetInitial extends StepByStepWidgetState {
  const StepByStepWidgetInitial(int initialIndex)
      : super(indexCurrent: initialIndex);
  @override
  List<int> get props => [indexCurrent];
}

class StepByStepWidgetChanged extends StepByStepWidgetState {
  const StepByStepWidgetChanged(int index) : super(indexCurrent: index);
  @override
  List<int> get props => [indexCurrent];
}
