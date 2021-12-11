import 'dart:io';

import 'package:o_spawn_cup/model/member_tournament.dart';
import 'package:o_spawn_cup/model/round.dart';

class RoundClassementMember {
  Round round;
  MemberTournament memberTournament;
  int kill;
  int rang;
  File? screenshot;


  RoundClassementMember({required this.round,required this.memberTournament,required this.kill,required this.rang});

  RoundClassementMember.fromJson(Map<String, Object?> json) : this(
    round: json["round"]! as Round,
    memberTournament: json["memberTournament"]! as MemberTournament,
    kill: json["kill"]! as int,
    rang: json["rang"]! as int,
  );


  Map<String, Object?> toJson() {
    return {
      "round": round,
      "memberTournament": memberTournament,
      "kill": kill,
      "rang": rang,
      "screenshot": screenshot,
    };
  }
  createRoundClassement(){

  }
  calculPointRound(){

  }

}