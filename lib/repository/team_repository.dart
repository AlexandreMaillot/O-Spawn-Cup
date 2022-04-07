import 'dart:async';
import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:o_spawn_cup/models/Member/member.dart';
import 'package:o_spawn_cup/models/MemberTournament/member_tournament.dart';
import 'package:o_spawn_cup/models/Team/team.dart';
import 'package:o_spawn_cup/models/Tournament/tournament.dart';
import 'package:o_spawn_cup/models/role_type.dart';
import 'package:o_spawn_cup/repository/member_tounament_repository.dart';

class TeamRepository {
  TeamCollectionReference teamCollectionReference;
  late Tournament tournament;
  List<Team> listTeam = [];
  late Stream<List<Team>> listTeamStream;
  TeamRepository({required this.teamCollectionReference,}){
    init();
  }

  init() async{
    loadTournament();
    listTeamStream = teamCollectionReference.snapshots()
        .map((event) => event.docs.where((element) => element.data.isDisqualified == false)
        .map((teamDoc) {
          Team team = teamDoc.data;
          team.documentId = teamDoc.id;

          return team;
        }).toList());

    listTeamStream.listen((event) async {
      for (var team in event) {
        await addListMemberTournamentInTeam(team);
      }

      listTeam = event;
    });
  }

  Stream<List<MemberTournament>> listAllMemberTournamentInTeamCollection() {
    return teamCollectionReference.reference.firestore.collectionGroup('membersTournament')
        .snapshots()
        .map((event) => event.docs
        .map((e) {
          var memberTournament = MemberTournament.fromJson(e.data());
          memberTournament.documentId = e.id;
          return memberTournament;
        }).toList());
  }
  Future<void> addListMemberTournamentInTeam(Team team) async {
    var memberTournament = await teamCollectionReference.doc(team.documentId).membersTournament.get();
    team.listMemberTournament = memberTournament.docs.map((e) => e.data).toList();
  }

  Future<void> loadTournament() async {
    var tournamentDocument = await teamCollectionReference.parent.get();
    tournament = tournamentDocument.data!;
  }
  bool disqualifiedTeamWithNoMember(Team team){
    if(team.listMemberTournament.isEmpty){
      team.isDisqualified = true;
    }
    teamCollectionReference.doc(team.documentId).set(team);
    return team.isDisqualified;
  }
  int numberTeamInTournament() {
     return listTeam.length;
  }
  Future<bool> checkNameTeam(String name) async {
    var teamExistWithName = listTeam.where((element) => element.name == name);
    if(teamExistWithName.isNotEmpty){
      return false;
    } else {
      return true;
    }

  }

  DocumentReference<Team> getTeamDocumentReference(Team team){
    return teamCollectionReference.doc(team.documentId).reference;
  }
  Future<TeamDocumentSnapshot?> findTeamWithCode(String teamCode) async {
    var teamExistWithCode = listTeam.where((element) => element.teamCode == teamCode);
    if(teamExistWithCode.isNotEmpty){
      return await teamCollectionReference.doc(teamExistWithCode.first.documentId).get();
    } else {
      return null;
    }
  }

  String generateCodeTeam(String beforeCode,int length){
    const String _chars = 'AaBbCcDdEeFfGgHhIiJjKkLlMmNnOoPpQqRrSsTtUuVvWwXxYyZz1234567890';
    final Random _rnd = Random();
    String code = beforeCode + String.fromCharCodes(Iterable.generate(length, (_) => _chars.codeUnitAt(_rnd.nextInt(_chars.length))));
    return code;
  }
  Future<TeamDocumentReference> addTeamInTournament(Team team,) async {
    return await teamCollectionReference.add(team);
  }

  Stream<List<Team>> listTeamsInTournament() {
    return listTeamStream;
  }

  Future<bool> checkTeamCapacity(Team team) async {
    if(team.listMemberTournament.length + 1 <= tournament.tournamentType.capacityTeam) {
      return true;
    } else {
      return false;
    }
  }

  Future<bool> checkTournamentCapacity() async {
    var numberTeam = numberTeamInTournament();
    if(tournament.capacity - numberTeam + 1 > 0){
      return true;
    } else {
      return false;
    }
  }
}