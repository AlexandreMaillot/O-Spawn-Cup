import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:o_spawn_cup/model/Tournament/tournament.dart';
import 'package:o_spawn_cup/model/round_state.dart';


import '../GameMap/game_map.dart';

class Round {
  String? uid;
  GameMap map;
  Tournament tournament;
  RoundState roundState = RoundState.EnAttente;
  late CollectionReference rounds;

  Round({required this.map,required this.tournament,required this.roundState});


  Round.fromJson(Map<String, Object?> json) : this(
    map: json["map"]! as GameMap,
    tournament: json["tournament"]! as Tournament,
    roundState: json["roundState"]! as RoundState,
  );


  Map<String, Object?> toJson() {
    return {
      "uid": uid,
      "map": map,
      "tournament": tournament,
      "roundState": roundState.index,
    };
  }

}

