part of 'tournament_bloc.dart';

abstract class TournamentEvent extends Equatable {
  const TournamentEvent();
  @override
  List<Object?> get props => [];
}
class TournamentInitialisation extends TournamentEvent{}
class TournamentLoad extends TournamentEvent{}

class TournamentFilter extends TournamentEvent{}