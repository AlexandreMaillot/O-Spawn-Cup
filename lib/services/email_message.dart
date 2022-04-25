import 'package:o_spawn_cup/models/team/team.dart';
import 'package:o_spawn_cup/models/tournament/tournament.dart';
import 'package:o_spawn_cup/services/email_broker.dart';
import 'package:o_spawn_cup/services/my_message.dart';
import 'package:o_spawn_cup/services/utils.dart';

class EmailMessage extends MyMessage {
  late final EmailBroker _broker;
  EmailMessage(this._broker);

  @override
  void sendMessageWelcomeMethod(
    Tournament tournament,
    Team team,
    String? email,
  ) {
    if (email != null && email != '') {
      _broker.sendEmailMessage(
        'Salut, tu es bien inscrit pour le tournois ${tournament.name} qui '
            'aura lieu le ${Utils().formatDate(tournament.dateDebutTournois)}',
        '<p>Salut, tu es bien inscrit pour le tournois <b>${tournament.name}</b> qui '
            'aura lieu le <b>${Utils().formatDate(tournament.dateDebutTournois)}</b></p>',
        'Inscription validée',
        email,
      );
    } else {
      throw ArgumentError('Email manquant');
    }
  }

  @override
  void sendMessageTeamCodeMethod(
    Tournament tournament,
    Team team,
    String? email,
  ) {
    if (email != null && email != '') {
      _broker.sendEmailMessage(
        'Voici le code pour le tournois qui '
            'aura lieu le ${Utils().formatDate(tournament.dateDebutTournois)}',
        '<p>Voici le code pour le tournois qui '
            'aura lieu le ${Utils().formatDate(tournament.dateDebutTournois)} \n <b> : ${team.teamCode}</b></p>',
        "Code chef d'équipe",
        email,
      );
    } else {
      throw ArgumentError('Email manquant');
    }
  }
}
