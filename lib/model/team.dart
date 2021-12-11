import 'member.dart';
import 'member_tournament.dart';

class Team {
  String name;
  List<MemberTournament> listMemberTournament = [];
  late String teamCode;
  bool isDisqualified = false;


  Team({required this.name});


  Team.fromJson(Map<String, Object?> json) : this(
    name: json["name"]! as String,
  );


  Map<String, Object?> toJson() {
    return {
      "name": name,
      "listMemberTournament": listMemberTournament,
      "teamCode": teamCode,
      "isDisqualified": isDisqualified,
    };
  }
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