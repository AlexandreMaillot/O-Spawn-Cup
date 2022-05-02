import 'package:authentication_repository/authentication_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:o_spawn_cup/app/app.dart';
import 'package:o_spawn_cup/app/bloc/app_bloc.dart';
import 'package:o_spawn_cup/models/game_name.dart';
import 'package:o_spawn_cup/models/tournament/tournament.dart';
import 'package:o_spawn_cup/pages/cup_details/view/cup_detail_page.dart';
import 'package:o_spawn_cup/pages/form_tournament/form_tournament.dart';
import 'package:o_spawn_cup/pages/home/view/home.dart';
import 'package:o_spawn_cup/pages/list_cup/list_cup.dart';
import 'package:o_spawn_cup/pages/profil/view/profil.dart';
import 'package:o_spawn_cup/pages/start_page/view/start_page.dart';

class MockUser extends Mock implements User {}

class MockTournament extends Mock implements Tournament {}

void main() {
  late MockUser user;
  late GameName gameName;
  late MockTournament tournament;
  setUp(() {
    user = MockUser();
    tournament = MockTournament();
    gameName = GameName.fornite;
  });
  test('init page', () {
    const app = AppState(status: null, user: null);
    expect(
      onGenerateAppViewPages(app: app, pages: []),
      [
        isA<MaterialPage>().having((p) => p.child, '', isA<StartPage>()),
      ],
    );
  });
  group('Authenticated', () {
    test('authenticated', () {
      final app = AppState(
        status: AppStatus.authenticated,
        user: user,
      );
      expect(
        onGenerateAppViewPages(app: app),
        [
          isA<MaterialPage>().having((p) => p.child, '', isA<Home>()),
        ],
      );
    });

    test('gameSelect', () {
      final app = AppState(
        status: AppStatus.authenticated,
        user: user,
        gameName: gameName,
      );
      expect(
        onGenerateAppViewPages(app: app, pages: []),
        [
          isA<MaterialPage>().having((p) => p.child, '', isA<Home>()),
          isA<MaterialPage>().having((p) => p.child, '', isA<ListCupPage>()),
        ],
      );
    });
    test('Profil', () {
      final app = AppState(
        status: AppStatus.authenticated,
        user: user,
        appStep: AppStep.enVisualisationProfil,
      );
      expect(
        onGenerateAppViewPages(app: app, pages: []),
        [
          isA<MaterialPage>().having((p) => p.child, '', isA<Home>()),
          isA<MaterialPage>().having((p) => p.child, '', isA<Profil>()),
        ],
      );
    });
    test('tournamentSelect', () {
      final app = AppState(
        status: AppStatus.authenticated,
        user: user,
        gameName: gameName,
        tournament: tournament,
      );
      expect(
        onGenerateAppViewPages(app: app),
        [
          isA<MaterialPage>().having((p) => p.child, '', isA<Home>()),
          isA<MaterialPage>().having((p) => p.child, '', isA<ListCupPage>()),
          isA<MaterialPage>().having((p) => p.child, '', isA<CupDetailPage>()),
        ],
      );
    });
    test('form tournament null', () {
      final app = AppState(
        status: AppStatus.authenticated,
        user: user,
        gameName: gameName,
        tournament: tournament,
        appStep: null,
      );
      expect(
        onGenerateAppViewPages(app: app),
        [
          isA<MaterialPage>().having((p) => p.child, '', isA<Home>()),
          isA<MaterialPage>().having((p) => p.child, '', isA<ListCupPage>()),
          isA<MaterialPage>().having((p) => p.child, '', isA<CupDetailPage>()),
        ],
      );
    });
    test('form tournament en creation', () {
      final app = AppState(
        status: AppStatus.authenticated,
        user: user,
        gameName: gameName,
        tournament: tournament,
        appStep: AppStep.enCreationFormulaire,
      );
      expect(
        onGenerateAppViewPages(app: app),
        [
          isA<MaterialPage>().having((p) => p.child, '', isA<Home>()),
          isA<MaterialPage>().having(
            (p) => p.child,
            '',
            isA<FormTournament>()
                .having((p0) => p0.tournament, 'tournois', null),
          ),
        ],
      );
    });
    test('form tournament en modification', () {
      final app = AppState(
        status: AppStatus.authenticated,
        user: user,
        gameName: gameName,
        tournament: tournament,
        appStep: AppStep.enModificationFormulaire,
      );
      expect(
        onGenerateAppViewPages(app: app),
        [
          isA<MaterialPage>().having((p) => p.child, '', isA<Home>()),
          isA<MaterialPage>().having(
            (p) => p.child,
            '',
            isA<FormTournament>()
                .having((p0) => p0.tournament, 'tournois', tournament),
          ),
        ],
      );
    });
  });

  test('unauthenticated', () {
    const app = AppState(status: AppStatus.unauthenticated, user: null);
    expect(
      onGenerateAppViewPages(app: app, pages: []),
      [
        isA<MaterialPage>().having((p) => p.child, '', isA<StartPage>()),
      ],
    );
  });
}
