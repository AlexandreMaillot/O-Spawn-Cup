import 'package:flow_builder/flow_builder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:o_spawn_cup/app/bloc/app_bloc.dart';
import 'package:o_spawn_cup/models/game_name.dart';
import 'package:o_spawn_cup/shared/drawer/drawer.dart';

void main() {
  late AppState appState;
  setUp(() {
    appState = const AppState(
      status: AppStatus.authenticated,
      gameName: GameName.fornite,
    );
  });
  testWidgets('onPressed', (WidgetTester tester) async {
    late AppState stateModified;
    await tester.pumpWidget(
      MaterialApp(
        home: FlowBuilder<AppState>(
          onGeneratePages: (state, pages) {
            stateModified = state;

            return [
              const MaterialPage(
                child: Material(
                  child: HomeButton(),
                ),
              ),
            ];
          },
          state: appState,
        ),
      ),
    );

    await tester.tap(find.byKey(const Key('ElevatedButton')));

    await expectLater(
      stateModified.status,
      AppStatus.authenticated,
    );
    await expectLater(
      stateModified.user,
      stateModified.user,
    );
    await expectLater(
      stateModified.gameName,
      null,
    );
    await expectLater(
      stateModified.tournament,
      null,
    );
  });
}
