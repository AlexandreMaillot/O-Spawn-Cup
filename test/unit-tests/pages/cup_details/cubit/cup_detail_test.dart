import 'package:authentication_repository/authentication_repository.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:fake_cloud_firestore/fake_cloud_firestore.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:o_spawn_cup/app/app.dart';
import 'package:o_spawn_cup/models/Member/member.dart' as m;
import 'package:o_spawn_cup/models/MemberTournament/member_tournament.dart';
import 'package:o_spawn_cup/models/TournamentType/tournament_type.dart';
import 'package:o_spawn_cup/models/game_name.dart';
import 'package:o_spawn_cup/models/role_type.dart';
import 'package:o_spawn_cup/models/server_type.dart';
import 'package:o_spawn_cup/models/team/team.dart';
import 'package:o_spawn_cup/models/tournament/tournament.dart';
import 'package:o_spawn_cup/models/tournament/tournament_state.dart';
import 'package:o_spawn_cup/pages/cup_details/cubit/cup_detail_cubit.dart';
import 'package:o_spawn_cup/repository/member_repository.dart';
import 'package:o_spawn_cup/repository/member_tounament_repository.dart';
import 'package:o_spawn_cup/repository/team_repository.dart';
import 'package:o_spawn_cup/repository/tournament_repository.dart';
import 'package:o_spawn_cup/services/email_message.dart';

class MockAppBloc extends Mock implements AppBloc {}

class MockTeamRepository extends Mock implements TeamRepository {}

class MockTeamCollectionReference extends Mock
    implements TeamCollectionReference {}

class MockTeamDocumentSnap extends Mock implements TeamDocumentSnapshot {}

class MockTournamentDocumentReference extends Mock
    implements TournamentDocumentReference {}

class MockTeamDocumentReference extends Mock implements TeamDocumentReference {}

class MockTournamentDocumentSnapshot extends Mock
    implements TournamentDocumentSnapshot {}

class MockMemberTournament extends Mock implements MemberTournament {}

class MockTournament extends Mock implements Tournament {}

class MockMemberTournamentRepository extends Mock
    implements MemberTournamentRepository {}

class MockEmailMessage extends Mock implements EmailMessage {}

class MockTeam extends Mock implements Team {}

class MockUser extends Mock implements User {}

