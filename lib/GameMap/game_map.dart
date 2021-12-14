import 'package:cloud_firestore/cloud_firestore.dart';

import '../model/game_name.dart';

class GameMap {
  String? uid;
  GameName gameName;
  String name;
  bool isDisabled = false;

  GameMap({required this.gameName,required this.name});

  GameMap.fromJson(Map<String, Object?> json) : this(
    gameName: json["gameName"]! as GameName,
    name: json["name"]! as String,
  );


  Map<String, Object?> toJson() {
    return {
      "uid": uid,
      "name": name,
      "gameName": gameName.index,
      "isDisabled": isDisabled,
    };
  }
  CollectionReference getInstanceGameMap(){
    return FirebaseFirestore.instance.collection('gameMap');
  }
  createMap(){
    CollectionReference gameMaps = getInstanceGameMap();
    return gameMaps
        .add(toJson())
        .then((value) => print("GameMap Added"))
        .catchError((error) => print("Failed to add Map: $error"));
  }
  disabledMap(String uidMap){
    isDisabled = false;
    CollectionReference gameMaps = getInstanceGameMap();
    return gameMaps
        .doc(uidMap)
        .update({"isDisabled": true,})
        .then((value) => print("GameMap update disabled true"))
        .catchError((error) => print("Failed to update Map: $error"));
  }
  updateMap(){

  }
}
