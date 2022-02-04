
import 'package:flutter/material.dart';
import 'package:o_spawn_cup/models/card_game.dart';
import 'package:o_spawn_cup/models/game_name.dart';
import 'package:o_spawn_cup/ui/CustomsWidgets/tile_image_pre.dart';
import 'package:o_spawn_cup/ui/CustomsWidgets/widget_num_player_by_team.dart';

Color colorTheme = const Color(0xffFFD739);
Color colorBackgroundTheme = const Color(0xff191919);
Color colorTextTheme = const Color(0xff201607);
Color colorHintTextTheme = const Color(0xff707070);
Color colorOpen = const Color(0xff28F202);
Color colorInProgress = const Color(0xff006FFF);
Color colorClose = const Color(0xffFF0000);


List<CardGame> listCardGame = [
  CardGame("assets/images/csgoBackground.png", GameName.CSGO),
  CardGame("assets/images/forniteBackground.png", GameName.Fornite),
  CardGame("assets/images/lolBackground.png", GameName.LeagueOfLegend),
  CardGame("assets/images/valorantBackground.png", GameName.Valorant),
];
List<WidgetNumPlayerByTeam> listWidgetNumPlayerByTeam = [
  WidgetNumPlayerByTeam(image: "assets/images/img_onePlayer.png",index: 0,),
  WidgetNumPlayerByTeam(image: "assets/images/img_twoPlayer.png",index: 1,),
  WidgetNumPlayerByTeam(image: "assets/images/img_threePlayer.png",index: 2,),
  WidgetNumPlayerByTeam(image: "assets/images/img_fourPlayer.png",index: 3,),
  WidgetNumPlayerByTeam(image: "assets/images/img_fivePlayer.png",index: 4,),
];

List<TileImagePre> listImagePre = [
  TileImagePre(image: "assets/images/csgoBackground.png"),
  TileImagePre(image: "assets/images/forniteBackground.png"),
  TileImagePre(image: "assets/images/lolBackground.png"),
  TileImagePre(image: "assets/images/valorantBackground.png"),
  TileImagePre(image: "assets/images/csgoBackground.png"),
  TileImagePre(image: "assets/images/csgoBackground.png"),
];