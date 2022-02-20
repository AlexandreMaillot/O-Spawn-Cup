import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cloud_firestore_odm/annotation.dart';
import 'package:cloud_firestore_odm/cloud_firestore_odm.dart';
import 'package:json_annotation/json_annotation.dart';

import '../game_name.dart';
part 'game_map.g.dart';
@JsonSerializable(explicitToJson: true)
class GameMap {
  GameName gameName;
  String name;
  bool isDisabled = false;

  GameMap({required this.gameName,required this.name});
  factory GameMap.fromJson(Map<String, dynamic> json) => _$GameMapFromJson(json);
  Map<String, Object?> toJson() => _$GameMapToJson(this);
}
@Collection<GameMap>('GameMaps')
final gameMapsRef = GameMapCollectionReference();