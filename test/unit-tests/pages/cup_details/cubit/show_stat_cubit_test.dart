import 'package:bloc_test/bloc_test.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fake_cloud_firestore/fake_cloud_firestore.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:o_spawn_cup/models/Member/member.dart';
import 'package:o_spawn_cup/models/MemberTournament/member_tournament.dart';
import 'package:o_spawn_cup/models/Team/team.dart';
import 'package:o_spawn_cup/models/Tournament/tournament.dart';
import 'package:o_spawn_cup/models/TournamentType/tournament_type.dart';
import 'package:o_spawn_cup/models/game_name.dart';
import 'package:o_spawn_cup/models/role_type.dart';
import 'package:o_spawn_cup/models/server_type.dart';
import 'package:o_spawn_cup/pages/cup_details/cubit/show_stat_cubit.dart';
import 'package:o_spawn_cup/repository/member_repository.dart';
import 'package:o_spawn_cup/repository/member_tounament_repository.dart';
import 'package:o_spawn_cup/repository/team_repository.dart';
import 'package:o_spawn_cup/repository/tournament_repository.dart';

import '../../../../class/team_repository_overridden.dart';
import '../../../../class/tournament_repository_overrindden.dart';

class MockTeamRepository extends Mock implements TeamRepository{}
class MockTeam extends Mock implements Team{}
class MockTeamCollectionReference extends Mock implements TeamCollectionReference{}
class MockMemberTournament extends Mock implements MemberTournament{}
class MockTournamentCollectionReference extends Mock implements TournamentCollectionReference{}
class MockMemberTournamentCollectionReference extends Mock implements MemberTournamentCollectionReference{}
class MockTournamentRepository extends Mock implements TournamentRepository{}
class MockMemberTournamentRepository extends Mock implements MemberTournamentRepository{}
class MockTournamentDocumentReference extends Mock implements TournamentDocumentReference{}
class MockTeamDocumentReference extends Mock implements TeamDocumentReference{}
class MockTournamentDocumentSnap extends Mock implements TournamentDocumentSnapshot{}
class MockDocumentReference extends Mock implements DocumentReference<Team>{}
class MockCollectionReference extends Mock implements CollectionReference<Map<String, dynamic>>{}


