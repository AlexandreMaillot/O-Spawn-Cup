
import 'package:flutter/material.dart';
import 'package:o_spawn_cup/bloc/bloc_list_cup.dart';
import 'package:o_spawn_cup/bloc/bloc_list_game.dart';
import 'package:o_spawn_cup/bloc/bloc_tournament_detail.dart';
import 'package:o_spawn_cup/models/Tournament/tournament.dart';
import 'package:o_spawn_cup/models/game_name.dart';
import 'package:o_spawn_cup/ui/view/home.dart';
import 'package:o_spawn_cup/ui/view/list_cup.dart';
import 'package:o_spawn_cup/ui/view/sign_cup.dart';

import 'bloc_provider.dart';

class BlocRouter {
  MaterialPageRoute cupSelect(GameName gameName) => MaterialPageRoute(builder: (context) => allCup(gameName),);
  MaterialPageRoute cupDetail(Tournament tournament) => MaterialPageRoute(builder: (context) => tournamentDetail(tournament),);
  //
  BlocProvider allGames() => BlocProvider<BlocListGame>(bloc: BlocListGame(), child: Home());
  BlocProvider allCup(GameName gn) => BlocProvider<BlocListCup>(bloc: BlocListCup(gameName: gn), child: ListCup(gameName: gn,));
  BlocProvider tournamentDetail(Tournament t) => BlocProvider<BlocTournamentDetail>(bloc: BlocTournamentDetail(tournament: t), child: SignCup(tournament: t,));
  // BlocProvider sport(Sport sport) => BlocProvider<BlocLeague>(bloc: BlocLeague(sport.name), child: SportScreen(sport: sport));
}