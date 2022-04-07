import 'dart:async';

import 'package:authentication_repository/authentication_repository.dart';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:flutter_form_bloc/flutter_form_bloc.dart';
import 'package:o_spawn_cup/repository/tournament_repository.dart';
import 'package:o_spawn_cup/services/field_bloc_validators_errors_fr.dart';


class TournamentFormBloc extends FormBloc<String, String> {
  final email = TextFieldBloc(validators: [FieldBlocValidatorsFr.required,FieldBlocValidatorsFr.email],);
  final password = TextFieldBloc(validators: [FieldBlocValidatorsFr.required,FieldBlocValidatorsFr.passwordMin6Chars],);
  late TournamentRepository _tournamentRepository;

  TournamentFormBloc({required TournamentRepository tournamentRepository}) {
    _tournamentRepository = tournamentRepository;
    addFieldBlocs(step: 0,fieldBlocs: [
      email,
      password,
    ]);
  }

  @override
  Future<FutureOr<void>> onSubmitting() async {

  }
}