void main() {
  DateTime now = DateTime.now();
  late FakeFirebaseFirestore instance;
  late ShowStatCubit cubit;
  late MockTeamRepository teamRepository;
  late MockCollectionReference collectionReference;
  late MockTeam teamMock;
  late MockTeamCollectionReference teamCollectionReference;
  late MockTournamentCollectionReference tournamentCollectionReference;
  late MockMemberTournamentCollectionReference memberTournamentCollectionReference;
  late MockMemberTournament memberTournament;
  late MockTournamentRepository tournamentRepository;
  late MockMemberTournamentRepository memberTournamentRepository;
  late MockTournamentDocumentReference tournamentDocumentReference;
  late MockTeamDocumentReference teamDocumentReference;
  late MockTournamentDocumentSnap tournamentDocumentSnap;
  late MockDocumentReference documentReference;
  late TeamRepositoryOverridden teamRepositoryOverridden;
  late TournamentRepositoryOverridden tournamentRepositoryOverridden;

  Team team = Team(name: 'MyTeam',);
  Tournament tournament = Tournament(name: 'Tournois 4',
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
      cashPrize: const ['Mon lot 1','Mon lot 2','Mon lot 3'],
      listCodesGames: const ['MonCode1','MonCode2','MonCode3',]);


  setUp(() async {

    instance = FakeFirebaseFirestore();
    teamRepository = MockTeamRepository();
    teamMock = MockTeam();
    collectionReference = MockCollectionReference();
    tournamentRepository = MockTournamentRepository();
    memberTournamentRepository = MockMemberTournamentRepository();
    memberTournament = MockMemberTournament();
    teamCollectionReference = MockTeamCollectionReference();
    tournamentCollectionReference = MockTournamentCollectionReference();
    memberTournamentCollectionReference = MockMemberTournamentCollectionReference();
    tournamentDocumentReference = MockTournamentDocumentReference();
    teamDocumentReference = MockTeamDocumentReference();
    tournamentDocumentSnap = MockTournamentDocumentSnap();
    documentReference = MockDocumentReference();
    // teamRepositoryOverridden = TeamRepositoryOverridden(teamCollectionReference: teamCollectionReference);
    // tournamentRepositoryOverridden = TournamentRepositoryOverridden(tournamentCollectionReference: tournamentCollectionReference);

    when(() => teamRepository.listTeamStream).thenAnswer((invocation) => Stream.value([]),);

    when(() => tournamentRepository.getTournament(tournament)).thenAnswer((invocation) => Stream.empty(),);
    cubit = ShowStatCubit(tournament: tournament,tournamentRepository: tournamentRepository, teamRepository: teamRepository);
  });
  group('Normal test', (){
    setUp((){

    });

    test("resetRowSelect", (){
      cubit.resetRowSelect();
      expect(cubit.indexRowSelect, null);
      expect(cubit.state, ShowStatRowSelected(rowSelect: null));
    });
  });
  group('Bloc test', (){

      blocTest<ShowStatCubit,ShowStatState>(
        'emits showstatchanged true',
        setUp: (){
          cubit.emit(ShowStatChanged(globalStat: false));
        },
        build: () => cubit,
        act: (bloc) => bloc.changeStatShow(true),
        expect: () => [
          ShowStatRowSelected(rowSelect: null),
          ShowStatChanged(globalStat: true)
        ],
      );
      blocTest<ShowStatCubit,ShowStatState>(
        'emits showstatchanged false',
        setUp: (){

        },
        build: () => cubit,
        act: (bloc) => bloc.changeStatShow(false),
        expect: () => [
          ShowStatRowSelected(rowSelect: null),
          ShowStatChanged(globalStat: false)
        ],
      );


      blocTest<ShowStatCubit,ShowStatState>(
        'emits memberTournamenthchanged',
        setUp: (){
          when(() => teamRepository.getTeamDocumentReference(teamMock)).thenAnswer((invocation) => documentReference);
          when(() => memberTournamentRepository.listMemberTournamentStream).thenAnswer((invocation) => Stream.value([memberTournament]));


        },
        build: () => cubit,
        act: (bloc) => bloc.selectRowTeam(memberTournamentRepository: memberTournamentRepository,rowSelect: 1),
        expect: () => [
          ShowStatRowSelected(rowSelect: 1),
          isA<ShowStatMemberTournamentLoaded>()
        ],
      );
      blocTest<ShowStatCubit,ShowStatState>(
        'emits memberTournamenthchanged la liste est null',
        setUp: (){
          when(() => teamRepository.getTeamDocumentReference(teamMock)).thenAnswer((invocation) => documentReference);
          when(() => memberTournamentRepository.listMemberTournamentStream).thenAnswer((invocation) => Stream.value([]));


        },
        build: () => cubit,
        act: (bloc) => bloc.selectRowTeam(memberTournamentRepository: memberTournamentRepository,rowSelect: 1),
        expect: () => [
          ShowStatRowSelected(rowSelect: 1),
          isA<ShowStatMemberTournamentLoaded>()
        ],
      );

      blocTest<ShowStatCubit,ShowStatState>(
        'emits rowselect null',
        setUp: (){
        },
        build: () => cubit,
        act: (bloc) {
          bloc.selectRowTeam(memberTournamentRepository: null,rowSelect: 1);
          bloc.selectRowTeam(memberTournamentRepository: null,rowSelect: 1);
        },
        expect: () => [
          ShowStatRowSelected(rowSelect: 1),
          ShowStatRowSelected(rowSelect: null),
        ],
      );

      blocTest<ShowStatCubit,ShowStatState>(
        'emits rowselect 1',
        setUp: (){
        },
        build: () => cubit,
        act: (bloc) => bloc.selectRowTeam(memberTournamentRepository: null,rowSelect: 1),
        expect: () => [
          ShowStatRowSelected(rowSelect: 1)
        ],
      );


      blocTest<ShowStatCubit,ShowStatState>(
        'emits membertournament disqualified not team',
        setUp: (){
          cubit.memberTournamentRepositoryLocal = MockMemberTournamentRepository();
          when(() => cubit.memberTournamentRepositoryLocal.deleteMemberTournament(memberTournament)).thenAnswer((invocation) => null);
          when(() => cubit.memberTournamentRepositoryLocal.listMemberTournament).thenReturn([]);
          when(() => cubit.teamRepository.disqualifiedTeamWithNoMember(teamMock)).thenAnswer((invocation) => false);
          when(() => teamMock.listMemberTournament).thenReturn([]);
          when(() => teamMock.isDisqualified).thenReturn(false);
        },
        build: () => cubit,
        act: (bloc) => bloc.disqualifiedMemberTournament(memberTournament, teamMock),
        expect: () => [
          isA<ShowStatMemberTournamentDisqualified>(),
        ],
      );
      blocTest<ShowStatCubit,ShowStatState>(
        'emits membertournament disqualified and team disqualified',
        setUp: (){
          cubit.memberTournamentRepositoryLocal = MockMemberTournamentRepository();
          when(() => cubit.memberTournamentRepositoryLocal.deleteMemberTournament(memberTournament)).thenAnswer((invocation) => null);
          when(() => cubit.memberTournamentRepositoryLocal.listMemberTournament).thenReturn([]);
          when(() => cubit.teamRepository.disqualifiedTeamWithNoMember(teamMock)).thenAnswer((invocation) => true);
          when(() => teamMock.listMemberTournament).thenReturn([]);
          when(() => teamMock.listMemberTournament.isEmpty).thenReturn(true);
          when(() => teamMock.isDisqualified).thenReturn(true);
        },
        build: () => cubit,
        act: (bloc) => bloc.disqualifiedMemberTournament(memberTournament, teamMock),
        expect: () => [
          isA<ShowStatMemberTournamentDisqualified>(),
          isA<ShowStatRowSelected>(),
          isA<ShowStatTeamDisqualified>(),
        ],
      );
    });
  }