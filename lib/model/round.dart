import 'package:o_spawn_cup/model/round_state.dart';
import 'package:o_spawn_cup/model/tournament.dart';

import 'game_map.dart';

class Round {
  GameMap map;
  Tournament tournament;
  RoundState roundState = RoundState.EnAttente;


  Round({required this.map,required this.tournament,required this.roundState});


  Round.fromJson(Map<String, Object?> json) : this(
    map: json["map"]! as GameMap,
    tournament: json["tournament"]! as Tournament,
    roundState: json["roundState"]! as RoundState,
  );


  Map<String, Object?> toJson() {
    return {
      "map": map,
      "tournament": tournament,
      "roundState": roundState,
    };
  }
  createRound(){

  }
  updateStateRound(){

  }
}

