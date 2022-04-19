import 'package:flutter/widgets.dart';
import 'package:o_spawn_cup/app/bloc/app_bloc.dart';
import 'package:o_spawn_cup/pages/cup_details/view/cup_detail_page.dart';
import 'package:o_spawn_cup/pages/form_tournament/form_tournament.dart';
import 'package:o_spawn_cup/pages/home/view/home.dart';
import 'package:o_spawn_cup/pages/list_cup/list_cup.dart';
import 'package:o_spawn_cup/pages/start_page/view/start_page.dart';

List<Page> onGenerateAppViewPages(AppState state, List<Page<dynamic>> pages) {

  final gameSelect = state.gameName;
  final tournamentSelect = state.tournament;
  final creatingTournament = state.creatingTournament;

  switch (state.status) {
    case AppStatus.authenticated:
      if(creatingTournament){
        return [
          Home.page(),
          FormTournament(tournament: null).page(),
        ];

      }
      return [
          Home.page(),
          if(gameSelect != null) ListCupPage(gameName: gameSelect).page(),
          if(tournamentSelect != null) CupDetailPage(tournament: tournamentSelect).page(),
      ];
    case AppStatus.unauthenticated:
      return [
        StartPage.page()
      ];
  }
}
