import 'package:authentication_repository/authentication_repository.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_form_bloc/flutter_form_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:o_spawn_cup/models/Member/member.dart';
import 'package:o_spawn_cup/pages/sign_up/bloc/sign_up_form_bloc.dart';
import 'package:o_spawn_cup/services/firebase_handler.dart';

class AuthenticationRepositoryMock extends Mock
    implements AuthenticationRepository {}

class FirebaseHandlerMock extends Mock implements FirebaseHandler {}

void main() {
  late AuthenticationRepositoryMock authenticationRepository;
  late List<FormBlocState<String, String>> expectedStates;
  late Member m;
  setUpAll(() {
    authenticationRepository = AuthenticationRepositoryMock();
  });
  blocTest(
    'FormSignUpStateInit',
    build: () =>
        SignUpFormBloc(authenticationRepository: authenticationRepository),
    expect: () => [],
  );
}
