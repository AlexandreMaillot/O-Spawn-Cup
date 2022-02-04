part of 'select_game_bloc.dart';

abstract class SelectGameEvent extends Equatable {
  const SelectGameEvent();
  @override
  List<Object?> get props => [];
}

class SelectGameInit extends SelectGameEvent {}

class SelectGameChange extends SelectGameEvent {
  final double indexSelect;
  SelectGameChange({required this.indexSelect});
  @override
  List<Object> get props => [indexSelect];
}
