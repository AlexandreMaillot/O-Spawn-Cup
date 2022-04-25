import 'dart:async';
import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:mailer/mailer.dart';
import 'package:mailer/smtp_server.dart';
import 'package:o_spawn_cup/models/Member/member.dart';
import 'package:o_spawn_cup/models/role_type.dart';
import 'package:o_spawn_cup/models/team/team.dart';
import 'package:o_spawn_cup/models/tournament/tournament.dart';

part 'member_tournament_firestore_event.dart';
part 'member_tournament_firestore_state.dart';

enum TypeMsg { welcomeMsg, leaderMsg }

class MemberTournamentFirestoreBloc extends Bloc<MemberTournamentFirestoreEvent,
    MemberTournamentFirestoreState> {
  Tournament tournament;
  Member? member;

  MemberTournamentFirestoreBloc({required this.tournament})
      : super(MemberTournamentFirestoreInitial());

  bool isLeader(RoleType _roleType) => _roleType == RoleType.leader;

  bool isPlayer(RoleType _roleType) => _roleType == RoleType.player;

  Future<void> sendEmailMessage(
    TypeMsg typeMsg,
    Tournament tournament,
    Team team,
  ) async {
    final smtpServer = paramEmail();
    final message = createMessage(typeMsg, tournament, team);

    await showReport(message, smtpServer);
  }

  SmtpServer paramEmail() {
    const username = 'tamoro974@gmail.com';
    const token = 'fftvuferdeyhpqqh';
    // String password = 'AIzaSyC67O8S6jcsHAnV0ursdHN2gTcjeaj76wA';
    // String password = 'fgmpfizenmfzmdlb';

    return gmail(username, token);
  }

  Message createMessage(TypeMsg typeMsg, Tournament tournament, Team team) {
    var subject = '';
    var txt = '';
    var txtHtml = '';
    if (typeMsg == TypeMsg.welcomeMsg) {
      subject = 'Inscription validée';
      txt = 'Salut, tu es bien inscrit sur pour le tournois qui '
          'aura lieu le ${tournament.dateDebutTournois}';
      txtHtml = '<p>Salut, tu es bien inscrit sur pour le tournois qui aura '
          'lieu le <b>${tournament.dateDebutTournois}</b></p>';
    }
    if (typeMsg == TypeMsg.leaderMsg) {
      subject = "Code chef d'équipe";
      txt = 'Voici le code pour le tournois qui '
          'aura lieu le ${tournament.dateDebutTournois}';
      txtHtml = '<p>Voici le code pour le tournois qui '
          'aura lieu le ${tournament.dateDebutTournois} \n <b>${team.teamCode}</b></p>';
    }

    return Message()
      ..from = const Address('contact@o-spawn.re', 'O-Spawn')
      ..recipients.add(FirebaseAuth.instance.currentUser!.email)
      // ..ccRecipients.addAll(["destCc1@example.com", "destCc2@example.com"])
      ..bccRecipients.add(const Address('bccAddress@example.com'))
      ..subject = subject
      ..text = txt
      ..html = txtHtml;
  }

  Future<void> showReport(Message message, SmtpServer smtpServer) async {
    try {
      final sendReport = await send(message, smtpServer);
      log('Message sent: $sendReport');
    } on MailerException catch (e) {
      log('$e Message not sent.');
      for (final p in e.problems) {
        log('Problem: ${p.code}: ${p.msg}');
      }
    }
  }
}
