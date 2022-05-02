import 'package:authentication_repository/authentication_repository.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:o_spawn_cup/app/app.dart';
import 'package:o_spawn_cup/models/Member/member.dart';
import 'package:o_spawn_cup/pages/profil/cubit/profil_cubit.dart';
import 'package:o_spawn_cup/repository/member_repository.dart';

class MockAppBloc extends Mock implements AppBloc {}

class MockMemberRepository extends Mock implements MemberRepository {}

class MockMember extends Mock implements Member {}

void main() {
  late MockMemberRepository memberRepository;
  late MockAppBloc appBloc;
  late MockMember member;
  setUp(() {
    memberRepository = MockMemberRepository();
    appBloc = MockAppBloc();
    member = MockMember();
  });
  blocTest(
    'Initialisation ProfilCubit',
    setUp: () {
      when(
        () => appBloc.state,
      ).thenReturn(
        const AppState(status: AppStatus.authenticated, user: User(id: '1234')),
      );
      when(
        () => memberRepository.currentMember(any()),
      ).thenAnswer((invocation) => Stream.value(member));
    },
    build: () => ProfilCubit(
      appBloc: appBloc,
      memberRepository: memberRepository,
    ),
    expect: () => [
      isA<ProfilMemberChanged>(),
    ],
  );
}
