import 'dart:async';

import 'package:flutter_form_bloc/flutter_form_bloc.dart';
import 'package:o_spawn_cup/constant.dart';
import 'package:o_spawn_cup/models/TournamentType/tournament_type.dart';
import 'package:o_spawn_cup/models/tournament/tournament_state.dart';
import 'package:o_spawn_cup/pages/list_cup/cubit/list_cup_cubit.dart';

class ListCupFilterFormBloc extends FormBloc<String, String> {
  late ListCupCubit _listCupCubit;
  final name = TextFieldBloc<TextFieldBloc>(
    validators: [],
  );
  final tournamentType = SelectFieldBloc<TournamentType, dynamic>(
    items: listTournamentType,
  );
  final startCupDate = InputFieldBloc<DateTime, Object>(
    validators: [],
    initialValue: DateTime(2020, 01, 01).toUtc(),
    name: 'Date de début',
  );
  final tournamentState = SelectFieldBloc<TournamentState, dynamic>(
    items: TournamentState.values.map((e) => e).toList(),
  );

  ListCupFilterFormBloc({required ListCupCubit listCupCubit}) {
    _listCupCubit = listCupCubit;
    addFieldBlocs(
      step: 0,
      fieldBlocs: [
        name,
        tournamentType,
        startCupDate,
        tournamentState,
      ],
    );
  }

  @override
  Future<FutureOr<void>> onSubmitting() async {
    await _listCupCubit.loadListCupWithFilter(
      name: (name.value != '') ? name.value : null,
      tournamentType: tournamentType.value,
      tournamentState: tournamentState.value,
      dateStart: startCupDate.value,
    );
  }
}
