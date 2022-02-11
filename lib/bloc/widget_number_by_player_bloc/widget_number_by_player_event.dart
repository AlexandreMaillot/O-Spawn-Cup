part of 'widget_number_by_player_bloc.dart';

abstract class WidgetNumberByPlayerEvent extends Equatable {
  const WidgetNumberByPlayerEvent();
  @override
  List<Object?> get props => [];
}

class WidgetNumberByPlayerChanging extends WidgetNumberByPlayerEvent {
  int? indexSelect;
  WidgetNumberByPlayerChanging({required this.indexSelect});
  @override
  List<Object?> get props => [indexSelect];
}
class WidgetNumberByPlayerAnimating extends WidgetNumberByPlayerEvent {

}