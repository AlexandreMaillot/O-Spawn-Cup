import 'package:authentication_repository/authentication_repository.dart';
import 'package:flutter_form_bloc/flutter_form_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:o_spawn_cup/pages/login/bloc/login_form_bloc.dart';

class MockAuthenticationRepository extends Mock
    implements AuthenticationRepository {}

void main() {
  late LoginFormBloc loginFormBloc;
  late AuthenticationRepository authenticationRepository;
  setUp(() {
    authenticationRepository = MockAuthenticationRepository();
    loginFormBloc =
        LoginFormBloc(authenticationRepository: authenticationRepository);
  });

  test('Aucun champ rempli', () {
    final expectedStates = [
      FormBlocSubmitting<String, String>(
        isValidByStep: const {0: false},
        fieldBlocs: {
          0: {
            loginFormBloc.email.name: loginFormBloc.email,
            loginFormBloc.password.name: loginFormBloc.password,
          },
        },
      ),
      FormBlocSubmissionFailed<String, String>(
        isValidByStep: const {0: false},
        fieldBlocs: {
          0: {
            loginFormBloc.email.name: loginFormBloc.email,
            loginFormBloc.password.name: loginFormBloc.password,
          },
        },
      ),
      FormBlocLoaded<String, String>(
        isValidByStep: const {0: false},
        fieldBlocs: {
          0: {
            loginFormBloc.email.name: loginFormBloc.email,
            loginFormBloc.password.name: loginFormBloc.password,
          },
        },
      ),
    ];
    expect(loginFormBloc.stream, emitsInOrder(expectedStates));
    loginFormBloc.submit();
  });
  test('No password', () async {
    final expectedStates = [
      FormBlocSubmitting<String, String>(
        isValidByStep: const {0: false},
        fieldBlocs: {
          0: {
            loginFormBloc.email.name: loginFormBloc.email,
            loginFormBloc.password.name: loginFormBloc.password,
          },
        },
      ),
      FormBlocSubmissionFailed<String, String>(
        isValidByStep: const {0: false},
        fieldBlocs: {
          0: {
            loginFormBloc.email.name: loginFormBloc.email,
            loginFormBloc.password.name: loginFormBloc.password,
          },
        },
      ),
      FormBlocLoaded<String, String>(
        isValidByStep: const {0: false},
        fieldBlocs: {
          0: {
            loginFormBloc.email.name: loginFormBloc.email,
            loginFormBloc.password.name: loginFormBloc.password,
          },
        },
      ),
    ];

    expect(loginFormBloc.stream, emitsInOrder(expectedStates));

    loginFormBloc.email.updateValue('alexandre.maillot97@gmail.com');
    loginFormBloc.password.updateValue('');
    loginFormBloc.submit();
  });
  test('No email', () async {
    final expectedStates = [
      FormBlocSubmitting<String, String>(
        isValidByStep: const {0: false},
        fieldBlocs: {
          0: {
            loginFormBloc.email.name: loginFormBloc.email,
            loginFormBloc.password.name: loginFormBloc.password,
          },
        },
      ),
      FormBlocSubmissionFailed<String, String>(
        isValidByStep: const {0: false},
        fieldBlocs: {
          0: {
            loginFormBloc.email.name: loginFormBloc.email,
            loginFormBloc.password.name: loginFormBloc.password,
          },
        },
      ),
      FormBlocLoaded<String, String>(
        isValidByStep: const {0: false},
        fieldBlocs: {
          0: {
            loginFormBloc.email.name: loginFormBloc.email,
            loginFormBloc.password.name: loginFormBloc.password,
          },
        },
      ),
    ];

    expect(loginFormBloc.stream, emitsInOrder(expectedStates));

    loginFormBloc.email.updateValue('');
    loginFormBloc.password.updateValue('123456789');
    loginFormBloc.submit();
  });

  test('Submit formulaire rempli correctement', () async {
    when(
      () => authenticationRepository.logInWithEmailAndPassword(
        email: 'alexandre.maillot97@gmail.com',
        password: '123456789',
      ),
    ).thenAnswer((_) => Future.value());
    final expectedStates = [
      FormBlocSubmitting<String, String>(
        isValidByStep: const {0: false},
        fieldBlocs: {
          0: {
            loginFormBloc.email.name: loginFormBloc.email,
            loginFormBloc.password.name: loginFormBloc.password,
          },
        },
      ),
      FormBlocSubmitting<String, String>(
        isValidByStep: const {0: true},
        fieldBlocs: {
          0: {
            loginFormBloc.email.name: loginFormBloc.email,
            loginFormBloc.password.name: loginFormBloc.password,
          },
        },
      ),
      FormBlocLoading<String, String>(
        isValidByStep: const {0: true},
        fieldBlocs: {
          0: {
            loginFormBloc.email.name: loginFormBloc.email,
            loginFormBloc.password.name: loginFormBloc.password,
          },
        },
      ),
      FormBlocSuccess<String, String>(
        isValidByStep: const {0: true},
        fieldBlocs: {
          0: {
            loginFormBloc.email.name: loginFormBloc.email,
            loginFormBloc.password.name: loginFormBloc.password,
          },
        },
      ),
    ];

    expect(loginFormBloc.stream, emitsInOrder(expectedStates));

    loginFormBloc.email.updateValue('alexandre.maillot97@gmail.com');
    loginFormBloc.password.updateValue('123456789');
    loginFormBloc.submit();
  });
}
