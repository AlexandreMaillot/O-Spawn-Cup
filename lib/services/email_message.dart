import "package:o_spawn_cup/models/Team/team.dart";
import "package:o_spawn_cup/models/Tournament/tournament.dart";
import "package:o_spawn_cup/services/MyMessage.dart";
import "package:o_spawn_cup/services/email_broker.dart";
import 'package:o_spawn_cup/services/utils.dart';

// enum TypeMsg { welcomeMsg, leaderMsg }
class EmailMessage extends MyMessage{
  late EmailBroker broker;
  EmailMessage(this.broker);

  @override
  void sendMessageWelcomeMethod(Tournament tournament, Team team, String? email) {
    if(email != null) {
      broker.sendEmailMessage(
          "Salut, tu es bien inscrit pour le tournois ${tournament.name} qui aura lieu le ${Utils().formatDate(tournament.dateDebutTournois)}",
          "<p>Salut, tu es bien inscrit pour le tournois <b>${tournament.name}</b> qui aura lieu le <b>${Utils().formatDate(tournament.dateDebutTournois)}</b></p>",
          "Inscription validée",
          email);
    }

  }

  @override
  void sendMessageTeamCodeMethod(Tournament tournament, Team team, String? email) {
    if(email != null) {
      broker.sendEmailMessage(
          "Voici le code pour le tournois qui aura lieu le ${Utils().formatDate(tournament.dateDebutTournois)}",
          "<p>Voici le code pour le tournois qui aura lieu le ${Utils().formatDate(tournament.dateDebutTournois)} \n <b> : ${team.teamCode}</b></p>",
          "Code chef d'équipe",
          email);
    }

  }
  
}

