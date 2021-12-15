import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:o_spawn_cup/model/RoundClassementMember/round_classement_member.dart';
import 'package:o_spawn_cup/model/Team/team.dart';
import 'package:o_spawn_cup/model/Tournament/tournament.dart';
import 'package:o_spawn_cup/model/role_type.dart';

import '../Member/member.dart';

class MemberTournament {
  String? uid;
  Member member;
  Tournament tournament;
  String gamerTag;
  RoleType role;
  late Team team;
  List<RoundClassementMember> listRoundClassementMember = [];
  late CollectionReference memberTournaments;

  MemberTournament({required this.member,required this.tournament,required this.gamerTag,required this.role});


  MemberTournament.fromJson(Map<String, Object?> json) : this(
    member: json["member"]! as Member,
    tournament: json["tournament"]! as Tournament,
    gamerTag: json["gamerTag"]! as String,
    role: json["role"]! as RoleType,
  );


  Map<String, Object?> toJson() {
    return {
      "uid": uid,
      "member": member,
      "tournament": tournament,
      "gamerTag": gamerTag,
      "role": role.index,
      "team": team,
      "listRoundClassementMember": listRoundClassementMember,
    };
  }

}

