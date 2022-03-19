import "package:cloud_firestore/cloud_firestore.dart";
import "package:cloud_firestore_odm/cloud_firestore_odm.dart";
import 'package:equatable/equatable.dart';
import "package:json_annotation/json_annotation.dart";
import "package:o_spawn_cup/models/MemberTournament/member_tournament.dart";
import "package:o_spawn_cup/models/RangPointTournament/rang_point_tournament.dart";
import "package:o_spawn_cup/models/Team/team.dart";
import "package:o_spawn_cup/models/Tournament/tournament_state.dart";
import "package:o_spawn_cup/models/TournamentType/tournament_type.dart";
import "package:o_spawn_cup/models/server_type.dart";

import '../Member/member.dart';
import '../Round/round.dart';
import "../game_name.dart";
part "tournament.g.dart";

@JsonSerializable(explicitToJson: true)
class Tournament {
  @JsonKey(ignore: true)
  String? documentId;
  String name;

  DateTime? dateDebutTournois;
  DateTime? dateDebutInscription;
  GameName game;
  ServerType server;
  TournamentType tournamentType;
  int capacity;
  @JsonKey(fromJson: _fromJson)
  List<String>? cashPrize;
  @JsonKey(fromJson: _fromJson)
  List<String>? listCodesGames;
  int roundNumber;
  TournamentState state = TournamentState.inscriptionFermer;
  String? imageUrl;
  String? imageName;
  int killPointTournament;
  int? pointPerRangTournament;
  int? rangStartTournament;


  Tournament(
      {required this.name,
      required this.dateDebutTournois,
      required this.game,
      required this.server,
      required this.tournamentType,
      required this.capacity,
      required this.roundNumber,
      required this.dateDebutInscription,
      this.imageUrl,
      this.imageName,
      this.cashPrize = const<String>[],
      // required this.listRangPointTournament,
      required this.killPointTournament,
      required this.pointPerRangTournament,
      required this.rangStartTournament,
      required this.listCodesGames,
      }) {
  }

  factory Tournament.fromJson(Map<String, Object?> json) =>
      _$TournamentFromJson(json);

  Map<String, Object?> toJson() => _$TournamentToJson(this);

  static List<String> _fromJson(Iterable<dynamic> value) => List<String>.from(value);


}

@Collection<Tournament>("Tournament")
@Collection<Team>("Tournament/*/teams")
@Collection<Round>("Tournament/*/rounds")
@Collection<MemberTournament>("Tournament/*/teams/*/membersTournament",name: "membersTournament")
@Collection<Member>("Tournament/*/teams/*/membersTournament/*/member",name: "members")
final tournamentsRef = TournamentCollectionReference();
