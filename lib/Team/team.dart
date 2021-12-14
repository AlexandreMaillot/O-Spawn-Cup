import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:o_spawn_cup/model/role_type.dart';

import '../Member/member.dart';
import '../MemberTournament/member_tournament.dart';

class Team {
  String? uid;
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
      "uid": uid,
      "name": name,
      "listMemberTournament": listMemberTournament,
      "teamCode": teamCode,
      "isDisqualified": isDisqualified,
    };
  }


}