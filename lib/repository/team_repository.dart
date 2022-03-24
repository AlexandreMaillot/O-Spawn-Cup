import 'dart:async';
import 'dart:math';

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
    _init();
  }

  Future _init() async{
    loadTournament();
    listTeamStream = teamCollectionReference.snapshots()
        .map((event) => event.docs
        .map((teamDoc) {
          Team team = teamDoc.data;
          team.documentId = teamDoc.id;
          return team;
        }).toList());

    listTeamStream.listen((event) {
      listTeam = event;
    });
  }

  Future<void> loadTournament() async {
    var tournamentDocument = await teamCollectionReference.parent.get();
    tournament = tournamentDocument.data!;
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
  Team? findTeamWithCode(String teamCode){
    var teamExistWithCode = listTeam.where((element) => element.teamCode == teamCode);
    if(teamExistWithCode.isNotEmpty){
      return teamExistWithCode.first;
    } else {
      return null;
    }
  }

  String generateCodeTeam(String beforeCode,int length){
    const String _chars = "AaBbCcDdEeFfGgHhIiJjKkLlMmNnOoPpQqRrSsTtUuVvWwXxYyZz1234567890";
    final Random _rnd = Random();
    String code = beforeCode + String.fromCharCodes(Iterable.generate(length, (_) => _chars.codeUnitAt(_rnd.nextInt(_chars.length))));
    return code;
  }
  addTeamInTournament(Team team,Member member,String gamerTag){
    teamCollectionReference.add(team);
  }

  Stream<List<Team>> listTeamsInTournament() {
    return listTeamStream;
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