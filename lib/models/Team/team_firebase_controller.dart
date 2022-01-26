import 'package:o_spawn_cup/models/MemberTournament/member_tournament.dart';
import 'package:o_spawn_cup/models/Team/team.dart';
import 'package:o_spawn_cup/models/role_type.dart';

class TeamFirebaseController {
  Team team;

  TeamFirebaseController(this.team){
  }
  createTeam(MemberTournament teamLead){
    // teamLead.role = RoleType.leader;
    // team.listMemberTournament.add(teamLead);
    // teamDao.create();
  }
  deleteMember(MemberTournament memberTournament){

  }
  addMember(MemberTournament memberTournament){
    // memberTournament.role = RoleType.player;
    // team.listMemberTournament.add(memberTournament);
    // teamDao.update();
  }
  changeLeader(){

  }
  String generateTeamCode(){
    return "";
  }
}