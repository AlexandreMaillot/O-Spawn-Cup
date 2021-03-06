import 'dart:async';

import 'package:authentication_repository/authentication_repository.dart';
import 'package:flutter_form_bloc/flutter_form_bloc.dart';
import 'package:o_spawn_cup/services/field_bloc_validators_errors_fr.dart';
import 'package:o_spawn_cup/services/firebase_handler.dart';

class SignUpFormBloc extends FormBloc<String, String> {
  final email = TextFieldBloc<TextFieldBloc>(
    validators: [FieldBlocValidatorsFr.required, FieldBlocValidatorsFr.email],
  );
  final password = TextFieldBloc<TextFieldBloc>(
    validators: [
      FieldBlocValidatorsFr.required,
      FieldBlocValidatorsFr.passwordMin6Chars,
    ],
  );
  final confirmPassword = TextFieldBloc<TextFieldBloc>(
    validators: [
      FieldBlocValidatorsFr.required,
    ],
  );
  final pseudo = TextFieldBloc<TextFieldBloc>(
    validators: [
      FieldBlocValidatorsFr.required,
    ],
  );
  late AuthenticationRepository _authenticationRepository;

  SignUpFormBloc({required AuthenticationRepository authenticationRepository}) {
    _authenticationRepository = authenticationRepository;
    addFieldBlocs(
      step: 0,
      fieldBlocs: [
        email,
        password,
        confirmPassword,
        pseudo,
      ],
    );
    confirmPassword
      ..subscribeToFieldBlocs([password])
      ..addValidators([FieldBlocValidatorsFr.confirmPassword(password)]);
  }

  @override
  Future<FutureOr<void>> onSubmitting() async {
    emitLoading();
    try {
      await _authenticationRepository.signUp(
        email: email.value,
        password: password.value,
      );
      FirebaseHandler().addMemberFirebase(
        pseudo.value,
        _authenticationRepository.currentUser.id,
      );
      emitSuccess();
    } on LogInWithEmailAndPasswordFailure catch (error) {
      emitFailure(failureResponse: error.message);
    } catch (error) {
      emitFailure(failureResponse: error.toString());
    }
  }
}
