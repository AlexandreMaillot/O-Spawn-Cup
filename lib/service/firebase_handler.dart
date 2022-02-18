import 'dart:io';
import 'dart:math';

import 'package:firebase_auth/firebase_auth.dart';
import "package:firebase_storage/firebase_storage.dart" as firebase_storage;
import 'package:o_spawn_cup/models/Member/member.dart';
import 'package:o_spawn_cup/models/Team/team.dart';
import 'package:o_spawn_cup/models/Tournament/tournament.dart';
import 'package:o_spawn_cup/models/Tournament/tournament_state.dart';
import 'package:o_spawn_cup/models/TournamentType/tournament_type.dart';
import 'package:o_spawn_cup/models/game_name.dart';
import 'package:o_spawn_cup/models/server_type.dart';
import 'package:o_spawn_cup/service/authentification.dart';
import 'package:o_spawn_cup/service/generate_code.dart';
import 'dart:developer' as dev;
import '../models/MemberTournament/member_tournament.dart';
import '../models/role_type.dart';

class FirebaseHandler {
  static final storageRef = firebase_storage.FirebaseStorage.instance.ref();

  Future<String> addImageToStorage(
      firebase_storage.Reference ref, File file) async {
    firebase_storage.UploadTask task = ref.putFile(file);
    firebase_storage.TaskSnapshot snapshot =
        await task.whenComplete(() => null);
    String urlString = await snapshot.ref.getDownloadURL();
    return urlString;
  }

  Future<Tournament> addTournamentFirebase(
      String name,
      int date,
      GameName game,
      ServerType server,
      TournamentType tournamentType,
      int capacity,
      String cashPrize,
      int roundNumber,
      int killPointTournament,
      File file) async {
    final ref = firebase_storage.FirebaseStorage.instance
        .ref()
        .child("tournaments")
        .child(DateTime.now().millisecondsSinceEpoch.toInt().toString());
    final urlString = await addImageToStorage(ref, file);
    Tournament tournament = Tournament(
      name: name,
      date: date,
      game: game,
      server: server,
      tournamentType: tournamentType,
      capacity: capacity,
      cashPrize: cashPrize,
      roundNumber: roundNumber,
      killPointTournament: killPointTournament,
      imageUrl: urlString,
    );
    tournamentsRef.add(tournament);
    return tournament;
  }

  Member addMemberFirebase(String pseudo, String uid) {
    Member member = Member(pseudo: pseudo, uid: uid);
    membersRef.doc(uid).set(member);
    return member;
  }

  Future<Team?> addTeamInTournament(Tournament tournament, Team team, String gamerTag) async {
    if (await verifMemberAlreadySign(tournament)) {
      List<Team> listTeamTournament = await getTeamsInTournament(tournament);
      if (verifTeamName(listTeamTournament, team.name)) {
        team.teamCode =
            Utils().generateCode(tournament.documentId!.substring(0, 5), 5);
        var teamDoc =
            await tournamentsRef.doc(tournament.documentId).teams.add(team);
        team.documentId = teamDoc.id;
        addMemberTournamentInTeam(tournament, team, gamerTag, RoleType.leader);
        return team;
      } else {
        print("Le team existe déjà");
        return null;
      }
    }
  }
  // Team? team = findTeamWithCode(listTeams, teamCode);

  addMemberWithCodeTeam(
      Tournament tournament, String teamCode, String gamerTag) async {
    if (await verifMemberAlreadySign(tournament)) {
      List<Team> listTeam = await getTeamsInTournament(tournament);
      Team? team = findTeamWithCode(listTeam, teamCode);

      if (team != null) {
        if(await verifCapacityTeam(tournament,team)) {
          addMemberTournamentInTeam(tournament, team, gamerTag, RoleType.player);
        } else {
          print("capacité atteint");
        }
      } else {
        print("code erronée");
      }
    }
  }

  addMemberTournamentInTeam(Tournament tournament, Team team, String gamerTag,
      RoleType roleType) async {
    Member? member = await Authentification().selectMemberConnected();
    if (member != null) {
      MemberTournament memberTournament = MemberTournament(
        gamerTag: gamerTag,
        role: roleType,
        member: member,
      );
      var memberTournamentDoc = await tournamentsRef
          .doc(tournament.documentId)
          .teams
          .doc(team.documentId)
          .membersTournament
          .add(memberTournament);
    } else {
      print("Erreur membre");
    }
  }

