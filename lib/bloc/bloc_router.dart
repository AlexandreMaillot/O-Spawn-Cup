
import "package:flutter/material.dart";
import 'package:flutter_bloc/flutter_bloc.dart' as fbloc;
import "package:o_spawn_cup/bloc/bloc_list_cup.dart";
import "package:o_spawn_cup/bloc/bloc_list_game.dart";
import 'package:o_spawn_cup/bloc/bloc_provider.dart';
import "package:o_spawn_cup/bloc/bloc_tournament_detail.dart";

import "package:o_spawn_cup/models/Tournament/tournament.dart";
import "package:o_spawn_cup/models/game_name.dart";
import "package:o_spawn_cup/ui/view/form_tournament.dart";
import "package:o_spawn_cup/ui/view/home.dart";
import "package:o_spawn_cup/ui/view/list_cup.dart";
import "package:o_spawn_cup/ui/view/sign_cup.dart";


class BlocRouter {


  MaterialPageRoute cupSelect(GameName gameName) => MaterialPageRoute(builder: (context) => ListCup(gameName: gameName),);
  MaterialPageRoute cupDetail(Tournament tournament) => MaterialPageRoute(builder: (context) => SignCup(tournament: tournament,),);
  MaterialPageRoute cupForm() => MaterialPageRoute(builder: (context) => FormTournament(),);
  //
  BlocProvider allGames() => BlocProvider<BlocListGame>(bloc: BlocListGame(), child: Home());
  BlocProvider tournamentDetail(Tournament t) => BlocProvider<BlocTournamentDetail>(bloc: BlocTournamentDetail(tournament: t), child: SignCup(tournament: t,));
  // fbloc.MultiBlocProvider mb() => fbloc.MultiBlocProvider(providers: [
  //   fbloc.BlocProvider<BlocFormCup>(create: (context) => BlocFormCup(),),
  // ], child: FormTournament());
  // BlocProvider sport(Sport sport) => BlocProvider<BlocLeague>(list_tournament_bloc: BlocLeague(sport.name), child: SportScreen(sport: sport));
}