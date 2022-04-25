import 'package:authentication_repository/authentication_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:o_spawn_cup/app/app.dart';
import 'package:o_spawn_cup/models/game_name.dart';
import 'package:o_spawn_cup/models/tournament/tournament.dart';
import 'package:o_spawn_cup/pages/cup_details/view/cup_detail_page.dart';
import 'package:o_spawn_cup/pages/form_tournament/form_tournament.dart';
import 'package:o_spawn_cup/pages/home/view/home.dart';
import 'package:o_spawn_cup/pages/list_cup/list_cup.dart';
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
    var app = const AppState(status: null, user: null);
    expect(
      onGenerateAppViewPages(app: app, pages: []),
      [
        isA<MaterialPage>().having((p) => p.child, '', isA<StartPage>()),
      ],
    );
  });
  group('Authenticated', () {
    test('authenticated', () {
      var app = AppState(
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
      var app = AppState(
          status: AppStatus.authenticated, user: user, gameName: gameName);
      expect(
        onGenerateAppViewPages(app: app, pages: []),
        [
          isA<MaterialPage>().having((p) => p.child, '', isA<Home>()),
          isA<MaterialPage>().having((p) => p.child, '', isA<ListCupPage>()),
        ],
      );
    });
    test('tournamentSelect', () {
      var app = AppState(
          status: AppStatus.authenticated,
          user: user,
          gameName: gameName,
          tournament: tournament);
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
      var app = AppState(
          status: AppStatus.authenticated,
          user: user,
          gameName: gameName,
          tournament: tournament,
          formTournamentStatus: null);
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
      var app = AppState(
          status: AppStatus.authenticated,
          user: user,
          gameName: gameName,
          tournament: tournament,
          formTournamentStatus: FormTournamentStatus.enCreation);
      expect(
        onGenerateAppViewPages(app: app),
        [
          isA<MaterialPage>().having((p) => p.child, '', isA<Home>()),
          isA<MaterialPage>().having(
              (p) => p.child,
              '',
              isA<FormTournament>()
                  .having((p0) => p0.tournament, 'tournois', null)),
        ],
      );
    });
    test('form tournament en modification', () {
      var app = AppState(
          status: AppStatus.authenticated,
          user: user,
          gameName: gameName,
          tournament: tournament,
          formTournamentStatus: FormTournamentStatus.enModification);
      expect(
        onGenerateAppViewPages(app: app),
        [
          isA<MaterialPage>().having((p) => p.child, '', isA<Home>()),
          isA<MaterialPage>().having(
              (p) => p.child,
              '',
              isA<FormTournament>()
                  .having((p0) => p0.tournament, 'tournois', tournament)),
        ],
      );
    });
  });

  test('unauthenticated', () {
    var app = const AppState(status: AppStatus.unauthenticated, user: null);
    expect(
      onGenerateAppViewPages(app: app, pages: []),
      [
        isA<MaterialPage>().having((p) => p.child, '', isA<StartPage>()),
      ],
    );
  });
}
