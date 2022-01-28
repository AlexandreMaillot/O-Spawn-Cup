import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cloud_firestore_odm/cloud_firestore_odm.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:o_spawn_cup/models/MemberTournament/member_tournament.dart';
import 'package:o_spawn_cup/models/RangPointTournament/rang_point_tournament.dart';
import 'package:o_spawn_cup/models/Team/team.dart';
import 'package:o_spawn_cup/models/Tournament/tournament_state.dart';
import 'package:o_spawn_cup/models/TournamentType/tournament_type.dart';
import 'package:o_spawn_cup/models/server_type.dart';

import '../game_name.dart';
part 'tournament.g.dart';

@JsonSerializable(explicitToJson: true)
class Tournament {
  String? documentId;
  String name;
  int date;
  GameName game;
  ServerType server;
  TournamentType tournamentType;
  int capacity;
  String cashPrize;
  int roundNumber;
  TournamentState state = TournamentState.inscriptionFermer;
  String? image;
  // List<RangPointTournament> listRangPointTournament;
  int killPointTournament;
  List<Team> listTeam = [];

  Tournament(
      {required this.name,
      required this.date,
      required this.game,
      required this.server,
      required this.tournamentType,
      required this.capacity,
      required this.cashPrize,
      required this.roundNumber,
      // required this.listRangPointTournament,
      required this.killPointTournament,}) {
  }

  factory Tournament.fromJson(Map<String, dynamic> json) =>
      _$TournamentFromJson(json);

  Map<String, dynamic> toJson() => _$TournamentToJson(this);
}

@Collection<Tournament>('Tournament')
@Collection<Team>('Tournament/*/listTeam')
final tournamentsRef = TournamentCollectionReference();
