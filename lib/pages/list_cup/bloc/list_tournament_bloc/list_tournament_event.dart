part of 'list_tournament_bloc.dart';

abstract class ListTournamentEvent extends Equatable {
  ListTournamentEvent();
  @override
  List<Object?> get props => [];
}
class TournamentInitialisation extends ListTournamentEvent{
  GameName gameName;
  TournamentInitialisation({required this.gameName});
}
class TournamentLoad extends ListTournamentEvent{

}

class TournamentFilter extends ListTournamentEvent{
  String day;
  String month;
  String year;
  TournamentType? tournamentType;
  String name;
  TournamentState? tournamentState;
  TournamentFilter({required this.day,required this.month,required this.year,required this.tournamentType,required this.tournamentState,required this.name});
}