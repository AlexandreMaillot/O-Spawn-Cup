import 'package:o_spawn_cup/GameMap/game_map.dart';
import 'package:o_spawn_cup/GameMap/game_map_controller.dart';

class GameMapFirebase implements GameMapController {
  @override
  GameMap gameMap;

  GameMapFirebase({required this.gameMap});
}