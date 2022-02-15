import "dart:async";
import "dart:math";

import "package:bloc/bloc.dart";
import "package:equatable/equatable.dart";
import 'package:firebase_auth/firebase_auth.dart';
import 'package:mailer/mailer.dart';
import 'package:mailer/smtp_server.dart';
import "package:o_spawn_cup/models/Member/member.dart";
import "package:o_spawn_cup/models/MemberTournament/member_tournament.dart" as mt;
import "package:o_spawn_cup/models/Team/team.dart";
import "package:o_spawn_cup/models/Tournament/tournament.dart";
import "package:o_spawn_cup/models/role_type.dart";
import 'package:o_spawn_cup/service/firebase_handler.dart';

import '../../service/authentification.dart';

part 'member_tournament_firestore_event.dart';
part 'member_tournament_firestore_state.dart';

class MemberTournamentFirestoreBloc extends Bloc<MemberTournamentFirestoreEvent, MemberTournamentFirestoreState> {
  Tournament tournament;
  Member? member;

  MemberTournamentFirestoreBloc({required this.tournament}) : super(MemberTournamentFirestoreInitial()) {
    on<MemberTournamentFirestoreAdd>(_addMemberTournament);
  }

  String getRandomString(int length) {
    const String _chars = "AaBbCcDdEeFfGgHhIiJjKkLlMmNnOoPpQqRrSsTtUuVvWwXxYyZz1234567890";
    final Random _rnd = Random();
    return tournament.documentId!.substring(0, 5) +
        String.fromCharCodes(Iterable.generate(
            length, (_) => _chars.codeUnitAt(_rnd.nextInt(_chars.length))));
  }


  Future<void> addMemberTournamentInFirebase(Member member,Team team,String gamerTag,RoleType _roleType) async {
    Member? member = await Authentification().selectMemberConnected();
    if(member != null) {
      mt.MemberTournament memberTournament = mt.MemberTournament(
          member: member,
          tournament: tournament,
          gamerTag: gamerTag,
          role: _roleType,
          team: team);
      mt.memberTournamentsRef.add(memberTournament);
      sendEmailMessage();
    }
  }



  bool isLeader(RoleType _roleType) => _roleType == RoleType.leader;

  bool isPlayer(RoleType _roleType) => _roleType == RoleType.player;


  Future<Team?> verifCodeTeam(Team? team,String teamName) async {
    TournamentDocumentSnapshot teamQuery =
    await tournamentsRef.doc(tournament.documentId).get();
    Iterable<Team>? teamList = teamQuery.data?.listTeam
        .where((element) => element.teamCode == teamName);
    if (teamList!.isNotEmpty) {
      team = teamList.first;
    } else {
      emit(MemberTournamentFirestoreError(msg: "Le code équipe n'existe pas !"));
      // errorSign = true;
    }
    return team;
  }


  Future<void> sendEmailMessage() async {
    SmtpServer smtpServer = paramEmail();
    Message message = createMessage();

    await showReport(message, smtpServer);
  }

  SmtpServer paramEmail() {
    String username = "tamoro974@gmail.com";
    String token = "fftvuferdeyhpqqh";
    // String password = 'AIzaSyC67O8S6jcsHAnV0ursdHN2gTcjeaj76wA';
    // String password = 'fgmpfizenmfzmdlb';

    final smtpServer = gmail(username, token);
    return smtpServer;
  }

  Message createMessage() {
    final message = Message()
      ..from = const Address("contact@o-spawn.re", "O-Spawn")
      ..recipients.add(FirebaseAuth.instance.currentUser!.email)
      // ..ccRecipients.addAll(["destCc1@example.com", "destCc2@example.com"])
      ..bccRecipients.add(const Address("bccAddress@example.com"))
      ..subject = "Test Dart Mailer library :: 😀 :: ${DateTime.now()}"
      ..text = "This is the plain text.\nThis is line 2 of the text part."
      ..html = "<h1>Test</h1>\n<p>Hey! Here's some HTML content</p>";
    return message;
  }

  Future<void> showReport(Message message, SmtpServer smtpServer) async {
    try {
      final sendReport = await send(message, smtpServer);
      print("Message sent: " + sendReport.toString());
    } on MailerException catch (e) {
      print("$e Message not sent.");
      for (var p in e.problems) {
        print("Problem: ${p.code}: ${p.msg}");
      }
    }
  }
  Future<Team?> verifTeamName(Team? team,String teamName) async {
    team = await (Team? team) async {
      TournamentDocumentSnapshot teamQuery =
      await tournamentsRef.doc(tournament.documentId).get();
      Iterable<Team>? teamList = teamQuery.data?.listTeam
          .where((element) => element.name == teamName);
      if (teamList!.isEmpty) {
        team = Team(name: teamName);
        teamsRef.add(team);
      } else {
        emit(MemberTournamentFirestoreError(msg: "Le nom de cette team existe déjà !"));
        // msgSnack = "Le nom de cette team existe déjà !";
        // errorSign = true;
      }
      return team;
    }(team);
    return team;
  }


  addTeamInTournament(Team team) async {
    tournament.listTeam.add(team);
    await tournamentsRef
        .doc(tournament.documentId)
        .set(tournament);
  }

  Future<FutureOr<void>> _addMemberTournament(MemberTournamentFirestoreAdd event, Emitter<MemberTournamentFirestoreState> emit) async {

    if (event.teamName != "" && event.gamerTag != "") {
      Member? member = await Authentification().selectMemberConnected();
      if(member != null) {
        Team? team;
        if (isLeader(event.roleType)) {
          team = await verifTeamName(team, event.teamName);
          if (team != null) {
            team.teamCode = getRandomString(5);
            addTeamInTournament(team);
          }
        } else if (isPlayer(event.roleType)) {
          team = await verifCodeTeam(team, event.teamName);
        }
        if (team != null) {
          await addMemberTournamentInFirebase(member, team, event.gamerTag, event.roleType);
          // afterAddMemberTournament();
        }
      } else {
        print("Membre non connecter !");
      }

    } else {
      emit(MemberTournamentFirestoreError(msg: "Veuillez renseigner le gamerTag et nom/code de team !"));
      // msgSnack = "Veuillez renseigner le gamerTag et nom/code de team !";
      // errorSign = true;
    }
  }
}
