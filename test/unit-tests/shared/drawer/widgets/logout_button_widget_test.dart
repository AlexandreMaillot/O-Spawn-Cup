import 'package:authentication_repository/authentication_repository.dart';
import 'package:flow_builder/flow_builder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:o_spawn_cup/app/bloc/app_bloc.dart';
import 'package:o_spawn_cup/models/game_name.dart';
import 'package:o_spawn_cup/shared/drawer/drawer.dart';

class MockAppBloc extends Mock implements AppBloc {}

void main() {
  late AppState appState;
  late MockAppBloc appBloc;
  setUp(() {
    appBloc = MockAppBloc();
    appState = const AppState(
      status: AppStatus.authenticated,
      gameName: GameName.fornite,
    );
    const myUser = User(id: '1234');
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
  testWidgets('onPressed', (WidgetTester tester) async {
    late AppState stateModified;
    await tester.pumpWidget(
      BlocProvider<AppBloc>(
        create: (context) => appBloc,
        child: MaterialApp(
          home: FlowBuilder<AppState>(
            onGeneratePages: (state, pages) {
              stateModified = state;

              return [
                const MaterialPage(
                  child: Material(
                    child: LogoutButton(),
                  ),
                ),
              ];
            },
            state: appState,
          ),
        ),
      ),
    );
    //
    await tester.tap(find.byType(TextButton));
  });
}
