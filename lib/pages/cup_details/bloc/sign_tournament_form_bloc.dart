import 'dart:async';

import 'package:flutter_form_bloc/flutter_form_bloc.dart';
import 'package:o_spawn_cup/models/role_type.dart';
import 'package:o_spawn_cup/pages/cup_details/cubit/cup_detail_cubit.dart';
import 'package:o_spawn_cup/services/field_bloc_validators_errors_fr.dart';

class SignTournamentFormBloc extends FormBloc<String, String> {
  late CupDetailCubit _cupDetailCubit;
  String errorResponse = '';
  final gamerTag = TextFieldBloc<TextFieldBloc>(
    validators: [FieldBlocValidatorsFr.required],
  );
  final roleSelector = InputFieldBloc<RoleType, Object>(
    validators: [FieldBlocValidatorsFr.required],
    initialValue: RoleType.player,
    name: 'role',
  );
  final teamName = TextFieldBloc<TextFieldBloc>(
    validators: [FieldBlocValidatorsFr.required],
  );

  SignTournamentFormBloc({required CupDetailCubit cupDetailCubit}) {
    _cupDetailCubit = cupDetailCubit;
    addFieldBlocs(fieldBlocs: [
      gamerTag,
      roleSelector,
      teamName,
    ],);
  }

  @override
  Future<FutureOr<void>> onSubmitting() async {
    await _cupDetailCubit.addMemberTournament(
      gamerTag: gamerTag.value,
      roleType: roleSelector.value,
      teamName: teamName.value,
    );
    if (_cupDetailCubit.state is CupDetailErrorMemberTournamentAdded) {
      emitFailure(
          failureResponse:
              (_cupDetailCubit.state as CupDetailErrorMemberTournamentAdded)
                  .errorMsg,);
    } else {
      emitSuccess();
      gamerTag.clear();
      roleSelector.clear();
      teamName.clear();
      reload();
    }
  }
}