  Future<bool> verifStateCup(int teamNumberValidate,Tournament tournament) async {
    if(tournament.capacity - teamNumberValidate == 0){
      tournament.state = TournamentState.inscriptionFermer;
      return await tournamentsRef.doc(tournament.documentId).set(tournament).then((value) => true).catchError((onError) => false);
    } else {
      return false;
    }
  }
  Future<bool> verifMemberAlreadySign(Tournament tournament) async {
    Member? member = await Authentification().selectMemberConnected();
    if (member != null) {
      var listTeam =
          await tournamentsRef.doc(tournament.documentId).teams.get();
      for (var element in listTeam.docs) {
        var listMemberTournament =
            await element.reference.membersTournament.get();
        for (var element in listMemberTournament.docs) {
          if (element.data.member.uid == member.uid) {
            print("Membre connecter deja inscrit");
            return false;
          }
        }
      }
      return true;
    } else {
      return false;
    }
  }
  Future<bool> verifCapacityTeam(Tournament tournament,Team team) async {
    var listMember = [];
    listMember = await tournamentsRef.doc(tournament.documentId).teams.doc(team.documentId).membersTournament.get().then((value) => value.docs.map((e) => e.data).toList());
    if(listMember.length <= tournament.tournamentType.capacityTeam){
      return true;
    } else {
      return false;
    }

  }

  Future<List<Team>> getTeamsInTournament(Tournament tournament) async {
    List<Team> listTeam = [];
    var listTeamSnap = await tournamentsRef
        .doc(tournament.documentId)
        .teams
        .get()
        .then((value) => value.docs.map((e) => e).toList());
    for (var element in listTeamSnap) {
      element.data.documentId = element.id;
      listTeam.add(element.data);
    }
    return listTeam;
  }

  Future<List<MemberTournament>> getMemberTournamentInTournament(
      Tournament tournament, Team team) async {
    List<MemberTournament> listMemberTournament = [];

    var listMemberTournamentSnap = await tournamentsRef
        .doc(tournament.documentId)
        .teams
        .doc(team.documentId)
        .membersTournament
        .get()
        .then((value) => value.docs.map((e) => e).toList());
    for (var element in listMemberTournamentSnap) {
      element.data.documentId = element.id;
      listMemberTournament.add(element.data);
    }
    return listMemberTournament;
  }

  Future<Member?> getMemberInTournament(Tournament tournament, Team team,
      MemberTournament memberTournament) async {
    Member? mymember;
    var listMemberSnap = await tournamentsRef
        .doc(tournament.documentId)
        .teams
        .doc(team.documentId)
        .membersTournament
        .doc(memberTournament.documentId)
        .members
        .get()
        .then((value) => value.docs.map((e) => e).toList());
    for (var element in listMemberSnap) {
      mymember = element.data;
    }

    return mymember;
  }

  Team? findTeamWithCode(List<Team> teams, String code) {
    List<Team> teamWithCode =
        teams.where((element) => element.teamCode == code).toList();
    if (teamWithCode.isNotEmpty) {
      return teamWithCode.first;
    } else {
      return null;
    }
  }


  Future<bool> disqualificationMember(Tournament tournament,Team team,MemberTournament memberTournament) async {
      return await tournamentsRef.doc(tournament.documentId).teams.doc(team.documentId).membersTournament.doc(memberTournament.documentId).delete()
          .then((value) {
            return true;
          })
          .catchError((error) => false);

  }
  Future<bool> verifTeamEmpty(Tournament tournament,Team team,) async {
    return await tournamentsRef.doc(tournament.documentId).teams.doc(team.documentId).membersTournament.get().then((value) {
      if(value.docs.isEmpty){
        tournamentsRef.doc(tournament.documentId).teams.doc(team.documentId).delete().then((value) => true).catchError((error) => false);
        return true;
      } else {
        return false;
      }
    });
  }
  bool verifTeamName(List<Team> teams, String name) {
    List<Team> teamWithCode =
        teams.where((element) => element.name == name).toList();
    if (teamWithCode.isEmpty) {
      return true;
    } else {
      return false;
    }
  }

}
