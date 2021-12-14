import 'package:o_spawn_cup/Round/round.dart';
import 'package:o_spawn_cup/Round/round_dao.dart';
import 'package:o_spawn_cup/model/round_state.dart';

class RoundFirebaseController {
  late RoundDao roundDao;
  Round round;

  RoundFirebaseController(this.round){
    roundDao = RoundDao(round: round);
  }

  createRound(){

  }
  updateStateRound(RoundState rs){
    round.roundState = rs;
    roundDao.update();
  }
}