import 'package:flutter_test/flutter_test.dart';
import 'package:o_spawn_cup/bloc/select_game_bloc/select_game_bloc.dart';

void main() {
  test('GameChanged', () {
    expect(SelectGameChanged(0), SelectGameChanged(0));
  });
}