part of 'round_stat_cubit.dart';

abstract class RoundStatState extends Equatable {
  final int roundShow;

  const RoundStatState(this.roundShow);
  @override
  List<Object> get props => [roundShow];
}

class RoundStatInitial extends RoundStatState {
  const RoundStatInitial() : super(0);
}

class RoundStatChanged extends RoundStatState {
  const RoundStatChanged(int roundShow) : super(roundShow);
}
