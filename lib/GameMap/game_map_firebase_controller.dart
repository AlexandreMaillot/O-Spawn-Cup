import 'package:o_spawn_cup/GameMap/game_map.dart';

import 'game_map_dao.dart';

class GameMapFirebase {
  GameMap gameMap;
  late GameMapDao gameMapDao;
  GameMapFirebase({required this.gameMap}){
    gameMapDao = GameMapDao(gameMap);
  }


  createMap(){

  }
  disabledMap(String uidMap) {
    gameMap.isDisabled = false;
    gameMapDao.update();
  }
  updateMap(){

  }
}