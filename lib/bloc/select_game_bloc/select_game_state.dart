part of 'select_game_bloc.dart';

abstract class SelectGameState extends Equatable {
  final double index;
  const SelectGameState({required this.index});
  @override
  List<Object> get props => [index];
}

class SelectGameInitial extends SelectGameState {
  SelectGameInitial(double index) : super(index: index);
  @override
  List<Object> get props => [index];
}
class SelectGameNoData extends SelectGameState {
  SelectGameNoData() : super(index: 0);

}
class SelectGameError extends SelectGameState {
  SelectGameError() : super(index: 0);
}
class SelectGameImageFiltred extends SelectGameState {
  SelectGameImageFiltred() : super(index: 0);
}
class SelectGameChanged extends SelectGameState {
  SelectGameChanged(double index) : super(index: index);
  @override
  List<Object> get props => [index];
}

