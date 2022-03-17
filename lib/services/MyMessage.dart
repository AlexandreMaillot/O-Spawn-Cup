import '../models/Team/team.dart';
import '../models/Tournament/tournament.dart';

abstract class MyMessage {
  void sendMessageWelcomeMethod(Tournament tournament ,Team team,String? email);
  void sendMessageTeamCodeMethod(Tournament tournament ,Team team,String? email);
}