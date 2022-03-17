
import "package:flutter/material.dart";

import "package:o_spawn_cup/models/Tournament/tournament.dart";
import "package:o_spawn_cup/models/game_name.dart";
import 'package:o_spawn_cup/form_tournament/view/form_tournament.dart';
import 'package:o_spawn_cup/home/view/home.dart';
import 'package:o_spawn_cup/list_cup/view/list_cup_page.dart';
import 'package:o_spawn_cup/cup_details/view/cup_detail_page.dart';


class BlocRouter {


  MaterialPageRoute cupSelect(GameName gameName) => MaterialPageRoute(builder: (context) => ListCupPage(gameName: gameName),);
  MaterialPageRoute cupDetail(Tournament tournament) => MaterialPageRoute(builder: (context) => CupDetailPage(tournament: tournament,),);
  MaterialPageRoute cupForm(Tournament? tournament) => MaterialPageRoute(builder: (context) => FormTournament(tournament: tournament),);

}