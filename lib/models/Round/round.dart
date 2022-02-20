import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cloud_firestore_odm/cloud_firestore_odm.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:o_spawn_cup/models/RoundClassementMember/round_classement_member.dart';
import 'package:o_spawn_cup/models/Tournament/tournament.dart';
import 'package:o_spawn_cup/models/round_state.dart';


import '../GameMap/game_map.dart';
part 'round.g.dart';
@JsonSerializable(explicitToJson: true)
class Round {

  GameMap? map;
  int roundNumber;
  RoundState roundState;

  Round({this.map,this.roundState = RoundState.EnAttente,required this.roundNumber});
  factory Round.fromJson(Map<String, dynamic> json) => _$RoundFromJson(json);
  Map<String, Object?> toJson() => _$RoundToJson(this);
}

@Collection<Round>('Rounds')
@Collection<RoundClassementMember>('Rounds/*/roundClassementMembers')
final roundsRef = RoundCollectionReference();