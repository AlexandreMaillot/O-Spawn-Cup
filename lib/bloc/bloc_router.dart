
import 'package:flutter/material.dart';
import 'package:o_spawn_cup/bloc/bloc_list_game.dart';
import 'package:o_spawn_cup/ui/view/home.dart';

import 'bloc_provider.dart';

class BlocRouter {
  // MaterialPageRoute sportDetail(Sport s) => MaterialPageRoute(builder: (context) => sport(s),);
  //
  BlocProvider allGames() => BlocProvider<BlocListGame>(bloc: BlocListGame(), child: Home());
  // BlocProvider sport(Sport sport) => BlocProvider<BlocLeague>(bloc: BlocLeague(sport.name), child: SportScreen(sport: sport));
}