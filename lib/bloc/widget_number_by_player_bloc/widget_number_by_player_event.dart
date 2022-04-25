part of 'widget_number_by_player_bloc.dart';

abstract class WidgetNumberByPlayerEvent extends Equatable {
  const WidgetNumberByPlayerEvent();
  @override
  List<Object?> get props => [];
}

class WidgetNumberByPlayerChanging extends WidgetNumberByPlayerEvent {
  final int? indexSelect;
  const WidgetNumberByPlayerChanging({required this.indexSelect});
  @override
  List<int?> get props => [indexSelect];
}

class WidgetNumberByPlayerAnimating extends WidgetNumberByPlayerEvent {}
