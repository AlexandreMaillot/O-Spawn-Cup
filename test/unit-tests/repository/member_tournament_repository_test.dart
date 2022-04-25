import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fake_cloud_firestore/fake_cloud_firestore.dart';
import 'package:o_spawn_cup/models/Member/member.dart';
import 'package:o_spawn_cup/models/MemberTournament/member_tournament.dart';
import 'package:o_spawn_cup/models/TournamentType/tournament_type.dart';
import 'package:o_spawn_cup/models/game_name.dart';
import 'package:o_spawn_cup/models/role_type.dart';
import 'package:o_spawn_cup/models/server_type.dart';
import 'package:o_spawn_cup/models/team/team.dart';
import 'package:o_spawn_cup/models/tournament/tournament.dart';
import 'package:o_spawn_cup/pages/cup_details/view/cup_detail_view.dart';
import 'package:o_spawn_cup/repository/member_tounament_repository.dart';
import 'package:test/test.dart';

void main() {
  DateTime now = DateTime.now();
  late FakeFirebaseFirestore instance;
  late MemberTournamentRepository memberTournamentRepository;
  late TournamentCollectionReference tournamentsRef;
  late TeamCollectionReference teamsRef;
  late MemberTournamentCollectionReference memberTournamentsRef;
  late List<Team> listTeam = [
    Team(name: 'MyTeam1', documentId: 'id1', teamCode: '1234'),
    Team(name: 'MyTeam2', documentId: 'id2'),
    Team(name: 'MyTeam3', documentId: 'id3')
  ];
  late MemberTournament memberTournament = MemberTournament(
      gamerTag: '', role: RoleType.player, member: const Member(uid: ''));
  late List<MemberTournament> listMemberTournament = [
    MemberTournament(
        gamerTag: '',
        role: RoleType.player,
        member: const Member(uid: ''),
        documentId: 'id1'),
    MemberTournament(
        gamerTag: '',
        role: RoleType.player,
        member: const Member(uid: ''),
        documentId: 'id2'),
    MemberTournament(
        gamerTag: '',
        role: RoleType.player,
        member: const Member(uid: ''),
        documentId: 'id3')
  ];
  Tournament tournament4 = Tournament(
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
        'Mon lot 3'
      ],
      listCodesGames: const [
        'MonCode1',
        'MonCode2',
        'MonCode3',
      ]);

  setUp(() async {
    instance = FakeFirebaseFirestore();
    tournament4.documentId = 'id4';
    await instance
        .collection('tournament')
        .doc('id4')
        .set(tournament4.toJson());
    tournamentsRef = TournamentCollectionReference(instance);

    tournamentsRef.doc('id4').teams.doc('id1').set(listTeam[0]);
    tournamentsRef.doc('id4').teams.doc('id2').set(listTeam[1]);
    tournamentsRef.doc('id4').teams.doc('id3').set(listTeam[2]);

    teamsRef = TeamCollectionReference(tournamentsRef.doc('id4').reference);
    memberTournamentsRef =
        MemberTournamentCollectionReference(teamsRef.doc('id1').reference);

    memberTournamentsRef.doc('id1').set(listMemberTournament[0]);
    memberTournamentsRef.doc('id2').set(listMemberTournament[1]);
    memberTournamentsRef.doc('id3').set(listMemberTournament[2]);

    memberTournamentRepository = MemberTournamentRepository(
        memberTournamentCollectionReference: memberTournamentsRef);
  });
  test('load team', () async {
    memberTournamentRepository
        .loadTeam()
        .then((value) => expect(memberTournamentRepository.team, listTeam[0]));
  });

  test('list MemberTournament Stream', () {
    expect(memberTournamentRepository.listMemberTournamentInTeam(),
        emits(listMemberTournament));
  });

  test('add member in team', () async {
    var membersTournament = await tournamentsRef
        .doc('id4')
        .teams
        .doc(listTeam[0].documentId)
        .membersTournament
        .get();
    var initalNum = membersTournament.docs.length;
    memberTournamentRepository.addMemberTournamentInTeam(
        const Member(uid: ''), 'MonGameTag', RoleType.leader);
    membersTournament = await tournamentsRef
        .doc('id4')
        .teams
        .doc(listTeam[0].documentId)
        .membersTournament
        .get();
    expect(membersTournament.docs.length, initalNum + 1);
  });

  test('delete memberTournament in team', () async {
    memberTournamentRepository.deleteMemberTournament(listMemberTournament[1]);
    var snapshot = await memberTournamentsRef.get();
    expect(
        snapshot.docs.length,
        listMemberTournament
            .where((element) => element.documentId != 'id2')
            .length);
  });

  test('id membertournament not null', () async {
    expect(
        memberTournamentRepository.listMemberTournamentStream,
        emits(listMemberTournament
            .where((element) => element.documentId != null)));
  });
}
