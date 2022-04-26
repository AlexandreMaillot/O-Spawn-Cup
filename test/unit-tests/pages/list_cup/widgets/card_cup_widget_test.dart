import 'package:flutter/material.dart';
import 'package:flutter_form_bloc/flutter_form_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:network_image_mock/network_image_mock.dart';
import 'package:o_spawn_cup/constant.dart';
import 'package:o_spawn_cup/models/TournamentType/tournament_type.dart';
import 'package:o_spawn_cup/models/tournament/tournament.dart';
import 'package:o_spawn_cup/models/tournament/tournament_state.dart';
import 'package:o_spawn_cup/pages/list_cup/list_cup.dart';
import 'package:o_spawn_cup/shared/widgets/text_element.dart';

class MockTournament extends Mock implements Tournament {}

void main() {
  late MockTournament tournament;
  setUp(() {
    tournament = MockTournament();
  });
  group('Initialisation du widget', () {
    setUp(() {
      when(
        () => tournament.imageUrl,
      ).thenReturn(
        '',
      );
      when(
        () => tournament.tournamentType,
      ).thenReturn(TournamentType.trio);
      when(
        () => tournament.state,
      ).thenReturn(TournamentState.inscriptionOuverte);
    });
    testWidgets('initialisation du widget', (WidgetTester tester) async {
      await mockNetworkImagesFor(
        () => tester.pumpWidget(
          MaterialApp(
            home: Material(
              child: CardCup(tournament: tournament),
            ),
          ),
        ),
      );
    });
  });

  group('Couleur bordure card', () {
    setUp(() {
      when(
        () => tournament.imageUrl,
      ).thenReturn(
        '',
      );
      when(
        () => tournament.tournamentType,
      ).thenReturn(TournamentType.trio);
    });
    testWidgets(
      'Couleur de la bordure etat tournois inscription ouverte',
      (WidgetTester tester) async {
        when(
          () => tournament.state,
        ).thenReturn(TournamentState.inscriptionOuverte);
        await mockNetworkImagesFor(
          () => tester.pumpWidget(
            MaterialApp(
              home: Material(
                child: CardCup(tournament: tournament),
              ),
            ),
          ),
        );
        final borderFind = find.byType(Container);
        final border = tester.widget<Container>(borderFind.first);
        final decoration = border.decoration! as BoxDecoration;
        expect(
          decoration.border,
          const Border.fromBorderSide(BorderSide(color: colorOpen, width: 2)),
        );
      },
    );
    testWidgets(
      'Couleur de la bordure etat tournois en cours',
      (WidgetTester tester) async {
        when(
          () => tournament.state,
        ).thenReturn(TournamentState.enCours);
        await mockNetworkImagesFor(
          () => tester.pumpWidget(
            MaterialApp(
              home: Material(
                child: CardCup(tournament: tournament),
              ),
            ),
          ),
        );
        final borderFind = find.byType(Container);
        final border = tester.widget<Container>(borderFind.first);
        final decoration = border.decoration! as BoxDecoration;
        expect(
          decoration.border,
          const Border.fromBorderSide(
            BorderSide(color: colorInProgress, width: 2),
          ),
        );
      },
    );
    testWidgets(
      'Couleur de la bordure etat tournois fermer',
      (WidgetTester tester) async {
        when(
          () => tournament.state,
        ).thenReturn(TournamentState.inscriptionFermer);
        await mockNetworkImagesFor(
          () => tester.pumpWidget(
            MaterialApp(
              home: Material(
                child: CardCup(tournament: tournament),
              ),
            ),
          ),
        );
        final borderFind = find.byType(Container);
        final border = tester.widget<Container>(borderFind.first);
        final decoration = border.decoration! as BoxDecoration;
        expect(
          decoration.border,
          const Border.fromBorderSide(
            BorderSide(color: colorClose, width: 2),
          ),
        );
      },
    );
    testWidgets(
      'Couleur de la bordure etat tournois complet',
      (WidgetTester tester) async {
        when(
          () => tournament.state,
        ).thenReturn(TournamentState.complet);
        await mockNetworkImagesFor(
          () => tester.pumpWidget(
            MaterialApp(
              home: Material(
                child: CardCup(tournament: tournament),
              ),
            ),
          ),
        );
        final borderFind = find.byType(Container);
        final border = tester.widget<Container>(borderFind.first);
        final decoration = border.decoration! as BoxDecoration;
        expect(
          decoration.border,
          const Border.fromBorderSide(
            BorderSide(color: colorClose, width: 2),
          ),
        );
      },
    );
    testWidgets(
      'Couleur de la bordure etat tournois terminer',
      (WidgetTester tester) async {
        when(
          () => tournament.state,
        ).thenReturn(TournamentState.terminer);
        await mockNetworkImagesFor(
          () => tester.pumpWidget(
            MaterialApp(
              home: Material(
                child: CardCup(tournament: tournament),
              ),
            ),
          ),
        );
        final borderFind = find.byType(Container);
        final border = tester.widget<Container>(borderFind.first);
        final decoration = border.decoration! as BoxDecoration;
        expect(
          decoration.border,
          const Border.fromBorderSide(
            BorderSide(color: colorClose, width: 2),
          ),
        );
      },
    );
    testWidgets(
      'Couleur de la bordure etat tournois annuler',
      (WidgetTester tester) async {
        when(
          () => tournament.state,
        ).thenReturn(TournamentState.annuler);
        await mockNetworkImagesFor(
          () => tester.pumpWidget(
            MaterialApp(
              home: Material(
                child: CardCup(tournament: tournament),
              ),
            ),
          ),
        );
        final borderFind = find.byType(Container);
        final border = tester.widget<Container>(borderFind.first);
        final decoration = border.decoration! as BoxDecoration;
        expect(
          decoration.border,
          const Border.fromBorderSide(
            BorderSide(color: colorClose, width: 2),
          ),
        );
      },
    );
  });
  group('tag hero egal document id', () {
    const documentId = '1234';
    setUp(() {
      when(
        () => tournament.imageUrl,
      ).thenReturn(
        '',
      );
      when(
        () => tournament.tournamentType,
      ).thenReturn(TournamentType.trio);
      when(
        () => tournament.documentId,
      ).thenReturn(documentId);
      when(
        () => tournament.state,
      ).thenReturn(TournamentState.annuler);
    });
    testWidgets(
      'tag hero',
      (WidgetTester tester) async {
        await mockNetworkImagesFor(
          () => tester.pumpWidget(
            MaterialApp(
              home: Material(
                child: CardCup(tournament: tournament),
              ),
            ),
          ),
        );
        final heroType = find.byType(Hero);
        final hero = tester.widget<Hero>(heroType.first);
        expect(
          hero.tag,
          'tagcard_cup_$documentId',
        );
      },
    );
  });
  group('Affichage date', () {
    final dateNow = DateTime.now();
    setUp(() {
      when(
        () => tournament.imageUrl,
      ).thenReturn(
        '',
      );
      when(
        () => tournament.tournamentType,
      ).thenReturn(TournamentType.trio);
      when(
        () => tournament.state,
      ).thenReturn(TournamentState.annuler);
      when(
        () => tournament.dateDebutTournois,
      ).thenReturn(dateNow);
    });
    testWidgets(
      'date debut du tournois',
      (WidgetTester tester) async {
        await mockNetworkImagesFor(
          () => tester.pumpWidget(
            MaterialApp(
              home: Material(
                child: CardCup(tournament: tournament),
              ),
            ),
          ),
        );
        final dateType = find.byKey(const Key('DateDebutTournois'));
        final dateElement = tester.widget<TextElement>(dateType);
        expect(
          dateElement.text,
          DateFormat('dd/MM/yyyy hh:mm').format(dateNow),
        );
      },
    );
  });

  group('Affichage type de tournois', () {
    final dateNow = DateTime.now();
    setUp(() {
      when(
        () => tournament.imageUrl,
      ).thenReturn(
        '',
      );
      when(
        () => tournament.tournamentType,
      ).thenReturn(TournamentType.trio);
      when(
        () => tournament.state,
      ).thenReturn(TournamentState.annuler);
    });
    testWidgets(
      'Type de tournois trio',
      (WidgetTester tester) async {
        await mockNetworkImagesFor(
          () => tester.pumpWidget(
            MaterialApp(
              home: Material(
                child: CardCup(tournament: tournament),
              ),
            ),
          ),
        );
        final tournamentType = find.byKey(const Key('TournamentType'));
        final tournamentTypeElement =
            tester.widget<TextElement>(tournamentType);
        expect(
          tournamentTypeElement.text,
          TournamentType.trio.name,
        );
      },
    );
  });
}
