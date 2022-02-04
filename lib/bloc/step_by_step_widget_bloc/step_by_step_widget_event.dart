part of 'step_by_step_widget_bloc.dart';

abstract class StepByStepWidgetEvent extends Equatable {
  const StepByStepWidgetEvent();
  @override
  List<Object?> get props => [];
}
class StepByStepWidgetInitialisation extends StepByStepWidgetEvent {}
class StepByStepWidgetContinue extends StepByStepWidgetEvent {}
class StepByStepWidgetCancel extends StepByStepWidgetEvent {}
class StepByStepWidgetByTap extends StepByStepWidgetEvent {
  final int indexTap;
  StepByStepWidgetByTap({required this.indexTap});
  @override
  List<Object?> get props => [indexTap];
}
