

import 'package:o_spawn_cup/model/RoundClassementMember/round_classement_member.dart';

import 'member_tournament.dart';
import 'member_tournament_dao.dart';

class MemberTournamentFirebaseController {
  late MemberTournamentDao memberTournamentDao;
  MemberTournament memberTournament;
  MemberTournamentFirebaseController({ required this.memberTournament }){
    memberTournamentDao = MemberTournamentDao(memberTournament);
  }
  signIntoTournament(){

  }
  addListRoundClassement(RoundClassementMember roundClassementMember){
    memberTournament.listRoundClassementMember.add(roundClassementMember);
    memberTournamentDao.update();
  }
}