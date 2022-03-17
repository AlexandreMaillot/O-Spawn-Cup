part of 'list_tournament_bloc.dart';


abstract class ListTournamentState extends Equatable {
  ListTournamentState();
  @override
  List<Object?> get props => [];
}

class TournamentInit extends ListTournamentState {


}
class TournamentLoading extends ListTournamentState {

}
class TournamentError extends ListTournamentState {

}

class TournamentLoaded extends ListTournamentState {
  final List<Tournament> tournaments;
  TournamentLoaded({this.tournaments = const <Tournament>[]});
  @override
  List<Object?> get props => [tournaments];
}