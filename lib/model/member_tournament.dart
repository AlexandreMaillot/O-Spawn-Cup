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


  MemberTournament(this.member, this.tournament, this.gamerTag, this.role);

  signIntoTournament(){
    
  }
  addListRoundClassement(RoundClassementMember roundClassementMember){
    
  }
}

