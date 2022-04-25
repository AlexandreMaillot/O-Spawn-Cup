import 'package:equatable/equatable.dart';
import 'package:o_spawn_cup/models/TournamentType/tournament_type.dart';
import 'package:o_spawn_cup/models/tournament/tournament_state.dart';

class Filter extends Equatable {
  final String? name;
  final DateTime? dateStart;
  final TournamentState? tournamentState;
  final TournamentType? tournamentType;

  const Filter({
    this.name,
    this.dateStart,
    this.tournamentState,
    this.tournamentType,
  });

  @override
  List<Object?> get props => [name, dateStart, tournamentState, tournamentType];
}
