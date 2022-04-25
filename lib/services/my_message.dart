import 'package:o_spawn_cup/models/team/team.dart';
import 'package:o_spawn_cup/models/tournament/tournament.dart';

abstract class MyMessage {
  void sendMessageWelcomeMethod(
    Tournament tournament,
    Team team,
    String? email,
  );
  void sendMessageTeamCodeMethod(
    Tournament tournament,
    Team team,
    String? email,
  );
}
