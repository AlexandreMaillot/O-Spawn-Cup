import 'package:fake_cloud_firestore/fake_cloud_firestore.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:o_spawn_cup/models/Team/team.dart';
import 'package:o_spawn_cup/models/Tournament/tournament.dart';
import 'package:o_spawn_cup/models/TournamentType/tournament_type.dart';
import 'package:o_spawn_cup/models/game_name.dart';
import 'package:o_spawn_cup/models/server_type.dart';
import 'package:o_spawn_cup/repository/team_repository.dart';
import 'package:o_spawn_cup/repository/tournament_repository.dart';

class MockTournamentRepository extends Mock implements TournamentRepository{}
void main() {
  DateTime now = DateTime.now();
  late FakeFirebaseFirestore instance;
  late TeamRepository teamRepository;
  late TournamentCollectionReference tournamentsRef;
  late TeamCollectionReference teamsRef;
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
  setUp(() async {
    instance = FakeFirebaseFirestore();
    tournament4.documentId = "id4";
    await instance.collection('Tournament').doc("id4").set(tournament4.toJson());
    tournamentsRef = TournamentCollectionReference(instance);
    tournamentsRef.doc("id4").teams.add(Team(name: "MyTeam"));
    teamsRef = TeamCollectionReference(tournamentsRef.doc("id4").reference);
    teamRepository = TeamRepository(teamCollectionReference: teamsRef);

  });

  test('List all team in tournament', () {
    expect(teamRepository.listTeamsInTournament(), emits([Team(name: "MyTeam")]));
  });
  test('team name exist', () {

  });
  test('find team with code team', () {

  });
  test('generate code team', () {

  });
  test('check team is full', () {

  });
  test('create team with leader', () {

  });
  test('add member in team', () {

  });
  test('delete member in team', () {

  });
  test('delete in no member', () {

  });
  test('count team', () async {
    // when(() async => await tournamentsRef.doc(tournament4.documentId).teams.get()).thenAnswer((_) => );
    // expect(await tournamentRepository.countTeamInTournament(tournament4), 0);
  });
  test('get Team in tournament', () {
    // expect(tournamentRepository.listTeamsInTournament(tournament4), true);
  });

  test('add Team in tournament', () {
    // expect(tournamentRepository.addTeamInTournament(tournament4), true);
  });
  test('check tournament team full', () {
    // when(() => tournamentRepository.countTeamInTournament(tournament4)).thenAnswer((_) => Future.value(10));
    // expect(tournamentRepository.checkTournamentIsFull(tournament4), true);
  });
}