void main() {
  final now = DateTime.now();
  late FakeFirebaseFirestore instance;
  late TeamRepository teamRepository;
  late MockTeamRepository mockTeamRepository;
  late MockTeamDocumentSnap teamDocumentSnap;
  late MockEmailMessage emailMessage;
  late MockTournamentDocumentReference tournamentDocumentReference;
  late MockTeamCollectionReference teamCollectionReference;
  late MockTournamentDocumentSnapshot tournamentDocumentSnapshot;
  late MockMemberTournament memberTournament;
  late MemberRepository memberRepository;
  late TournamentRepository tournamentRepository;
  late TournamentCollectionReference tournamentsRef;
  late TeamCollectionReference teamsRef;
  late m.MemberCollectionReference memberRef;
  late Tournament tournament5;
  late CupDetailCubit cubit;
  late MockAppBloc appBloc;
  late MockUser user;
  late MockTeam mockTeam;
  late MockTournament tournamentMock;
  late MockMemberTournamentRepository memberTournamentRepository;
  const team = Team(
    name: 'MyTeam',
    teamCode: 'codeTeam',
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

  tournament5 = tournament4
    ..documentId = 'id5'
    ..state = TournamentState.annuler;

  setUp(() async {
    instance = FakeFirebaseFirestore();
    mockTeamRepository = MockTeamRepository();
    memberTournament = MockMemberTournament();
    emailMessage = MockEmailMessage();
    teamDocumentSnap = MockTeamDocumentSnap();
    memberTournamentRepository = MockMemberTournamentRepository();
    tournamentDocumentSnapshot = MockTournamentDocumentSnapshot();
    tournamentDocumentReference = MockTournamentDocumentReference();
    teamCollectionReference = MockTeamCollectionReference();
    mockTeam = MockTeam();
    tournament4.documentId = 'id4';
    await instance
        .collection('Tournament')
        .doc('id4')
        .set(tournament4.toJson());
    tournamentsRef = TournamentCollectionReference(instance);
    await tournamentsRef.doc('id4').teams.doc('id1').set(team);
    tournamentRepository = TournamentRepository(
      tournamentCollectionReference: TournamentCollectionReference(instance),
    );
    teamsRef = TeamCollectionReference(tournamentsRef.doc('id4').reference);
    memberRef = m.MemberCollectionReference(instance);

    teamRepository = TeamRepository(teamCollectionReference: teamsRef);

    memberRepository = MemberRepository(memberCollectionReference: memberRef);

    appBloc = MockAppBloc();
    user = MockUser();
    when(() => appBloc.state).thenAnswer(
      (_) => AppState(user: user, status: AppStatus.authenticated),
    );
    when(() => user.id).thenAnswer(
      (_) => '12345',
    );
  });

  group('Normal test', () {
    setUp(() {
      cubit = CupDetailCubit(
        tournamentRepository: tournamentRepository,
        teamRepository: teamRepository,
        appBloc: appBloc,
        memberRepository: memberRepository,
        emailMessage: emailMessage,
      );
      tournamentMock = MockTournament();
    });
    test('init state', () {
      when(() => appBloc.state).thenAnswer(
        (_) => const AppState(user: null, status: AppStatus.unauthenticated),
      );
      expect(
        cubit.state,
        CupDetailTournamentChanged(tournament: tournament4, isClose: true),
      );
    });
    test('currentMemberIsSign function', () {
      cubit.member = const m.Member(uid: 'uid');
      expect(cubit.currentMemberIsSign(), false);
    });
    test('currentMemberIs not Sign function', () {
      cubit
        ..member = const m.Member(uid: 'uid')
        ..listMemberTournament = [
          MemberTournament(
            gamerTag: '',
            role: RoleType.leader,
            member: cubit.member,
          ),
        ];
      expect(cubit.currentMemberIsSign(), true);
    });
    test('place restantes ok', () {
      final isFull = cubit.placesRestante(
        tournament5,
        [const Team(name: ''), const Team(name: ''), const Team(name: '')],
      );
      expect(isFull, statePlacesRestante.isNotFull);
    });
    test('place restantes nok', () {
      final teams = <Team>[];
      for (var i = 0; i <= 50; i++) {
        teams.add(const Team(name: ''));
      }
      final isFull = cubit.placesRestante(tournament5, teams);
      expect(isFull, statePlacesRestante.isFull);
    });
    group('checktournament state function', () {
      test('checkStateTournament inscription fermer', () {
        when(
          () => tournamentMock.state,
        ).thenReturn(TournamentState.inscriptionFermer);
        final isClose = cubit.checkStateTournament(tournamentMock);
        expect(isClose, true);
      });
      test('checkStateTournament annuler', () {
        when(
          () => tournamentMock.state,
        ).thenReturn(TournamentState.annuler);
        final isClose = cubit.checkStateTournament(tournamentMock);
        expect(isClose, true);
      });
      test('checkStateTournament complet', () {
        when(
          () => tournamentMock.state,
        ).thenReturn(TournamentState.complet);
        final isClose = cubit.checkStateTournament(tournamentMock);
        expect(isClose, true);
      });
      test('checkStateTournament terminer', () {
        when(
          () => tournamentMock.state,
        ).thenReturn(TournamentState.terminer);
        final isClose = cubit.checkStateTournament(tournamentMock);
        expect(isClose, true);
      });
      test('checkStateTournament terminer', () {
        when(
          () => tournamentMock.state,
        ).thenReturn(TournamentState.inscriptionOuverte);
        final isClose = cubit.checkStateTournament(tournamentMock);
        expect(isClose, false);
      });
    });
  });

  group('Bloc test', () {
    blocTest(
      'Cup detail init state',
      build: () => CupDetailCubit(
        tournamentRepository: tournamentRepository,
        teamRepository: teamRepository,
        appBloc: appBloc,
        memberRepository: memberRepository,
        emailMessage: emailMessage,
        memberTournamentRepository: memberTournamentRepository,
      ),
      expect: () => [
        isA<CupDetailListTeamChanged>(),
        isA<CupDetailTournamentChanged>(),
        isA<CupDetailListMemberTournamentChanged>(),
      ],
    );
    group('AddMember function', () {
      setUp(() {
        tournamentMock = MockTournament();
        when(
          () => tournamentMock.capacity,
        ).thenReturn(100);
      });
      blocTest(
        'Cup detail checkState not close',
        setUp: () {
          tournament4.documentId = 'id4';
        },
        build: () => CupDetailCubit(
          tournamentRepository: tournamentRepository,
          teamRepository: teamRepository,
          appBloc: appBloc,
          memberRepository: memberRepository,
          emailMessage: emailMessage,
          memberTournamentRepository: memberTournamentRepository,
        ),
        act: (CupDetailCubit bloc) => bloc.checkStateTournament(tournament4),
        skip: 1,
        expect: () => [
          CupDetailTournamentChanged(tournament: tournament4, isClose: true),
          const CupDetailListMemberTournamentChanged(listMemberTournament: []),
        ],
      );

      blocTest(
        'Cup detail addMemberTournament leader',
        setUp: () {
          tournamentMock = MockTournament();
          when(() => appBloc.state).thenAnswer(
            (_) => AppState(user: user, status: AppStatus.authenticated),
          );
          when(
            () => tournamentMock.capacity,
          ).thenReturn(100);
          when(
            () => user.email,
          ).thenReturn('alexandre.maillot97@gmail.com');
          // when(() => appBloc.state.user,).thenReturn(user);
          when(
            () => user.id,
          ).thenReturn('1234');
        },
        build: () => CupDetailCubit(
          tournamentRepository: tournamentRepository,
          teamRepository: teamRepository,
          appBloc: appBloc,
          memberRepository: memberRepository,
          emailMessage: emailMessage,
          memberTournamentRepository: memberTournamentRepository,
        ),
        act: (CupDetailCubit bloc) {
          bloc
            ..tournament = tournamentMock
            ..member = const m.Member(uid: '12345')
            ..addMemberTournament(
              gamerTag: 'MonGamerTag',
              roleType: RoleType.leader,
              teamName: 'NameTeam',
            );
        },
        // skip: 2,
        expect: () => [
          isA<CupDetailListTeamChanged>(),
          isA<CupDetailTournamentChanged>(),
          isA<CupDetailListMemberTournamentChanged>(),
          isA<CupDetailMemberTournamentAdded>(),
          isA<CupDetailListTeamChanged>(),
        ],
        // verify: (_) {
        //   verify(() => ,);
        // }
      );

      blocTest(
        'Cup detail addMemberTournament player',
        setUp: () {
          when(
            () => mockTeamRepository.listAllMemberTournamentInTeamCollection(),
          ).thenAnswer((invocation) => Stream.value([memberTournament]));
          when(
            () => mockTeamRepository.listTeam,
          ).thenReturn([team]);
          when(
            () => mockTeamRepository.listTeamStream,
          ).thenAnswer((invocation) => Stream.value([mockTeam]));
          when(
            () => mockTeamRepository.teamCollectionReference,
          ).thenAnswer((invocation) => teamCollectionReference);
          when(
            () => teamCollectionReference.parent,
          ).thenAnswer((invocation) => tournamentDocumentReference);
          when(
            () => tournamentDocumentReference.snapshots(),
          ).thenAnswer(
            (invocation) => Stream.value(tournamentDocumentSnapshot),
          );
          when(
            () => mockTeamRepository.findTeamWithCode('codeTeam'),
          ).thenAnswer((invocation) => Future.value(teamDocumentSnap));
          when(
            () => teamDocumentSnap.data,
          ).thenAnswer((invocation) => mockTeam);
        },
        build: () => CupDetailCubit(
          tournamentRepository: tournamentRepository,
          teamRepository: mockTeamRepository,
          appBloc: appBloc,
          memberRepository: memberRepository,
          emailMessage: emailMessage,
          memberTournamentRepository: memberTournamentRepository,
        ),
        act: (CupDetailCubit bloc) {
          teamRepository.listTeam = [team];
          bloc
            ..tournament = tournamentMock
            ..member = const m.Member(uid: '1234')
            ..addMemberTournament(
              gamerTag: 'MonGamerTag',
              roleType: RoleType.player,
              teamName: 'codeTeam',
            );
        },
        // skip: 1,
        expect: () => [
          isA<CupDetailListMemberTournamentChanged>(),
          isA<CupDetailListTeamChanged>(),
          isA<CupDetailMemberTournamentAdded>(),
        ],
      );
      blocTest(
        'Cup detail addMemberTournament leader team existante',
        build: () => CupDetailCubit(
          tournamentRepository: tournamentRepository,
          teamRepository: teamRepository,
          appBloc: appBloc,
          memberRepository: memberRepository,
          emailMessage: emailMessage,
          memberTournamentRepository: memberTournamentRepository,
        ),
        act: (CupDetailCubit bloc) {
          teamRepository.listTeam = [team];
          bloc
            ..tournament = tournamentMock
            ..member = const m.Member(uid: '1234')
            ..addMemberTournament(
              gamerTag: 'MonGamerTag',
              roleType: RoleType.leader,
              teamName: 'MyTeam',
            );
        },
        // skip: 1,
        expect: () => [
          isA<CupDetailListTeamChanged>(),
          isA<CupDetailTournamentChanged>(),
          const CupDetailErrorMemberTournamentAdded(
            errorMsg: 'Nom de team existante',
          ),
          isA<CupDetailListMemberTournamentChanged>(),
        ],
      );
      blocTest(
        'Cup detail addMemberTournament player Code team not exist',
        build: () => CupDetailCubit(
          tournamentRepository: tournamentRepository,
          teamRepository: teamRepository,
          appBloc: appBloc,
          memberRepository: memberRepository,
          emailMessage: emailMessage,
          memberTournamentRepository: memberTournamentRepository,
        ),
        act: (CupDetailCubit bloc) {
          bloc
            ..tournament = tournamentMock
            ..member = const m.Member(uid: '1234')
            ..addMemberTournament(
              gamerTag: 'MonGamerTag',
              roleType: RoleType.player,
              teamName: 'codeT',
            );
        },
        // skip: 1,
        expect: () => [
          isA<CupDetailListTeamChanged>(),
          isA<CupDetailTournamentChanged>(),
          const CupDetailErrorMemberTournamentAdded(
            errorMsg: 'Code team non reconnu',
          ),
          isA<CupDetailListMemberTournamentChanged>(),
        ],
      );

      blocTest(
        'Cup detail addMemberTournament tournois full',
        setUp: () {
          when(
            () => tournamentMock.capacity,
          ).thenReturn(1);
        },
        build: () => CupDetailCubit(
          tournamentRepository: tournamentRepository,
          teamRepository: teamRepository,
          appBloc: appBloc,
          memberRepository: memberRepository,
          emailMessage: emailMessage,
          memberTournamentRepository: memberTournamentRepository,
        ),
        act: (CupDetailCubit bloc) {
          teamRepository.listTeam = [team];
          bloc
            ..tournament = tournamentMock
            ..listTeam = [team]
            ..addMemberTournament(
              gamerTag: 'MonGamerTag',
              roleType: RoleType.player,
              teamName: 'codeT',
            );
        },
        // skip: 1,
        expect: () => [
          const CupDetailErrorMemberTournamentAdded(errorMsg: 'Tournois full'),
          isA<CupDetailListTeamChanged>(),
          isA<CupDetailTournamentChanged>(),
          isA<CupDetailListMemberTournamentChanged>(),
        ],
      );
    });
  });
}
