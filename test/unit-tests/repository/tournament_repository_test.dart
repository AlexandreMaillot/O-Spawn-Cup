import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
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
  late TournamentCollectionReference tournamentsRef;
  late FakeFirebaseFirestore instance;
  late QuerySnapshot<Map<String, dynamic>> snapshot;
  Tournament tournament4 = Tournament(name: "Tournois 4",
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
      listCodesGames: ["MonCode1","MonCode2","MonCode3",]);
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
    instance = FakeFirebaseFirestore();
    listTournaments[0].state = TournamentState.enCours;
    listTournaments[0].documentId = "id1";
    listTournaments[1].documentId = "id2";
    listTournaments[2].documentId = "id3";
    int index = 0;
    for (var element in listTournaments) {
      index++;
      await instance.collection('Tournament').doc("id$index").set(element.toJson());
    }
    tournamentsRef = TournamentCollectionReference(instance);
    tournamentRepository = TournamentRepository(tournamentCollectionReference: tournamentsRef);
  });
  group("Liste les tournois avec filtre", (){
    test('list tournaments no filter expect order', () async {
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
  });



  test('change state tournament', () async {
    tournamentRepository.changeStateTournament(listTournaments[0], TournamentState.annuler);

    snapshot = await instance.collection('Tournament').get();
    var snapTournament = await snapshot.docs.first.reference.get();
    var tournament = snapTournament.data();
    expect(tournament!["state"], TournamentState.annuler.name);
  });
  test('add tournament', () async {
    tournamentRepository.addTournamentInFirebase(tournament4);
    snapshot = await instance.collection('Tournament').get();
    expect(snapshot.docs.length, 4);
  });
  test('modif tournament', () async {

    listTournaments[0].name = "Name modifie";
    tournamentRepository.modifTournamentInFirebase(listTournaments[0]);

    snapshot = await instance.collection('Tournament').get();
    var snapTournament = await snapshot.docs.first.reference.get();
    var tournament = snapTournament.data();
    expect(tournament!["name"], "Name modifie");
  });
  test('delete tournament', () async {
    tournamentRepository.deleteTournamentInFirebase("id3");
    snapshot = await instance.collection('Tournament').get();

    expect(snapshot.docs.length, listTournaments.where((element) => element.documentId != "id3").length);
  });
  test('id tournament not null', () async {
    listTournaments.sort((a, b) => b.dateDebutTournois!.compareTo(a.dateDebutTournois ?? DateTime.now()));
    expect(tournamentRepository.listTournaments(gameName: null), emits(listTournaments.where((element) => element.documentId != null)));
  });


  group("Changement automatique état des tournois", (){
    test('change state auto for start sign cup', () async {
      DateTime nexDateInscription = DateTime(now.year,now.month,now.day,now.hour - 1);
      listTournaments[2].dateDebutInscription = nexDateInscription;
      tournamentRepository.checkTournamentState(listTournaments[2]);

      snapshot = await instance.collection('Tournament').get();
      var snapTournament = await snapshot.docs[2].reference.get();
      var tournament = snapTournament.data();
      expect(tournament!["state"], TournamentState.incriptionOuverte.name);
    });
    test('change state auto for start cup', () async {
      DateTime nexDateStart = DateTime(now.year,now.month,now.day,now.hour - 1);
      listTournaments[2].dateDebutTournois = nexDateStart;
      tournamentRepository.checkTournamentState(listTournaments[2]);
      snapshot = await instance.collection('Tournament').get();
      var snapTournament = await snapshot.docs[2].reference.get();
      var tournament = snapTournament.data();
      expect(tournament!["state"], TournamentState.enCours.name);
      tournamentRepository.checkTournamentState(listTournaments[2]);

    });
  });
}