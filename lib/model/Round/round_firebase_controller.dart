import 'package:o_spawn_cup/model/Round/round.dart';

import 'package:o_spawn_cup/model/round_state.dart';

class RoundFirebaseController {
  Round round;

  RoundFirebaseController(this.round){

  }

  createRound(){

  }
  updateStateRound(RoundState rs){
    round.roundState = rs;
    // roundDao.update();
  }
}