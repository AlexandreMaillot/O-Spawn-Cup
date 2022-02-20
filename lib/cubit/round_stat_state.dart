part of '../../cubit/round_stat_cubit.dart';

abstract class RoundStatState extends Equatable {
  int roundShow;

  RoundStatState(this.roundShow);
  @override
  List<Object> get props => [roundShow];
}

class RoundStatInitial extends RoundStatState {
  RoundStatInitial() : super(0);
}
class RoundStatChanged extends RoundStatState {
  RoundStatChanged(int roundShow) : super(roundShow);
}
