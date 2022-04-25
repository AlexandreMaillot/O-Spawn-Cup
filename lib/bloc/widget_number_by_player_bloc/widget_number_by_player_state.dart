part of 'widget_number_by_player_bloc.dart';

abstract class WidgetNumberByPlayerState extends Equatable {
  final int? indexSelect;
  const WidgetNumberByPlayerState({required this.indexSelect});
  @override
  List<int?> get props => [indexSelect];
}

class WidgetNumberByPlayerInitial extends WidgetNumberByPlayerState {
  const WidgetNumberByPlayerInitial(int? index) : super(indexSelect: index);
}

class WidgetNumberByPlayerAnimate extends WidgetNumberByPlayerState {
  const WidgetNumberByPlayerAnimate(int? index) : super(indexSelect: index);
}
