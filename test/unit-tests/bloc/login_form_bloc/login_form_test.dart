import 'package:authentication_repository/authentication_repository.dart';
import 'package:flutter_form_bloc/flutter_form_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:o_spawn_cup/login/bloc/login_form_bloc.dart';
void main() {
  late LoginFormBloc loginFormBloc;

  setUpAll((){
    final AuthenticationRepository authenticationRepository = AuthenticationRepository();
    loginFormBloc = LoginFormBloc(authenticationRepository: authenticationRepository);
  });

  test('Aucun champ rempli', () {
    final expectedStates = [
      FormBlocSubmitting<String, String>(
        isValidByStep: const {0: false},
        fieldBlocs: {
          0: {loginFormBloc.email.name: loginFormBloc.email,
            loginFormBloc.password.name: loginFormBloc.password,},
        },
      ),
      FormBlocSubmissionFailed<String, String>(
        isValidByStep: const {0: false},
        fieldBlocs: {
          0: {loginFormBloc.email.name: loginFormBloc.email,
            loginFormBloc.password.name: loginFormBloc.password,},
        },
      ),
      FormBlocLoaded<String, String>(
        isValidByStep: const {0: false},
        fieldBlocs: {
          0: {loginFormBloc.email.name: loginFormBloc.email,
            loginFormBloc.password.name: loginFormBloc.password,},
        },
      ),
    ];
    expect(loginFormBloc.stream, emitsInOrder(expectedStates));
    loginFormBloc.submit();

  });
  // test('confirm password different de password', () async {
  //   final expectedStates = [
  //     FormBlocSubmitting<String, String>(
  //       isValidByStep: const {0: false},
  //       fieldBlocs: {
  //         0: {loginFormBloc.email.name: loginFormBloc.email,
  //           loginFormBloc.password.name: loginFormBloc.password,},
  //       },
  //     ),
  //     FormBlocSubmissionFailed<String, String>(
  //       isValidByStep: const {0: false},
  //       fieldBlocs: {
  //         0: {loginFormBloc.email.name: loginFormBloc.email,
  //           loginFormBloc.password.name: loginFormBloc.password,},
  //       },
  //     ),
  //     FormBlocLoaded<String, String>(
  //       isValidByStep: const {0: false},
  //       fieldBlocs: {
  //         0: {loginFormBloc.email.name: loginFormBloc.email,
  //           loginFormBloc.password.name: loginFormBloc.password,},
  //       },
  //     ),
  //   ];
  //
  //   expect(loginFormBloc.stream, emitsInOrder(expectedStates));
  //
  //
  //   loginFormBloc.email.updateValue("alexandre.maillot97@gmail.com");
  //   loginFormBloc.password.updateValue("123456789");
  //   loginFormBloc.submit();
  // });

  test('No password', () async {
    final expectedStates = [
      FormBlocSubmitting<String, String>(
        isValidByStep: const {0: false},
        fieldBlocs: {
          0: {loginFormBloc.email.name: loginFormBloc.email,
            loginFormBloc.password.name: loginFormBloc.password,},
        },
      ),
      FormBlocSubmissionFailed<String, String>(
        isValidByStep: const {0: false},
        fieldBlocs: {
          0: {loginFormBloc.email.name: loginFormBloc.email,
            loginFormBloc.password.name: loginFormBloc.password,},
        },
      ),
      FormBlocLoaded<String, String>(
        isValidByStep: const {0: false},
        fieldBlocs: {
          0: {loginFormBloc.email.name: loginFormBloc.email,
            loginFormBloc.password.name: loginFormBloc.password,},
        },
      ),
    ];

    expect(loginFormBloc.stream, emitsInOrder(expectedStates));


    loginFormBloc.email.updateValue("alexandre.maillot97@gmail.com");
    loginFormBloc.password.updateValue("");
    loginFormBloc.submit();
  });
  test('No email', () async {
    final expectedStates = [
      FormBlocSubmitting<String, String>(
        isValidByStep: const {0: false},
        fieldBlocs: {
          0: {loginFormBloc.email.name: loginFormBloc.email,
            loginFormBloc.password.name: loginFormBloc.password,},
        },
      ),
      FormBlocSubmissionFailed<String, String>(
        isValidByStep: const {0: false},
        fieldBlocs: {
          0: {loginFormBloc.email.name: loginFormBloc.email,
            loginFormBloc.password.name: loginFormBloc.password,},
        },
      ),
      FormBlocLoaded<String, String>(
        isValidByStep: const {0: false},
        fieldBlocs: {
          0: {loginFormBloc.email.name: loginFormBloc.email,
            loginFormBloc.password.name: loginFormBloc.password,},
        },
      ),
    ];

    expect(loginFormBloc.stream, emitsInOrder(expectedStates));


    loginFormBloc.email.updateValue("");
    loginFormBloc.password.updateValue("123456789");
    loginFormBloc.submit();
  });

  test('Submit formulaire rempli correctement', () async {
    final expectedStates = [
      FormBlocSubmitting<String, String>(
        isValidByStep: const {0: false},
        fieldBlocs: {
          0: {loginFormBloc.email.name: loginFormBloc.email,
            loginFormBloc.password.name: loginFormBloc.password,},
        },
      ),
      FormBlocSubmitting<String, String>(
        isValidByStep: const {0: true},
        fieldBlocs: {
          0: {loginFormBloc.email.name: loginFormBloc.email,
            loginFormBloc.password.name: loginFormBloc.password,},
        },
      ),
      FormBlocSuccess<String, String>(
        isValidByStep: const {0: true},
        fieldBlocs: {
          0: {loginFormBloc.email.name: loginFormBloc.email,
            loginFormBloc.password.name: loginFormBloc.password,},
        },
      ),
    ];

    expect(loginFormBloc.stream, emitsInOrder(expectedStates));


    loginFormBloc.email.updateValue("alexandre.maillot97@gmail.com");
    loginFormBloc.password.updateValue("123456789");
    loginFormBloc.submit();
  });



}