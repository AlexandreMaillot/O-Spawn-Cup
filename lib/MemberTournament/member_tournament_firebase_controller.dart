import 'package:o_spawn_cup/MemberTournament/member_tournament.dart';
import 'package:o_spawn_cup/MemberTournament/member_tournament_dao.dart';
import 'package:o_spawn_cup/model/round_classement_member.dart';

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