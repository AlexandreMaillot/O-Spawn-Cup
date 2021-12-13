import 'package:o_spawn_cup/Tournament/tournament.dart';
import 'package:o_spawn_cup/Tournament/tournament_firebase_controller.dart';

abstract class TournamentController {
  late Tournament tournament;
  TournamentController();
}

enum TournamentControllerType {
  firebase,
}