import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:o_spawn_cup/model/role_type.dart';

import '../Member/member.dart';
import 'member_tournament.dart';

class Team {
  String name;
  List<MemberTournament> listMemberTournament = [];
  late String teamCode;
  bool isDisqualified = false;
  late CollectionReference teams;

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

  getInstanceTeam(){
    teams = FirebaseFirestore.instance.collection('team');
  }
  createTeam(MemberTournament teamLead){
    teamLead.role = RoleType.leader;
    listMemberTournament.add(teamLead);
    return teams
        .add(toJson())
        .then((value) => print("team Added"))
        .catchError((error) => print("Failed to add team: $error"));
  }
  deleteMember(MemberTournament memberTournament){

  }
  addMember(MemberTournament memberTournament,String uid){
    memberTournament.role = RoleType.player;
    listMemberTournament.add(memberTournament);
    return teams
        .doc(uid)
        .update({"listMemberTournament":listMemberTournament})
        .then((value) => print("team Added memberTournament in list"))
        .catchError((error) => print("Failed to add memberTournament in list: $error"));
  }
  changeLeader(){

  }
  String generateTeamCode(){
    return "";
  }
}