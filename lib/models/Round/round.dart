import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cloud_firestore_odm/cloud_firestore_odm.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:o_spawn_cup/models/Tournament/tournament.dart';
import 'package:o_spawn_cup/models/round_state.dart';


import '../GameMap/game_map.dart';
part 'round.g.dart';
@JsonSerializable()
class Round {

  GameMap map;
  Tournament tournament;
  RoundState roundState = RoundState.EnAttente;

  Round({required this.map,required this.tournament,required this.roundState});
  factory Round.fromJson(Map<String, dynamic> json) => _$RoundFromJson(json);
}

@Collection<Round>('Round')
final roundsRef = RoundCollectionReference();