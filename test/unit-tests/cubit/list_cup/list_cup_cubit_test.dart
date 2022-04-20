import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:o_spawn_cup/models/Tournament/tournament.dart';
import 'package:o_spawn_cup/models/TournamentType/tournament_type.dart';
import 'package:o_spawn_cup/models/game_name.dart';
import 'package:o_spawn_cup/models/server_type.dart';
import 'package:o_spawn_cup/pages/list_cup/cubit/list_cup_cubit.dart';
import 'package:o_spawn_cup/repository/tournament_repository.dart';

class MockTournamentRepository extends Mock implements TournamentRepository{}
void main() {
  late MockTournamentRepository tournamentRepository;

  DateTime now = DateTime.now();
  Tournament tournament1 = Tournament(name: 'Tournois 1',
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
  Tournament tournament2 = Tournament(name: 'Tournois 2',
      dateDebutTournois: DateTime(now.year,now.month,now.day + 5),
      game: GameName.Fornite,
      server: ServerType.EU,
      tournamentType: TournamentType.quatuor,
      capacity: 33,
      roundNumber: 3,
      dateDebutInscription: DateTime(now.year,now.month + 1,now.day + 5),
      killPointTournament: 1,
      pointPerRangTournament: 1,
      rangStartTournament: 15,
      cashPrize: const ['Mon lot 1','Mon lot 2','Mon lot 3'],
      listCodesGames: const ['MonCode1','MonCode2','MonCode3',]);


  setUp((){
    tournamentRepository = MockTournamentRepository();
  });

  test('initial state is ListCupNoData', () {
    when(() => tournamentRepository.listTournaments(gameName: null)).thenAnswer((_) => Stream.empty());

    expect(
      ListCupCubit(tournamentRepository: tournamentRepository,gameName: null).state,
      ListCupNoData(),
    );
  });
  blocTest(
    'emits [] when nothing is added',
    setUp: (){
      when(() => tournamentRepository.listTournaments(gameName: null)).thenAnswer((_) => Stream.empty());
    },
    build: () => ListCupCubit(tournamentRepository: tournamentRepository,gameName: null),
    expect: () => [],
  );

  blocTest(
    'emits [Load,Filtred] when loadListCupWithFilter no data',
    setUp: (){
      when(() => tournamentRepository.listTournaments(gameName: null)).thenAnswer((_) => Stream.empty());
    },
    build: () => ListCupCubit(tournamentRepository: tournamentRepository,gameName: null),
    act: (ListCupCubit bloc) => bloc.loadListCupWithFilter(),
    expect: () => [
      isA<ListCupFiltred>(),
      isA<ListCupLoad>(),
      ListCupNoData(),
    ],
  );
  blocTest(
    'emits [Load,Filtred,Loaded] when loadListCupWithFilter with data',
    setUp: (){
      when(() => tournamentRepository.listTournaments(gameName: null)).thenAnswer((_) => Stream.value([tournament1]));
    },
    build: () => ListCupCubit(tournamentRepository: tournamentRepository,gameName: null),
    act: (ListCupCubit bloc) => bloc.loadListCupWithFilter(),
    expect: () => [
      isA<ListCupFiltred>(),
      isA<ListCupLoad>(),
      ListCupNoData(),
      ListCupLoaded(listCup: [tournament1]),
    ],
  );

}