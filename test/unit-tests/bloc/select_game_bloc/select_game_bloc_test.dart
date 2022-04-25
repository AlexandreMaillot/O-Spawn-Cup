import 'package:flutter_test/flutter_test.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:o_spawn_cup/bloc/select_game_bloc/select_game_bloc.dart';
import 'package:o_spawn_cup/constant.dart';
import 'package:o_spawn_cup/models/card_game.dart';
import 'package:o_spawn_cup/models/game_name.dart';
void main() {
  List<CardGame> list = [CardGame("img", GameName.csgo),CardGame("img", GameName.fornite),CardGame("img", GameName.leagueOfLegend)];
  test('init bloc with initialindex', () {
    expect(
      SelectGameBloc(initialIndex: 2,listGameName: []).state,
      SelectGameChanged(2),
    );
  });

  blocTest<SelectGameBloc, SelectGameState>(
    'NoData',
    build: () => SelectGameBloc(initialIndex: 0,listGameName: []),
    act: (bloc) {
      bloc.add(SelectGameloadList());
    },
    expect: () => [isA<SelectGameNoData>()],
  );

  blocTest<SelectGameBloc, SelectGameState>(
    'Load list with elements',
    build: () => SelectGameBloc(initialIndex: 0,listGameName: list),
    act: (bloc) {
      bloc.add(SelectGameloadList());
    },
    expect: () => [isA<SelectGameChanged>()],
  );

  blocTest<SelectGameBloc, SelectGameState>(
    'Select game',
    build: () => SelectGameBloc(initialIndex: 0,listGameName: list),
    act: (bloc) {
      bloc.add(SelectGameChange(indexSelect: 1));
    },
    expect: () => [SelectGameChanged(1)],
  );
}