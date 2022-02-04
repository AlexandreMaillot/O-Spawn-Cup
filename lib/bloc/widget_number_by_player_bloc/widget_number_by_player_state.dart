part of 'widget_number_by_player_bloc.dart';

abstract class WidgetNumberByPlayerState extends Equatable {
  int? indexSelect;
  WidgetNumberByPlayerState({required this.indexSelect});
  @override
  List<int?> get props => [indexSelect];
}

class WidgetNumberByPlayerInitial extends WidgetNumberByPlayerState {
  WidgetNumberByPlayerInitial(int? index) : super(indexSelect: index);
}
