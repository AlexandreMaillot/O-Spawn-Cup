import "dart:io";
import "dart:math";

import "package:firebase_auth/firebase_auth.dart";
import "package:firebase_storage/firebase_storage.dart" as firebase_storage;
import "package:o_spawn_cup/models/Member/member.dart";
import "package:o_spawn_cup/models/Round/round.dart";
import "package:o_spawn_cup/models/Team/team.dart";
import "package:o_spawn_cup/models/Tournament/tournament.dart";
import "package:o_spawn_cup/models/Tournament/tournament_state.dart";
import "package:o_spawn_cup/models/TournamentType/tournament_type.dart";
import "package:o_spawn_cup/models/game_name.dart";
import "package:o_spawn_cup/models/server_type.dart";
import "package:o_spawn_cup/service/authentification.dart";
import "package:o_spawn_cup/service/utils.dart";
import "package:flutter/services.dart" show rootBundle;
import "dart:developer" as dev;
import "../models/MemberTournament/member_tournament.dart";
import "../models/role_type.dart";

enum FirebaseStatusEvent { teamExist, teamFull,changeRowSuccess, disqualifiedSuccess,disqualifiedFail, codeNotFound, memberNotConnect, cupFull, cupStateChangeSuccess, cupStateChangeFail, memberAlreadySign,memberSignSuccess, teamNotEmpty}
class FirebaseHandler {
  Member? member;
  FirebaseHandler(){
    Authentification().selectMemberConnected().listen((event) {
      member = event.data;
    });
  }

  static final storageRef = firebase_storage.FirebaseStorage.instance.ref();

  Future<String> addImageToStorage(
      firebase_storage.Reference ref, File file,bool takeByCamera) async {
    firebase_storage.UploadTask task;
    if(takeByCamera){
      task = ref.putFile(file);
    } else {
      final byteData = await rootBundle.load(file.path);
      task = ref.putData(byteData.buffer.asUint8List(byteData.offsetInBytes, byteData.lengthInBytes));
    }
    firebase_storage.TaskSnapshot snapshot =
        await task.whenComplete(() => null);
    String urlString = await snapshot.ref.getDownloadURL();
    return urlString;
  }

  checkTournamentState(Tournament tournament){

    DateTime dateTimeNow = DateTime.now();
    if(tournament.state == TournamentState.inscriptionFermer) {

      if(tournament.dateDebutInscription!.isBefore(dateTimeNow)){
        tournament.state = TournamentState.incriptionOuverte;
        modifTournament(tournament);
      }
    }
    if(tournament.state == TournamentState.incriptionOuverte || tournament.state == TournamentState.inscriptionFermer) {
      if(tournament.dateDebutTournois!.isBefore(dateTimeNow)){
        tournament.state = TournamentState.enCours;
        modifTournament(tournament);
      }
    }

  }
  cupClose(Tournament tournament){
    tournament.state = TournamentState.terminer;
    modifTournament(tournament);
  }
  modifTournament(Tournament tournament){
    tournamentsRef.doc(tournament.documentId).set(tournament);
  }
  Future<Tournament> addTournamentFirebase(
      String name,
      DateTime dateDebutInscription,
      DateTime dateDebutTournois,
      GameName game,
      ServerType server,
      TournamentType tournamentType,
      int capacity,
      List<String> cashPrize,
      int roundNumber,
      int killPointTournament,
      int pointPerRangTournament,
      int rangStartTournament,
      File file,
      bool takeByCamera,
      ) async {
    final ref = getRefFirestorage();
    final urlString = await addImageToStorage(ref, file,takeByCamera);
    Tournament tournament = Tournament(
      name: name,
      dateDebutTournois: dateDebutTournois,
      dateDebutInscription: dateDebutInscription,
      game: game,
      server: server,
      tournamentType: tournamentType,
      capacity: capacity,
      cashPrize: cashPrize,
      roundNumber: roundNumber,
      killPointTournament: killPointTournament,
      pointPerRangTournament: pointPerRangTournament,
      rangStartTournament: rangStartTournament,
      imageUrl: urlString,
    );
    var idTournament = await tournamentsRef.add(tournament);
    for(int i = 1; i < roundNumber;i++){
      Round round = Round(roundNumber: i);
      tournamentsRef.doc(idTournament.id).rounds.add(round);
    }

    return tournament;
  }

