part of 'select_game_bloc.dart';

abstract class SelectGameState extends Equatable {
  const SelectGameState();
  @override
  List<Object> get props => [];
}

class SelectGameInitial extends SelectGameState {
  final double index;
  const SelectGameInitial(this.index);
  @override
  List<Object> get props => [index];
}

class SelectGameNoData extends SelectGameState {}

class SelectGameError extends SelectGameState {}

class SelectGameImageFiltred extends SelectGameState {}

class SelectGameChanged extends SelectGameState {
  final double index;
  const SelectGameChanged(this.index);
  @override
  List<Object> get props => [index];
}
