import 'member.dart';
import 'member_tournament.dart';

class Team {
  String name;
  List<MemberTournament> listMemberTournament = [];
  late String teamCode;
  bool isDisqualified = false;


  Team(this.name);

  createTeam(Member teamLead){

  }
  deleteMember(Member member){

  }
  addMember(Member member){

  }
  changeLeader(){

  }
  String generateTeamCode(){
    return "";
  }
}