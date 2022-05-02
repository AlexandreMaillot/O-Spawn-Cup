import 'package:authentication_repository/authentication_repository.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockingjay/mockingjay.dart';
import 'package:o_spawn_cup/app/bloc/app_bloc.dart';
import 'package:o_spawn_cup/models/Member/member.dart';
import 'package:o_spawn_cup/repository/member_repository.dart';
import 'package:o_spawn_cup/shared/drawer/cubit/drawer_cubit.dart';

class MockMemberRepository extends Mock implements MemberRepository {}

class MockAppBloc extends Mock implements AppBloc {}

class MockUser extends Mock implements User {}

void main() {
  late MockAppBloc appBloc;
  late Member myMember;
  late MockMemberRepository memberRepository;

  setUp(() {
    memberRepository = MockMemberRepository();
    appBloc = MockAppBloc();
  });

  blocTest(
    'Init DrawerCubit',
    setUp: () {
      const myUser = User(id: '1234');
      myMember = const Member(uid: '1234');
      when(
        () => appBloc.state,
      ).thenReturn(
        const AppState(status: AppStatus.authenticated, user: myUser),
      );
      when(
        () => memberRepository.currentMember(any()),
      ).thenAnswer((invocation) => Stream.value(myMember));
    },
    build: () =>
        DrawerCubit(memberRepository: memberRepository, appBloc: appBloc),
    expect: () => [
      DrawerMemberChanged(member: myMember),
    ],
  );
}
