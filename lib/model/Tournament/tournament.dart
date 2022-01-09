import 'package:o_spawn_cup/model/RangPointTournament/rang_point_tournament.dart';
import 'package:o_spawn_cup/model/Tournament/tournament_state.dart';
import 'package:o_spawn_cup/model/TournamentType/tournament_type.dart';
import 'package:o_spawn_cup/model/server_type.dart';

import '../game_name.dart';

class Tournament {
 String? uid;
 String name;
 DateTime date;
 GameName game;
 ServerType server;
 TournamentType tournamentType;
 int capacity;
 String cashPrize;
 int roundNumber;
 TournamentState state = TournamentState.inscriptionFermer;
 String? image;
 List<RangPointTournament> listRangPointTournament;
 int killPointTournament;


 Tournament({
      required this.name,
  required this.date,
  required this.game,
  required this.server,
  required this.tournamentType,
  required this.capacity,
  required this.cashPrize,
  required this.roundNumber,
  required this.listRangPointTournament,
  required this.killPointTournament});


 Tournament.fromJson(Map<String, Object?> json) : this(
  name: json["name"]! as String,
  date: json["date"]! as DateTime,
  game: json["game"]! as GameName,
  server: json["server"]! as ServerType,
  tournamentType: json["tournamentType"]! as TournamentType,
  capacity: json["capacity"]! as int,
  cashPrize: json["cashPrize"]! as String,
  roundNumber: json["roundNumber"]! as int,
  listRangPointTournament: json["listRangPointTournament"]! as List<RangPointTournament>,
  killPointTournament: json["killPointTournament"]! as int,
 );


 Map<String, Object?> toJson() {
  return {
   "uid": uid,
   "name": name,
   "date": date,
   "game": game,
   "server": server,
   "tournamentType": tournamentType,
   "capacity": capacity,
   "cashPrize": cashPrize,
   "roundNumber": roundNumber,
   "listRangPointTournament": listRangPointTournament,
   "killPointTournament": killPointTournament,
  };
 }

}











