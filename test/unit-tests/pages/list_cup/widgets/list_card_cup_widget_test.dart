import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:network_image_mock/network_image_mock.dart';
import 'package:o_spawn_cup/models/TournamentType/tournament_type.dart';
import 'package:o_spawn_cup/models/tournament/tournament.dart';
import 'package:o_spawn_cup/models/tournament/tournament_state.dart';
import 'package:o_spawn_cup/pages/list_cup/list_cup.dart';

class MockTournament extends Mock implements Tournament {}

void main() {
  late MockTournament tournament;
  setUp(() {
    tournament = MockTournament();
  });
  testWidgets('initialisation du widget', (WidgetTester tester) async {
    when(
      () => tournament.state,
    ).thenReturn(TournamentState.enCours);
    when(
      () => tournament.imageUrl,
    ).thenReturn(
      '',
    );
    when(
      () => tournament.tournamentType,
    ).thenReturn(TournamentType.trio);
    await mockNetworkImagesFor(
      () => tester.pumpWidget(
        MaterialApp(
          home: Material(
            child: Column(
              children: [
                ListCardCup(
                  listCup: [
                    tournament,
                    tournament,
                    tournament,
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  });
  testWidgets('Affichage des 3 tournois', (WidgetTester tester) async {
    when(
      () => tournament.state,
    ).thenReturn(TournamentState.enCours);
    when(
      () => tournament.imageUrl,
    ).thenReturn(
      '',
    );
    when(
      () => tournament.tournamentType,
    ).thenReturn(TournamentType.trio);
    await mockNetworkImagesFor(
      () => tester.pumpWidget(
        MaterialApp(
          home: Material(
            child: Column(
              children: [
                ListCardCup(
                  listCup: [
                    tournament,
                    tournament,
                    tournament,
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
    expect(find.byType(CardCup), findsNWidgets(3));
  });
  group('Test widget', () {});
}
