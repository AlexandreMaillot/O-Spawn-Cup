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


 Tournament(
      this.name,
      this.date,
      this.game,
      this.server,
      this.tournamentType,
      this.capacity,
      this.cashPrize,
      this.roundNumber,
      this.rangPointTournament,
      this.killPointTournament);

  createTournament(){

 }
 updateTournament(){

 }
 generateRangPointTournament(int capacity){

 }
}











