
import 'package:o_spawn_cup/model/Team/team.dart';
import 'package:o_spawn_cup/model/Tournament/tournament.dart';

class TeamClassementTournament {
  String? uid;
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
      "uid": uid,
      "tournament": tournament,
      "team": team,
      "rang": rang,
      "totalPoints": totalPoints,
    };
  }


}