import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cloud_firestore_odm/cloud_firestore_odm.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:o_spawn_cup/model/RangPointTournament/rang_point_tournament.dart';
import 'package:o_spawn_cup/model/Team/team.dart';
import 'package:o_spawn_cup/model/Tournament/tournament_state.dart';
import 'package:o_spawn_cup/model/TournamentType/tournament_type.dart';
import 'package:o_spawn_cup/model/server_type.dart';

import '../game_name.dart';
part 'tournament.g.dart';

@JsonSerializable()
class Tournament {
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
  List<Team>? listTeam;

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
  Map<String, dynamic> _$TournamentToJson(Tournament instance) =>

      <String, dynamic>{
        'name': instance.name,
        'date': instance.date,
        'game': _$GameNameEnumMap[instance.game],
        'server': _$ServerTypeEnumMap[instance.server],
        'tournamentType': instance.tournamentType.toJson(),
        'capacity': instance.capacity,
        'cashPrize': instance.cashPrize,
        'roundNumber': instance.roundNumber,
        'state': _$TournamentStateEnumMap[instance.state],
        'image': instance.image,
        'killPointTournament': instance.killPointTournament,
        'listTeam': instance.listTeam?.map((e) => e.toJson()).toList(),
      };

}

@Collection<Tournament>('Tournament')
@Collection<TournamentType>('Tournament/*/TournamentType')
final tournamentsRef = TournamentCollectionReference();
