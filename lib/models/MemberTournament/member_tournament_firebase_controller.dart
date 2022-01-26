

import 'package:o_spawn_cup/models/RoundClassementMember/round_classement_member.dart';

import 'member_tournament.dart';

class MemberTournamentFirebaseController {
  MemberTournament memberTournament;
  MemberTournamentFirebaseController({ required this.memberTournament }){

  }
  signIntoTournament(){

  }
  addListRoundClassement(RoundClassementMember roundClassementMember){
    memberTournament.listRoundClassementMember.add(roundClassementMember);
    // memberTournamentDao.update();
  }
}