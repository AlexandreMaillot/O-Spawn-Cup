import 'dart:async';

import 'package:authentication_repository/authentication_repository.dart';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:flutter_form_bloc/flutter_form_bloc.dart';
import 'package:o_spawn_cup/services/field_bloc_validators_errors_fr.dart';


class LoginFormBloc extends FormBloc<String, String> {
  final email = TextFieldBloc(validators: [FieldBlocValidatorsFr.required,FieldBlocValidatorsFr.email],);
  final password = TextFieldBloc(validators: [FieldBlocValidatorsFr.required,FieldBlocValidatorsFr.passwordMin6Chars],);
  late AuthenticationRepository _authenticationRepository;

  LoginFormBloc({required AuthenticationRepository authenticationRepository}) {
    _authenticationRepository = authenticationRepository;
    addFieldBlocs(step: 0,fieldBlocs: [
      email,
      password,
    ]);
  }

  @override
  Future<FutureOr<void>> onSubmitting() async {
    emitLoading();
    try {
      await _authenticationRepository.logInWithEmailAndPassword(
        email: email.value,
        password: password.value,
      );
      emitSuccess();
    } on LogInWithEmailAndPasswordFailure catch (error) {
      emitFailure(failureResponse: error.message);
    } catch (error) {
      emitFailure(failureResponse: error.toString());
    }
  }
}
