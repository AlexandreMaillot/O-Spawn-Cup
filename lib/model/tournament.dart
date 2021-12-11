import 'package:o_spawn_cup/model/rang_point_tournament.dart';
import 'package:o_spawn_cup/model/server_type.dart';
import 'package:o_spawn_cup/model/tournament_state.dart';
import 'package:o_spawn_cup/model/tournament_type.dart';

import 'game_name.dart';
import 'kill_point_tournament.dart';

class Tournament {
 String name;
 DateTime date;
 GameName game;
 ServerType server;
 TournamentType tournamentType;
 int capacity;
 String cashPrize;
 int roundNumber;
 TournamentState state = TournamentState.enAttente;
 String? image;
 RangPointTournament rangPointTournament;
 KillPointTournament killPointTournament;


 Tournament({
      required this.name,
  required this.date,
  required this.game,
  required this.server,
  required this.tournamentType,
  required this.capacity,
  required this.cashPrize,
  required this.roundNumber,
  required this.rangPointTournament,
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
  rangPointTournament: json["rangPointTournament"]! as RangPointTournament,
  killPointTournament: json["killPointTournament"]! as KillPointTournament,
 );


 Map<String, Object?> toJson() {
  return {
   "name": name,
   "date": date,
   "game": game,
   "server": server,
   "tournamentType": tournamentType,
   "capacity": capacity,
   "cashPrize": cashPrize,
   "roundNumber": roundNumber,
   "rangPointTournament": rangPointTournament,
   "killPointTournament": killPointTournament,
  };
 }
  createTournament(){

 }
 updateTournament(){

 }
 generateRangPointTournament(int capacity){

 }
}











