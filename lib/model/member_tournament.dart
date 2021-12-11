import 'package:o_spawn_cup/model/role_type.dart';
import 'package:o_spawn_cup/model/round_classement_member.dart';
import 'package:o_spawn_cup/model/team.dart';
import 'package:o_spawn_cup/model/tournament.dart';

import 'member.dart';

class MemberTournament {
  Member member;
  Tournament tournament;
  String gamerTag;
  RoleType role;
  late Team team;
  List<RoundClassementMember> listRoundClassementMember = [];


  MemberTournament({required this.member,required this.tournament,required this.gamerTag,required this.role});


  MemberTournament.fromJson(Map<String, Object?> json) : this(
    member: json["member"]! as Member,
    tournament: json["tournament"]! as Tournament,
    gamerTag: json["gamerTag"]! as String,
    role: json["role"]! as RoleType,
  );


  Map<String, Object?> toJson() {
    return {
      "member": member,
      "tournament": tournament,
      "gamerTag": gamerTag,
      "role": role,
      "team": team,
      "listRoundClassementMember": listRoundClassementMember,
    };
  }
  signIntoTournament(){
    
  }
  addListRoundClassement(RoundClassementMember roundClassementMember){
    
  }
}

