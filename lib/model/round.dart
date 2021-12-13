import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:o_spawn_cup/model/round_state.dart';
import 'package:o_spawn_cup/model/tournament.dart';

import 'game_map.dart';

class Round {
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
      "map": map,
      "tournament": tournament,
      "roundState": roundState.index,
    };
  }
  getInstanceRound(){
    rounds = FirebaseFirestore.instance.collection('round');
  }
  createRound(){
    return rounds
        .add(toJson())
        .then((value) => print("rounds Added"))
        .catchError((error) => print("Failed to add Map: $error"));
  }
  updateStateRound(RoundState rs,String uid){
    roundState = rs;
    return rounds
        .doc(uid)
        .update({"roundState": roundState,})
        .then((value) => print("rounds update"))
        .catchError((error) => print("Failed to update round: $error"));
  }
}

