import 'dart:async';

import 'package:flutter_form_bloc/flutter_form_bloc.dart';
import 'package:o_spawn_cup/constant.dart';
import 'package:o_spawn_cup/models/Tournament/tournament_state.dart';
import 'package:o_spawn_cup/models/TournamentType/tournament_type.dart';



class ListCupFilterFormBloc extends FormBloc<String, String> {
  final name = TextFieldBloc(validators: [],);
  final tournamentType = SelectFieldBloc(
    items: listTournamentType,
  );
  final startCupDate = InputFieldBloc<DateTime, Object>(
    validators: [],
    initialValue: DateTime(2020,01,01).toUtc(),
    name: "Date de début",
  );
  final tournamentState = SelectFieldBloc(
    items: TournamentState.values.map((e) => e).toList(),
  );

  ListCupFilterFormBloc() {
    addFieldBlocs(step: 0,fieldBlocs: [
      name,
      tournamentType,
      startCupDate,
      tournamentState,
    ]);
  }

  @override
  Future<FutureOr<void>> onSubmitting() async {

  }
}
