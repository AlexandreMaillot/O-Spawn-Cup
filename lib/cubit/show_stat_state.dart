part of 'show_stat_cubit.dart';

abstract class ShowStatState extends Equatable {
  bool globalStat = true;
  ShowStatState(this.globalStat);
  @override
  List<Object> get props => [globalStat];
}
class ShowStatInitial extends ShowStatState {
  ShowStatInitial() : super(true);
}
class ShowStatChanged extends ShowStatState {
  ShowStatChanged(bool globalStat) : super(globalStat);
}
