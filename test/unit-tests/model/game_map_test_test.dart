

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:o_spawn_cup/model/game_map.dart';
import 'package:o_spawn_cup/model/game_name.dart';

void main() {
  late GameMap gameMap;
  Firebase.initializeApp();
  setUp(() async {
    gameMap = GameMap(gameName: GameName.Fornite, name: "Le jeu fornite");

  });
  tearDown((){

  });
  test('disabled in start', () {
    expect(gameMap.isDisabled,false);
  });
  test('shouldDisabled map', () {

  });
  test('add GameMap', () async {
    gameMap.createMap();

  });
}