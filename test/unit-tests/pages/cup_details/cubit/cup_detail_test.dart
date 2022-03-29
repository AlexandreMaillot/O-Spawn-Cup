import 'package:authentication_repository/authentication_repository.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:fake_cloud_firestore/fake_cloud_firestore.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:o_spawn_cup/app/app.dart';
import 'package:o_spawn_cup/models/Team/team.dart';
import 'package:o_spawn_cup/models/Tournament/tournament.dart';
import 'package:o_spawn_cup/models/Member/member.dart' as m;
import 'package:o_spawn_cup/models/Tournament/tournament_state.dart';
import 'package:o_spawn_cup/models/TournamentType/tournament_type.dart';
import 'package:o_spawn_cup/models/game_name.dart';
import 'package:o_spawn_cup/models/role_type.dart';
import 'package:o_spawn_cup/models/server_type.dart';
import 'package:o_spawn_cup/pages/cup_details/cubit/cup_detail_cubit.dart';
import 'package:o_spawn_cup/repository/member_repository.dart';
import 'package:o_spawn_cup/repository/team_repository.dart';

class MockAppBloc extends Mock implements AppBloc{}
void main() {
  DateTime now = DateTime.now();
  late FakeFirebaseFirestore instance;
  late TeamRepository teamRepository;
  late MemberRepository memberRepository;
  late TournamentCollectionReference tournamentsRef;
  late TeamCollectionReference teamsRef;
  late m.MemberCollectionReference memberRef;
  late Tournament tournament5;
  late CupDetailCubit cubit;
  late MockAppBloc appBloc;
  late Team team = Team(name: "MyTeam",);
  Tournament tournament4 = Tournament(name: 'Tournois 4',
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

  tournament5 = tournament4;
  tournament5.documentId = 'id5';
  tournament5.state = TournamentState.annuler;

  team.teamCode = 'codeTeam';
  setUp(() async {
    instance = FakeFirebaseFirestore();
    tournament4.documentId = 'id4';
    await instance.collection('Tournament').doc('id4').set(tournament4.toJson());
    tournamentsRef = TournamentCollectionReference(instance);
    tournamentsRef.doc('id4').teams.doc('id1').set(team);
    teamsRef = TeamCollectionReference(tournamentsRef.doc('id4').reference);
    memberRef = m.MemberCollectionReference(instance);


    teamRepository = TeamRepository(teamCollectionReference: teamsRef);

    memberRepository = MemberRepository(memberCollectionReference: memberRef);

    appBloc = MockAppBloc();
    when(() => appBloc.state).thenAnswer((_) => const AppState.unauthenticated());

  });

  group('Normal test', (){
    setUp((){
      cubit = CupDetailCubit(teamRepository: teamRepository,appBloc: appBloc,memberRepository: memberRepository);
    });
    test('place restantes ok', (){
      var isFull = cubit.placesRestante(tournament5, [Team(name: ''),Team(name: ''),Team(name: '')]);
      expect(isFull, statePlacesRestante.isNotFull);
    });
    test('place restantes nok', (){
      List<Team> teams = [];
      for(int i= 0; i <= 50; i++){
        teams.add(Team(name: ''));
      }
      var isFull = cubit.placesRestante(tournament5, teams);
      expect(isFull, statePlacesRestante.isFull);
    });
  });

  group('Bloc test', (){
    blocTest(
      'Cup detail init state',
      setUp: (){

      },
      build: () => CupDetailCubit(teamRepository: teamRepository,appBloc: appBloc,memberRepository: memberRepository),
      expect: () => [

        isA<CupDetailListTeamChanged>(),
        isA<CupDetailTournamentChanged>(),
      ],
    );
    blocTest(
      'Cup detail checkState not close',
      setUp: () {
        tournament4.documentId = 'id4';
      },
      build: () => CupDetailCubit(teamRepository: teamRepository,appBloc: appBloc,memberRepository: memberRepository),
      act: (CupDetailCubit bloc) => bloc.checkStateTournament(tournament4),
      skip: 1,
      expect: () => [
        CupDetailTournamentChanged(tournament: tournament4,isClose: true)
      ],
    );

    blocTest(
      'Cup detail addMemberTournament leader',
      setUp: () {

      },
      build: () => CupDetailCubit(teamRepository: teamRepository,appBloc: appBloc,memberRepository: memberRepository),
      act: (CupDetailCubit bloc) {
        bloc.member = const m.Member(uid: '12345');
        bloc.addMemberTournament('MonGamerTag', RoleType.leader, 'NameTeam');
      },
      skip: 1,
      expect: () => [
        isA<CupDetailMemberTournamentAdded>(),
        isA<CupDetailListTeamChanged>(),
        isA<CupDetailTournamentChanged>(),
      ],
    );

    blocTest(
      'Cup detail addMemberTournament player',
      setUp: () {

      },
      build: () => CupDetailCubit(teamRepository: teamRepository,appBloc: appBloc,memberRepository: memberRepository),
      act: (CupDetailCubit bloc) {
        teamRepository.listTeam = [team];
        bloc.member = const m.Member(uid: '1234');

        bloc.addMemberTournament('MonGamerTag', RoleType.player, 'codeTeam');
      },
      // skip: 1,
      expect: () => [
        isA<CupDetailListTeamChanged>(),
        isA<CupDetailMemberTournamentAdded>(),
        isA<CupDetailTournamentChanged>(),

      ],
    );
  });

}