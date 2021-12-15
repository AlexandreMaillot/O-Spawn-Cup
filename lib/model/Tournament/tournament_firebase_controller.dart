

import 'package:o_spawn_cup/model/Tournament/tournament.dart';
import 'package:o_spawn_cup/model/Tournament/tournament_dao.dart';

class TournamentFirebaseController {
  Tournament tournament;
  late TournamentDao tournamentDao;
  TournamentFirebaseController(this.tournament){
    tournamentDao = TournamentDao(tournament);
  }

  createTournament(){

  }
  updateTournament(){

  }
  generateRangPointTournament(int capacity){

  }

  calculKillPoint(int kill) {

  }
  updateKillPointTournament() {

  }


}