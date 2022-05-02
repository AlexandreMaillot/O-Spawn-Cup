import 'package:fake_cloud_firestore/fake_cloud_firestore.dart';
import 'package:o_spawn_cup/models/Member/member.dart';
import 'package:o_spawn_cup/models/MemberTournament/member_tournament.dart';
import 'package:o_spawn_cup/models/TournamentType/tournament_type.dart';
import 'package:o_spawn_cup/models/game_name.dart';
import 'package:o_spawn_cup/models/role_type.dart';
import 'package:o_spawn_cup/models/server_type.dart';
import 'package:o_spawn_cup/models/team/team.dart';
import 'package:o_spawn_cup/models/tournament/tournament.dart';
import 'package:o_spawn_cup/repository/member_tounament_repository.dart';
import 'package:test/test.dart';

void main() {
  final now = DateTime.now();
  late FakeFirebaseFirestore instance;
  late MemberTournamentRepository memberTournamentRepository;
  late TournamentCollectionReference tournamentsRef;
  late TeamCollectionReference teamsRef;
  late MemberTournamentCollectionReference memberTournamentsRef;
  late final listTeam = <Team>[
    const Team(name: 'MyTeam1', documentId: 'id1', teamCode: '1234'),
    const Team(name: 'MyTeam2', documentId: 'id2'),
    const Team(name: 'MyTeam3', documentId: 'id3'),
  ];
  late final listMemberTournament = <MemberTournament>[
    const MemberTournament(
      gamerTag: '',
      role: RoleType.player,
      member: Member(uid: ''),
      documentId: 'id1',
    ),
    const MemberTournament(
      gamerTag: '',
      role: RoleType.player,
      member: Member(uid: ''),
      documentId: 'id2',
    ),
    const MemberTournament(
      gamerTag: '',
      role: RoleType.player,
      member: Member(uid: ''),
      documentId: 'id3',
    ),
  ];
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
    cashPrize: const ['Mon lot 1', 'Mon lot 2', 'Mon lot 3'],
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
        .collection('tournament')
        .doc('id4')
        .set(tournament4.toJson());
    tournamentsRef = TournamentCollectionReference(instance);

    await tournamentsRef.doc('id4').teams.doc('id1').set(listTeam.first);
    await tournamentsRef.doc('id4').teams.doc('id2').set(listTeam[1]);
    await tournamentsRef.doc('id4').teams.doc('id3').set(listTeam[2]);

    teamsRef = TeamCollectionReference(tournamentsRef.doc('id4').reference);
    memberTournamentsRef =
        MemberTournamentCollectionReference(teamsRef.doc('id1').reference);

    await memberTournamentsRef.doc('id1').set(listMemberTournament.first);
    await memberTournamentsRef.doc('id2').set(listMemberTournament[1]);
    await memberTournamentsRef.doc('id3').set(listMemberTournament[2]);

    memberTournamentRepository = MemberTournamentRepository(
      memberTournamentCollectionReference: memberTournamentsRef,
    );
  });
  test('load team', () async {
    await memberTournamentRepository.loadTeam();
    expect(memberTournamentRepository.team, listTeam.first);
  });

  test('list MemberTournament Stream', () {
    expect(
      memberTournamentRepository.listMemberTournamentInTeam(),
      emits(listMemberTournament),
    );
  });

  test('add member in team', () async {
    var membersTournament = await tournamentsRef
        .doc('id4')
        .teams
        .doc(listTeam.first.documentId)
        .membersTournament
        .get();
    final initalNum = membersTournament.docs.length;
    memberTournamentRepository.addMemberTournamentInTeam(
      const Member(uid: ''),
      'MonGameTag',
      RoleType.leader,
    );
    membersTournament = await tournamentsRef
        .doc('id4')
        .teams
        .doc(listTeam.first.documentId)
        .membersTournament
        .get();
    expect(membersTournament.docs.length, initalNum + 1);
  });

  test('delete memberTournament in team', () async {
    memberTournamentRepository.deleteMemberTournament(listMemberTournament[1]);
    final snapshot = await memberTournamentsRef.get();
    expect(
      snapshot.docs.length,
      listMemberTournament
          .where((element) => element.documentId != 'id2')
          .length,
    );
  });

  test('id membertournament not null', () async {
    expect(
      memberTournamentRepository.listMemberTournamentStream,
      emits(
        listMemberTournament.where((element) => element.documentId != null),
      ),
    );
  });
}
