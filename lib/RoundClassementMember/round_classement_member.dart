import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:o_spawn_cup/MemberTournament/member_tournament.dart';
import 'package:o_spawn_cup/Round/round.dart';

class RoundClassementMember {
  String? uid;
  Round round;
  MemberTournament memberTournament;
  int kill;
  int rang;
  File? screenshot;
  late CollectionReference roundClassementMembers;

  RoundClassementMember({required this.round,required this.memberTournament,required this.kill,required this.rang});

  RoundClassementMember.fromJson(Map<String, Object?> json) : this(
    round: json["round"]! as Round,
    memberTournament: json["memberTournament"]! as MemberTournament,
    kill: json["kill"]! as int,
    rang: json["rang"]! as int,
  );


  Map<String, Object?> toJson() {
    return {
      "uid": uid,
      "round": round,
      "memberTournament": memberTournament,
      "kill": kill,
      "rang": rang,
      "screenshot": screenshot,
    };
  }


}