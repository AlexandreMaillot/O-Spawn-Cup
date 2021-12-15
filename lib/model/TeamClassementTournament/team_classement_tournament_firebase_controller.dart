

import 'package:o_spawn_cup/model/Team/team.dart';
import 'package:o_spawn_cup/model/TeamClassementTournament/team_classement_tournament.dart';
import 'package:o_spawn_cup/model/TeamClassementTournament/team_classement_tournament_dao.dart';

class TeamClassementTournamentFirebaseController {

  TeamClassementTournament teamClassementTournament;
  late TeamClassementTournamentDao teamClassementTournamentDao;

  TeamClassementTournamentFirebaseController(this.teamClassementTournament){
    teamClassementTournamentDao = TeamClassementTournamentDao(teamClassementTournament);
  }

  createTeamClassement(){

  }
  calculPointTeam(Team team){

  }
  updateTeamClassement(){

  }
}