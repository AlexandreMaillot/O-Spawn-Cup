import 'package:flutter_test/flutter_test.dart';
import 'package:o_spawn_cup/bloc/select_game_bloc/select_game_bloc.dart';

void main() {
  test('supports value comparisons', () {
    expect(
      const SelectGameChange(indexSelect: 0),
      const SelectGameChange(indexSelect: 0),
    );
  });
}
