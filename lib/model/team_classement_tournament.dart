import 'package:o_spawn_cup/Team/team.dart';
import 'package:o_spawn_cup/Tournament/tournament.dart';

class TeamClassementTournament {
  Tournament tournament;
  Team team;
  int rang;
  int totalPoints;


  TeamClassementTournament({required this.tournament,required this.team,required this.rang,required this.totalPoints});


  TeamClassementTournament.fromJson(Map<String, Object?> json) : this(
    tournament: json["tournament"]! as Tournament,
    team: json["team"]! as Team,
    rang: json["rang"]! as int,
    totalPoints: json["totalPoints"]! as int,
  );


  Map<String, Object?> toJson() {
    return {
      "tournament": tournament,
      "team": team,
      "rang": rang,
      "totalPoints": totalPoints,
    };
  }
  createTeamClassement(){

  }
  calculPointTeam(Team team){

  }
  updateTeamClassement(){

  }

}