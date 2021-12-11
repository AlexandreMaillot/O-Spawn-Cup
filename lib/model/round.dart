import 'package:o_spawn_cup/model/round_state.dart';
import 'package:o_spawn_cup/model/tournament.dart';

import 'game_map.dart';

class Round {
  GameMap map;
  Tournament tournament;
  RoundState roundState = RoundState.EnAttente;


  Round(this.map, this.tournament, this.roundState);

  createRound(){

  }
  updateStateRound(){

  }
}

