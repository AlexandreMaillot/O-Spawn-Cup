import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:o_spawn_cup/models/Tournament/tournament.dart';
import 'package:o_spawn_cup/models/Tournament/tournament_state.dart';
import 'package:o_spawn_cup/models/TournamentType/tournament_type.dart';
import 'package:o_spawn_cup/models/game_name.dart';
import 'package:o_spawn_cup/models/server_type.dart';
import 'package:o_spawn_cup/repository/tournament_repository.dart';
import 'package:fake_cloud_firestore/fake_cloud_firestore.dart';

void main() {

  late TournamentRepository tournamentRepository;
  DateTime now = DateTime.now();
  DateTime dateStartSign = DateTime(now.year,now.month,now.day + 1);
  late TournamentCollectionReference tournamentsRef;
  List<Tournament> listTournaments = [
    Tournament(name: "Tournois 1",
        dateDebutTournois: DateTime(now.year,now.month,now.day + 7),
        game: GameName.LeagueOfLegend,
        server: ServerType.EU,
        tournamentType: TournamentType.quintet,
        capacity: 33,
        roundNumber: 3,
        dateDebutInscription: DateTime(now.year,now.month + 1,now.day + 7),
        killPointTournament: 1,
        pointPerRangTournament: 1,
        rangStartTournament: 15,
        cashPrize: ["Mon lot 1","Mon lot 2","Mon lot 3"],
        listCodesGames: ["MonCode1","MonCode2","MonCode3",]),

    Tournament(name: "Tournois 2",
        dateDebutTournois: DateTime(now.year,now.month,now.day + 3),
        game: GameName.LeagueOfLegend,
        server: ServerType.EU,
        tournamentType: TournamentType.quintet,
        capacity: 33,
        roundNumber: 3,
        dateDebutInscription: DateTime(now.year,now.month + 1,now.day + 3),
        killPointTournament: 1,
        pointPerRangTournament: 1,
        rangStartTournament: 15,
        cashPrize: ["Mon lot 1","Mon lot 2","Mon lot 3"],
        listCodesGames: ["MonCode1","MonCode2","MonCode3",]),
    Tournament(name: "Tournois 3",
        dateDebutTournois: DateTime(now.year,now.month,now.day + 5),
        game: GameName.Fornite,
        server: ServerType.EU,
        tournamentType: TournamentType.trio,
        capacity: 33,
        roundNumber: 3,
        dateDebutInscription: DateTime(now.year,now.month + 1,now.day + 5),
        killPointTournament: 1,
        pointPerRangTournament: 1,
        rangStartTournament: 15,
        cashPrize: ["Mon lot 1","Mon lot 2","Mon lot 3"],
        listCodesGames: ["MonCode1","MonCode2","MonCode3",]),
  ];
  setUp(() async {
    final instance = FakeFirebaseFirestore();
    listTournaments[0].state = TournamentState.enCours;
    for (var element in listTournaments) {
      await instance.collection('Tournament').add(element.toJson());
    }
    tournamentsRef = TournamentCollectionReference(instance);
    tournamentRepository = TournamentRepository(tournamentCollectionReference: tournamentsRef);
  });
  test('list tournaments no filter', () async {
    listTournaments.sort((a, b) => b.dateDebutTournois!.compareTo(a.dateDebutTournois ?? DateTime.now()));
    expect(tournamentRepository.listTournaments(gameName: null), emits(listTournaments),);
  });
  test('list tournaments order by date', () {
    listTournaments.sort((a, b) => b.dateDebutTournois!.compareTo(a.dateDebutTournois ?? DateTime.now()));
    expect(tournamentRepository.listTournaments(gameName: null), emits(listTournaments),);
  });
  test('list tournaments filter by game', () {
    expect(tournamentRepository.listTournaments(gameName: GameName.LeagueOfLegend), emits(listTournaments.where((element) => element.game == GameName.LeagueOfLegend)),);
  });

  test('list tournaments filter by name', () {
    expect(tournamentRepository.listTournaments(gameName: null,name: "Tournois 2"), emits(listTournaments.where((element) => element.name == "Tournois 2")),);
  });
  test('list tournaments filter by date start cup', () {
    var date = DateTime(now.year,now.month,now.day + 4);
    expect(tournamentRepository.listTournaments(gameName: null,dateStart: date), emits(listTournaments.where((element) => element.dateDebutTournois!.isAfter(date))));
  });
   test('list tournaments filter by state', () {
     expect(tournamentRepository.listTournaments(gameName: null,tournamentState: TournamentState.enCours), emits(listTournaments.where((element) => element.state == TournamentState.enCours)));
  });
  test('list tournaments filter by type', () {
    expect(tournamentRepository.listTournaments(gameName: null,tournamentType: TournamentType.trio), emits(listTournaments.where((element) => element.tournamentType == TournamentType.trio)));
  });
  // test('change state auto for start sign cup', () {
  //
  // });
  // test('change state auto for start cup', () {
  //
  // });
  // test('change state tournament', () {
  //
  // });
  // test('add tournament', () {
  //
  // });
  // test('modif tournament', () {
  //
  // });
  // test('delete tournament', () {
  //
  // });
  // test('id tournament not null', () {
  //
  // });
}