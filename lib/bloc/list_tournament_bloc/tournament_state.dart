part of 'tournament_bloc.dart';


abstract class TournamentState extends Equatable {
  const TournamentState();
  @override
  List<Object?> get props => [];
}

class TournamentInit extends TournamentState {}
class TournamentLoading extends TournamentState {}
class TournamentError extends TournamentState {}

class TournamentLoaded extends TournamentState {
  final List<Tournament> tournaments;
  const TournamentLoaded({this.tournaments = const <Tournament>[]});
  @override
  List<Object?> get props => [tournaments];
}