import 'package:flutter/widgets.dart';
import 'package:o_spawn_cup/app/bloc/app_bloc.dart';
import 'package:o_spawn_cup/pages/cup_details/view/cup_detail_page.dart';
import 'package:o_spawn_cup/pages/form_tournament/form_tournament.dart';
import 'package:o_spawn_cup/pages/home/view/home.dart';
import 'package:o_spawn_cup/pages/list_cup/list_cup.dart';
import 'package:o_spawn_cup/pages/start_page/view/start_page.dart';

List<Page> onGenerateAppViewPages({
  required AppState app,
  List<Page<dynamic>>? pages,
}) {
  final gameSelect = app.gameName;
  final tournamentSelect = app.tournament;

  switch (app.status) {
    case AppStatus.authenticated:
      switch (app.formTournamentStatus) {
        case FormTournamentStatus.enCreation:
          return [
            Home.page(),
            FormTournament.page(tournois: null),
          ];
        case FormTournamentStatus.enModification:
          return [
            Home.page(),
            FormTournament.page(tournois: tournamentSelect),
          ];
        case null:
          return [
            Home.page(),
            if (gameSelect != null) ListCupPage.page(gameName: gameSelect),
            if (tournamentSelect != null)
              CupDetailPage.page(tournois: tournamentSelect),
          ];
      }
    case AppStatus.unauthenticated:
      return [StartPage.page()];
    case null:
      return [StartPage.page()];
  }
}
