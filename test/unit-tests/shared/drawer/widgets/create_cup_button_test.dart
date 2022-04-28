import 'package:authentication_repository/authentication_repository.dart';
import 'package:flow_builder/flow_builder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:o_spawn_cup/app/bloc/app_bloc.dart';
import 'package:o_spawn_cup/models/Member/member.dart';
import 'package:o_spawn_cup/models/game_name.dart';
import 'package:o_spawn_cup/shared/drawer/drawer.dart';

class MockAppBloc extends Mock implements AppBloc {}

class MockDrawerCubit extends Mock implements DrawerCubit {}

void main() {
  late AppState appState;
  late MockAppBloc appBloc;
  late MockDrawerCubit drawerCubit;
  setUp(() {
    drawerCubit = MockDrawerCubit();
    appBloc = MockAppBloc();
    appState = const AppState(
      status: AppStatus.authenticated,
      gameName: GameName.fornite,
    );
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
      () => drawerCubit.close(),
    ).thenAnswer((invocation) => Future<void>.value());

    when(
      () => appBloc.close(),
    ).thenAnswer((invocation) => Future<void>.value());
    when(
      () => appBloc.stream,
    ).thenAnswer(
      (invocation) => Stream.value(
        const AppState(status: AppStatus.authenticated, user: myUser),
      ),
    );
  });

  group('Admin UI', () {
    testWidgets(
      'Bouton creation de tournois non visible si pas admin',
      (WidgetTester tester) async {
        late AppState stateModified;
        await tester.pumpWidget(
          MultiBlocProvider(
            providers: [
              BlocProvider<AppBloc>(
                create: (context) => appBloc,
              ),
              BlocProvider<DrawerCubit>(
                create: (context) => drawerCubit,
              ),
            ],
            child: MaterialApp(
              home: FlowBuilder<AppState>(
                onGeneratePages: (state, pages) {
                  stateModified = state;

                  return [
                    const MaterialPage(
                      child: Material(
                        child: CreateCupButton(),
                      ),
                    ),
                  ];
                },
                state: appState,
              ),
            ),
          ),
        );

        expect(
          find.byKey(const Key('CreateCupButton')),
          findsNothing,
        );
      },
    );
    testWidgets(
      'Bouton creation de tournois visible si admin',
      (WidgetTester tester) async {
        when(
          () => drawerCubit.member,
        ).thenReturn(const Member(uid: '1234', isAdmin: true));

        late AppState stateModified;
        await tester.pumpWidget(
          MultiBlocProvider(
            providers: [
              BlocProvider<AppBloc>(
                create: (context) => appBloc,
              ),
              BlocProvider<DrawerCubit>(
                create: (context) => drawerCubit,
              ),
            ],
            child: MaterialApp(
              home: FlowBuilder<AppState>(
                onGeneratePages: (state, pages) {
                  stateModified = state;

                  return [
                    const MaterialPage(
                      child: Material(
                        child: CreateCupButton(),
                      ),
                    ),
                  ];
                },
                state: appState,
              ),
            ),
          ),
        );

        expect(
          find.byKey(const Key('CreateCupButton')),
          findsOneWidget,
        );
      },
    );
  });
  testWidgets('onPressed', (WidgetTester tester) async {
    when(
      () => drawerCubit.member,
    ).thenReturn(const Member(uid: '1234', isAdmin: true));

    late AppState stateModified;
    await tester.pumpWidget(
      MultiBlocProvider(
        providers: [
          BlocProvider<AppBloc>(
            create: (context) => appBloc,
          ),
          BlocProvider<DrawerCubit>(
            create: (context) => drawerCubit,
          ),
        ],
        child: MaterialApp(
          home: FlowBuilder<AppState>(
            onGeneratePages: (state, pages) {
              stateModified = state;

              return [
                const MaterialPage(
                  child: Material(
                    child: CreateCupButton(),
                  ),
                ),
              ];
            },
            state: appState,
          ),
        ),
      ),
    );

    await tester.press(find.byKey(const Key('CreateCupButton')));
  });
}
