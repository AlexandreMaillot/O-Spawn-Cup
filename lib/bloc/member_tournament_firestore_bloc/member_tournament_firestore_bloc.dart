import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:mailer/mailer.dart';
import 'package:mailer/smtp_server.dart';
import 'package:o_spawn_cup/models/Member/member.dart';
import 'package:o_spawn_cup/models/Team/team.dart';
import 'package:o_spawn_cup/models/Tournament/tournament.dart';
import 'package:o_spawn_cup/models/role_type.dart';

part 'member_tournament_firestore_event.dart';
part 'member_tournament_firestore_state.dart';

enum TypeMsg { welcomeMsg, leaderMsg }

class MemberTournamentFirestoreBloc extends Bloc<MemberTournamentFirestoreEvent,
    MemberTournamentFirestoreState> {
  Tournament tournament;
  Member? member;

  MemberTournamentFirestoreBloc({required this.tournament})
      : super(MemberTournamentFirestoreInitial()) {
    // on<MemberTournamentFirestoreAdd>(_addMemberTournament);
  }

  bool isLeader(RoleType _roleType) => _roleType == RoleType.leader;

  bool isPlayer(RoleType _roleType) => _roleType == RoleType.player;

  Future<void> sendEmailMessage(
      TypeMsg typeMsg, Tournament tournament, Team team) async {
    SmtpServer smtpServer = paramEmail();
    Message message = createMessage(typeMsg, tournament, team);

    await showReport(message, smtpServer);
  }

  SmtpServer paramEmail() {
    String username = 'tamoro974@gmail.com';
    String token = 'fftvuferdeyhpqqh';
    // String password = 'AIzaSyC67O8S6jcsHAnV0ursdHN2gTcjeaj76wA';
    // String password = 'fgmpfizenmfzmdlb';

    final smtpServer = gmail(username, token);
    return smtpServer;
  }

  Message createMessage(TypeMsg typeMsg, Tournament tournament, Team team) {
    String subject = '';
    String txt = '';
    String txtHtml = '';
    if (typeMsg == TypeMsg.welcomeMsg) {
      subject = 'Inscription validée';
      txt =
          'Salut, tu es bien inscrit sur pour le tournois qui aura lieu le ${tournament.dateDebutTournois}';
      txtHtml =
          '<p>Salut, tu es bien inscrit sur pour le tournois qui aura lieu le <b>${tournament.dateDebutTournois}</b></p>';
    }
    if (typeMsg == TypeMsg.leaderMsg) {
      subject = "Code chef d'équipe";
      txt =
          'Voici le code pour le tournois qui aura lieu le ${tournament.dateDebutTournois}';
      txtHtml =
          '<p>Voici le code pour le tournois qui aura lieu le ${tournament.dateDebutTournois} \n <b>${team.teamCode}</b></p>';
    }

    final message = Message()
      ..from = const Address('contact@o-spawn.re', 'O-Spawn')
      ..recipients.add(FirebaseAuth.instance.currentUser!.email)
      // ..ccRecipients.addAll(["destCc1@example.com", "destCc2@example.com"])
      ..bccRecipients.add(const Address('bccAddress@example.com'))
      ..subject = subject
      ..text = txt
      ..html = txtHtml;
    return message;
  }

  Future<void> showReport(Message message, SmtpServer smtpServer) async {
    try {
      final sendReport = await send(message, smtpServer);
      print('Message sent: ' + sendReport.toString());
    } on MailerException catch (e) {
      print('$e Message not sent.');
      for (var p in e.problems) {
        print('Problem: ${p.code}: ${p.msg}');
      }
    }
  }
}
