
import 'package:flutter/material.dart';
import 'package:o_spawn_cup/model/card_game.dart';
import 'package:o_spawn_cup/model/game_name.dart';

Color colorTheme = const Color(0xffA9E5C7);
Color colorBackgroundTheme = const Color(0xff191919);


List<CardGame> listCardGame = [
  CardGame("assets/images/csgoBackground.png", GameName.CSGO),
  CardGame("assets/images/forniteBackground.png", GameName.Fornite),
  CardGame("assets/images/lolBackground.png", GameName.LeagueOfLegend),
  CardGame("assets/images/valorantBackground.png", GameName.Valorant),
];