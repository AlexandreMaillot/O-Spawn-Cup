import 'package:authentication_repository/authentication_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:o_spawn_cup/app/bloc/app_bloc.dart';
import 'package:o_spawn_cup/models/Member/member.dart';
import 'package:o_spawn_cup/repository/member_repository.dart';
import 'package:o_spawn_cup/shared/drawer/cubit/drawer_cubit.dart';
import 'package:o_spawn_cup/shared/drawer/view/drawer_view.dart';

class MockMemberRepository extends Mock implements MemberRepository {}

class MockAppBloc extends Mock implements AppBloc {}

class MockDrawerCubit extends Mock implements DrawerCubit {}

void main() {
  late MockDrawerCubit drawerCubit;
  late MockAppBloc appBloc;
  setUp(() {
    appBloc = MockAppBloc();
    drawerCubit = MockDrawerCubit();
    const myUser = User(id: '1234');
    const myMember = Member(uid: '1234', pseudo: 'MonPseudo');

    when(
      () => drawerCubit.stream,
    ).thenAnswer((invocation) => Stream.value(DrawerInitial()));
    when(
      () => drawerCubit.state,
    ).thenAnswer((invocation) => const DrawerMemberChanged(member: myMember));
    when(
      () => drawerCubit.member,
    ).thenReturn(myMember);
    when(
      () => appBloc.close(),
    ).thenAnswer((invocation) => Future<void>.value());
    when(
      () => drawerCubit.close(),
    ).thenAnswer((invocation) => Future<void>.value());
    when(
      () => appBloc.stream,
    ).thenAnswer(
      (invocation) => Stream.value(
        const AppState(status: AppStatus.authenticated, user: myUser),
      ),
    );
  });
  group('Initialisation  du widget', () {
    testWidgets('initialisation du widget', (WidgetTester tester) async {
      await tester.pumpWidget(
        MultiBlocProvider(
          providers: [
            BlocProvider<DrawerCubit>(
              create: (context) => drawerCubit,
            ),
            BlocProvider<AppBloc>(
              create: (context) => appBloc,
            ),
          ],
          child: const MaterialApp(home: DrawerView()),
        ),
      );
    });
  });

  group('Membre connecter', () {
    testWidgets('Affichage pseudo', (WidgetTester tester) async {
      await tester.pumpWidget(
        MultiBlocProvider(
          providers: [
            BlocProvider<DrawerCubit>(
              create: (context) => drawerCubit,
            ),
            BlocProvider<AppBloc>(
              create: (context) => appBloc,
            ),
          ],
          child: const MaterialApp(home: DrawerView()),
        ),
      );
      final pseudoFind = find.byKey(const Key('Pseudo'));
      final pseudo = tester.widget<Text>(pseudoFind.first);
      expect(
        pseudo.data,
        'MonPseudo',
      );
    });
  });
}
