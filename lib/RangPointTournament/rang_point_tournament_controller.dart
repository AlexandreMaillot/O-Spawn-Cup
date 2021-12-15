import 'package:o_spawn_cup/RangPointTournament/rang_point_tournament.dart';
import 'package:o_spawn_cup/RangPointTournament/rang_point_tournament_dao.dart';

class RangPointTournamentController {
  RangPointTournament rangPointTournament;
  late RangPointTournamentDao rangPointTournamentDao;
  RangPointTournamentController(this.rangPointTournament){
    rangPointTournamentDao = RangPointTournamentDao(rangPointTournament);
  }
  updateRangPointTournament(){

  }
  calculRangPoint(int rang){

  }
}