import 'package:o_spawn_cup/models/Team/team.dart';
import 'package:o_spawn_cup/models/Tournament/tournament.dart';
import 'package:o_spawn_cup/service/MyMessage.dart';
import 'package:o_spawn_cup/service/email_broker.dart';


// enum TypeMsg { welcomeMsg, leaderMsg }
class EmailMessage extends MyMessage{
  late EmailBroker broker;
  EmailMessage(this.broker);

  @override
  void sendMessageWelcomeMethod(Tournament tournament, Team team, String? email) {
    if(email != null) {
      broker.sendEmailMessage(
          "Salut, tu es bien inscrit pour le tournois ${tournament.name} qui aura lieu le ${formatDate(tournament.date)}",
          "<p>Salut, tu es bien inscrit pour le tournois <b>${tournament.name}</b> qui aura lieu le <b>${formatDate(tournament.date)}</b></p>",
          "Inscription validée",
          email);
    }

  }

  @override
  void sendMessageTeamCodeMethod(Tournament tournament, Team team, String? email) {
    if(email != null) {
      broker.sendEmailMessage(
          "Voici le code pour le tournois qui aura lieu le ${formatDate(tournament.date)}",
          "<p>Voici le code pour le tournois qui aura lieu le ${formatDate(tournament.date)} \n <b> : ${team.teamCode}</b></p>",
          "Code chef d'équipe",
          email);
    }

  }
  
}
String formatDate(int date) {
  String years = date.toString().substring(0, 4);
  String month = date.toString().substring(4, 6);
  String day = date.toString().substring(6, 8);
  return day + "/" + month + "/" + years;
}

