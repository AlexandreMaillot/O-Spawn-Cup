import 'package:o_spawn_cup/model/MemberTournament/member_tournament.dart';
import 'package:o_spawn_cup/model/Team/team.dart';
import 'package:o_spawn_cup/model/Team/team_dao.dart';
import 'package:o_spawn_cup/model/role_type.dart';

class TeamFirebaseController {
  Team team;
  late TeamDao teamDao;

  TeamFirebaseController(this.team){
    teamDao = TeamDao(team);
  }
  createTeam(MemberTournament teamLead){
    teamLead.role = RoleType.leader;
    team.listMemberTournament.add(teamLead);
    teamDao.create();
  }
  deleteMember(MemberTournament memberTournament){

  }
  addMember(MemberTournament memberTournament){
    memberTournament.role = RoleType.player;
    team.listMemberTournament.add(memberTournament);
    teamDao.update();
  }
  changeLeader(){

  }
  String generateTeamCode(){
    return "";
  }
}