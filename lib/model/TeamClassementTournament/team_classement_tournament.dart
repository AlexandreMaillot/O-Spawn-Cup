
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cloud_firestore_odm/cloud_firestore_odm.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:o_spawn_cup/model/Team/team.dart';
import 'package:o_spawn_cup/model/Tournament/tournament.dart';
part 'team_classement_tournament.g.dart';

@JsonSerializable()
class TeamClassementTournament {
  Tournament tournament;
  Team team;
  int rang;
  int totalPoints;


  TeamClassementTournament({required this.tournament,required this.team,required this.rang,required this.totalPoints});
  factory TeamClassementTournament.fromJson(Map<String, dynamic> json) => _$TeamClassementTournamentFromJson(json);

}
@Collection<TeamClassementTournament>('TeamClassementTournament')
final teamClassementTournamentsRef = TeamClassementTournamentCollectionReference();