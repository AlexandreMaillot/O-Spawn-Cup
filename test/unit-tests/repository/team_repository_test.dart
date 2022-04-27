import 'package:fake_cloud_firestore/fake_cloud_firestore.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:o_spawn_cup/models/Member/member.dart';
import 'package:o_spawn_cup/models/MemberTournament/member_tournament.dart';
import 'package:o_spawn_cup/models/TournamentType/tournament_type.dart';
import 'package:o_spawn_cup/models/game_name.dart';
import 'package:o_spawn_cup/models/role_type.dart';
import 'package:o_spawn_cup/models/server_type.dart';
import 'package:o_spawn_cup/models/team/team.dart';
import 'package:o_spawn_cup/models/tournament/tournament.dart';
import 'package:o_spawn_cup/repository/team_repository.dart';

class MockTeam extends Mock implements Team {}

void main() {
  final now = DateTime.now();
  late FakeFirebaseFirestore instance;
  late TeamRepository teamRepository;
  late TournamentCollectionReference tournamentsRef;
  late TeamCollectionReference teamsRef;
  final listTeam = <Team>[
    const Team(
      name: 'MyTeam1',
      documentId: 'id1',
      teamCode: '1234',
    ),
    const Team(
      name: 'MyTeam2',
      documentId: 'id2',
    ),
    const Team(
      name: 'MyTeam3',
      documentId: 'id3',
    ),
  ];
  const memberTournament = MemberTournament(
    gamerTag: '',
    role: RoleType.player,
    member: Member(uid: ''),
  );

  final tournament4 = Tournament(
    name: 'Tournois 4',
    dateDebutTournois: DateTime(now.year, now.month, now.day + 7),
    game: GameName.leagueOfLegend,
    server: ServerType.eu,
    tournamentType: TournamentType.quintet,
    capacity: 33,
    roundNumber: 3,
    dateDebutInscription: DateTime(now.year, now.month + 1, now.day + 7),
    killPointTournament: 1,
    pointPerRangTournament: 1,
    rangStartTournament: 15,
    cashPrize: const [
      'Mon lot 1',
      'Mon lot 2',
      'Mon lot 3',
    ],
    listCodesGames: const [
      'MonCode1',
      'MonCode2',
      'MonCode3',
    ],
  );
  setUp(() async {
    instance = FakeFirebaseFirestore();
    tournament4.documentId = 'id4';
    await instance
        .collection('Tournament')
        .doc('id4')
        .set(tournament4.toJson());
    tournamentsRef = TournamentCollectionReference(instance);
    await tournamentsRef.doc('id4').teams.doc('id1').set(listTeam.first);
    await tournamentsRef.doc('id4').teams.doc('id2').set(listTeam[1]);
    await tournamentsRef.doc('id4').teams.doc('id3').set(listTeam[2]);

    teamsRef = TeamCollectionReference(tournamentsRef.doc('id4').reference);
    for (var i = 0; i <= 10; i++) {
      await teamsRef.doc('id3').membersTournament.add(memberTournament);
    }

    teamRepository = TeamRepository(teamCollectionReference: teamsRef);
  });
  test('list collection member tournament ', () async {
    final list = await teamsRef.doc('id3').membersTournament.get();
    final listMemberTournament = list.docs.map((e) {
      return e.data.copyWith(documentId: e.id);
    }).toList();
    expect(
      teamRepository.listAllMemberTournamentInTeamCollection(),
      emits(listMemberTournament),
    );
  });
  test('List all team in tournament', () async {
    expect(teamRepository.listTeamsInTournament(), emits(listTeam));
  });
  test('team name not exist', () async {
    expect(await teamRepository.checkNameTeam('MyTeam3'), true);
  });
  test('team name exist', () async {
    teamRepository.listTeam = listTeam;
    expect(await teamRepository.checkNameTeam('MyTeam2'), false);
  });
  test('find team with code team', () async {
    teamRepository.listTeam = listTeam;
    final team = await teamRepository.findTeamWithCode('1234');
    expect(team?.data, isNotNull);
  });
  test('not find team with code team', () async {
    teamRepository.listTeam = listTeam;
    expect(await teamRepository.findTeamWithCode('12'), null);
  });
  test('generate code team not empty', () {
    expect(teamRepository.generateCodeTeam('1234', 5), isNotEmpty);
  });
  test('generate code team lenght 5', () {
    const codeBefore = '1234';
    final code = teamRepository.generateCodeTeam(codeBefore, 5);
    expect(code.length, codeBefore.length + 5);
  });

  test('id team not null', () async {
    expect(
      teamRepository.listTeamsInTournament(),
      emits(listTeam.where((element) => element.documentId != null)),
    );
  });
  test('count team', () async {
    teamRepository.listTeam = listTeam;
    expect(teamRepository.numberTeamInTournament(), listTeam.length);
  });

  test('check team is full', () async {
    tournament4.tournamentType = TournamentType.solo;
    final list = <MemberTournament>[
      ...listTeam.first.listMemberTournament,
      memberTournament,
    ];

    listTeam.first = listTeam.first.copyWith(listMemberTournament: list);
    teamRepository.tournament = tournament4;
    expect(await teamRepository.checkTeamCapacity(listTeam.first), false);
  });
  test('check team is not full', () async {
    teamRepository.tournament = tournament4;
    expect(await teamRepository.checkTeamCapacity(listTeam[1]), true);
  });
  test('delete in no member', () {
    expect(listTeam[1].isDisqualified, false);
    expect(
      teamRepository.disqualifiedTeamWithNoMember(listTeam[1]).isDisqualified,
      true,
    );
  });
  test('load memberTournament in team', () async {
    final team =
        await teamRepository.addListMemberTournamentInTeam(listTeam[2]);
    expect(team.listMemberTournament, isNotEmpty);
  });
  test('get teamDocumentReference', () {
    expect(
      teamRepository.getTeamDocumentReference(listTeam[1]),
      teamsRef.doc(listTeam[1].documentId).reference,
    );
  });
  test('add team in tournament', () async {
    var teamCol = await teamsRef.get();
    final numTeam = teamCol.docs.length;
    await teamRepository.addTeamInTournament(
      listTeam.first,
    );
    teamCol = await teamsRef.get();
    expect(teamCol.docs.length, numTeam + 1);
  });
  test('add team in tournament with code ', () async {
    const myTeam = Team(name: 'NouvelleTeam');
    await teamRepository.addTeamInTournament(myTeam);
    final teamCol = await teamsRef.get();
    expect(teamCol.docs[3].data.teamCode, isNot(''));
  });
  test('check tournament team not full', () async {
    teamRepository.tournament = tournament4;
    expect(await teamRepository.checkTournamentCapacity(), true);
  });
  test('check tournament team full', () async {
    tournament4.capacity = 1;
    teamRepository
      ..listTeam = listTeam
      ..tournament = tournament4;
    expect(await teamRepository.checkTournamentCapacity(), false);
  });
}