  firebase_storage.Reference getRefFirestorage() {
    return firebase_storage.FirebaseStorage.instance
      .ref()
      .child("tournaments")
      .child(DateTime.now().millisecondsSinceEpoch.toInt().toString());
  }

  Member addMemberFirebase(String pseudo, String uid) {
    Member member = Member(pseudo: pseudo, uid: uid);
    membersRef.doc(uid).set(member);
    return member;
  }

  Future<List> addTeamInTournament(Tournament tournament, Team team, String gamerTag) async {
    if (await verifMemberAlreadySign(tournament)) {
      List<Team> listTeamTournament = await getTeamsInTournament(tournament);
      if (verifTeamName(listTeamTournament, team.name)) {
        team.teamCode =
            Utils().generateCode(tournament.documentId!.substring(0, 5), 5);
        var teamDoc =
            await tournamentsRef.doc(tournament.documentId).teams.add(team);
        team.documentId = teamDoc.id;
        if(await addMemberTournamentInTeam(tournament, team, gamerTag, RoleType.leader) == true){
          return [FirebaseStatusEvent.memberSignSuccess,team];
        } else {
          return [FirebaseStatusEvent.memberNotConnect,null];
        }

      } else {
        print("Le team existe déjà");
        return [FirebaseStatusEvent.teamExist,null];
      }
    }else {
      return [FirebaseStatusEvent.memberAlreadySign,null];
    }
  }
  // Team? team = findTeamWithCode(listTeams, teamCode);

  Future<FirebaseStatusEvent> addMemberWithCodeTeam(
      Tournament tournament, String teamCode, String gamerTag) async {
    if (await verifMemberAlreadySign(tournament) == true) {
      List<Team> listTeam = await getTeamsInTournament(tournament);
      Team? team = findTeamWithCode(listTeam, teamCode);

      if (team != null) {
        if(await verifCapacityTeam(tournament,team)) {
          if(await addMemberTournamentInTeam(tournament, team, gamerTag, RoleType.player)) {

            return FirebaseStatusEvent.memberSignSuccess;
          } else {
            return FirebaseStatusEvent.memberNotConnect;
          }
        } else {
          print("capacité atteint");
          return FirebaseStatusEvent.teamFull;
        }
      } else {
        print("code erronée");
        return FirebaseStatusEvent.codeNotFound;
      }
    } else {
      return FirebaseStatusEvent.memberAlreadySign;
    }
  }

  Future<bool> addMemberTournamentInTeam(Tournament tournament, Team team, String gamerTag,
      RoleType roleType) async {

    if (member != null) {
      MemberTournament memberTournament = MemberTournament(
        gamerTag: gamerTag,
        role: roleType,
        member: member!,
      );
      var memberTournamentDoc = await tournamentsRef
          .doc(tournament.documentId)
          .teams
          .doc(team.documentId)
          .membersTournament
          .add(memberTournament);
      return true;
    } else {
      print("Membre not connect");
      return false;
    }
  }

  Future<bool> verifStateCup(int teamNumberValidate,Tournament tournament) async {
    if(tournament.capacity - teamNumberValidate == 0){
      tournament.state = TournamentState.complet;
      return await tournamentsRef.doc(tournament.documentId).set(tournament).then((value) => true).catchError((onError) => false);
    } else {
      return false;
    }
  }
  Future<bool> verifMemberAlreadySign(Tournament tournament) async {
      var listTeam =
          await tournamentsRef.doc(tournament.documentId).teams.get();
      for (var element in listTeam.docs) {
        var listMemberTournament =
            await element.reference.membersTournament.get();
        for (var element in listMemberTournament.docs) {
          if (element.data.member.uid == member!.uid) {
            print("Membre connecter deja inscrit");
            return false;
          }
        }
      }
      return true;
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


  Future<FirebaseStatusEvent> disqualificationMember(Tournament tournament,Team team,MemberTournament memberTournament) async {
      return await tournamentsRef.doc(tournament.documentId).teams.doc(team.documentId).membersTournament.doc(memberTournament.documentId).delete()
          .then((value) {
            return FirebaseStatusEvent.disqualifiedSuccess;
          })
          .catchError((error) => FirebaseStatusEvent.disqualifiedFail);

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
