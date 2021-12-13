import 'package:o_spawn_cup/GameMap/game_map.dart';

abstract class GameMapController {
  GameMap gameMap;

  GameMapController({required this.gameMap});
}