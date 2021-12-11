import 'game_name.dart';

class GameMap {
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
      "name": name,
      "gameName": gameName,
      "isDisabled": isDisabled,
    };
  }
  createMap(){

  }
  disabledMap(){

  }
  updateMap(){

  }
}
