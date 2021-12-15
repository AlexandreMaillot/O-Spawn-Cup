

import 'package:o_spawn_cup/model/RoundClassementMember/round_classement_member.dart';
import 'package:o_spawn_cup/model/RoundClassementMember/round_classement_member_dao.dart';

class RoundClassementMemberFirebaseController {
  RoundClassementMember roundClassementMember;
  late RoundClassementMemberDao roundClassementMemberDao;
  RoundClassementMemberFirebaseController(this.roundClassementMember){
    roundClassementMemberDao = RoundClassementMemberDao(roundClassementMember);
  }

  createRoundClassement(){

  }
  calculPointRound(){

  }
}