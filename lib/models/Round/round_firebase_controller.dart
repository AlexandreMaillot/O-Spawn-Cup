import 'package:o_spawn_cup/models/Round/round.dart';

import 'package:o_spawn_cup/models/round_state.dart';

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