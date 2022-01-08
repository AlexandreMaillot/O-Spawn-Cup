import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cloud_firestore_odm/annotation.dart';
import 'package:cloud_firestore_odm/cloud_firestore_odm.dart';
import 'package:json_annotation/json_annotation.dart';

import '../game_name.dart';
part 'game_map.g.dart';
@JsonSerializable()
class GameMap {
  String? uid;
  GameName gameName;
  String name;
  bool isDisabled = false;

  GameMap({required this.gameName,required this.name});
}
@Collection<GameMap>('GameMaps')
final gameMapsRef = GameMapCollectionReference();