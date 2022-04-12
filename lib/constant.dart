import 'package:flutter/material.dart';
import 'package:o_spawn_cup/models/Tournament/tournament_state.dart';
import 'package:o_spawn_cup/models/TournamentType/tournament_type.dart';
import 'package:o_spawn_cup/models/card_game.dart';
import 'package:o_spawn_cup/models/game_name.dart';
import 'package:o_spawn_cup/models/server_type.dart';
import 'package:o_spawn_cup/shared/widgets/tile_image_pre.dart';
import 'package:o_spawn_cup/shared/widgets/widget_num_player_by_team.dart';

Color colorTheme = const Color(0xffFFD739);
Color colorBackgroundTheme = const Color(0xff191919);
Color colorTextTheme = const Color(0xff201607);
Color colorHintTextTheme = const Color(0xff707070);
Color colorOrange = const Color(0xffDE7137);
Color colorOpen = const Color(0xff28F202);
Color colorInProgress = const Color(0xff006FFF);
Color colorClose = const Color(0xffFF0000);

List<CardGame> listCardGame = [
  CardGame("assets/images/csgoBackground.png", GameName.CSGO),
  CardGame("assets/images/forniteBackground.png", GameName.Fornite),
  CardGame("assets/images/lolBackground.png", GameName.LeagueOfLegend),
  CardGame("assets/images/valorantBackground.png", GameName.Valorant),
];

List<TournamentType> listTournamentType = [
  TournamentType.solo,
  TournamentType.duo,
  TournamentType.trio,
  TournamentType.quatuor,
  TournamentType.quintet,
];


List<TileImagePre> listImagePre = [
  TileImagePre(
    image: "assets/images/forniteBackground.png",
    index: 0,
    gameName: GameName.Fornite,
  ),
  TileImagePre(
    image: "assets/images/forniteBackground.png",
    index: 1,
    gameName: GameName.Fornite,
  ),
  TileImagePre(
    image: "assets/images/forniteBackground.png",
    index: 2,
    gameName: GameName.Fornite,
  ),
  TileImagePre(
    image: "assets/images/forniteBackground.png",
    index: 3,
    gameName: GameName.Fornite,
  ),
  TileImagePre(
    image: "assets/images/forniteBackground.png",
    index: 4,
    gameName: GameName.Fornite,
  ),
  TileImagePre(
    image: "assets/images/forniteBackground.png",
    index: 5,
    gameName: GameName.Fornite,
  ),
  TileImagePre(
    image: "assets/images/csgoBackground.png",
    index: 6,
    gameName: GameName.CSGO,
  ),
  TileImagePre(
    image: "assets/images/csgoBackground.png",
    index: 7,
    gameName: GameName.CSGO,
  ),
  TileImagePre(
    image: "assets/images/csgoBackground.png",
    index: 8,
    gameName: GameName.CSGO,
  ),
  TileImagePre(
    image: "assets/images/csgoBackground.png",
    index: 9,
    gameName: GameName.CSGO,
  ),
  TileImagePre(
    image: "assets/images/csgoBackground.png",
    index: 10,
    gameName: GameName.CSGO,
  ),
  TileImagePre(
    image: "assets/images/csgoBackground.png",
    index: 11,
    gameName: GameName.CSGO,
  ),
  TileImagePre(
    image: "assets/images/lolBackground.png",
    index: 12,
    gameName: GameName.LeagueOfLegend,
  ),
  TileImagePre(
    image: "assets/images/lolBackground.png",
    index: 13,
    gameName: GameName.LeagueOfLegend,
  ),
  TileImagePre(
    image: "assets/images/lolBackground.png",
    index: 14,
    gameName: GameName.LeagueOfLegend,
  ),
  TileImagePre(
    image: "assets/images/lolBackground.png",
    index: 15,
    gameName: GameName.LeagueOfLegend,
  ),
  TileImagePre(
    image: "assets/images/lolBackground.png",
    index: 16,
    gameName: GameName.LeagueOfLegend,
  ),
  TileImagePre(
    image: "assets/images/lolBackground.png",
    index: 17,
    gameName: GameName.LeagueOfLegend,
  ),
  TileImagePre(
    image: "assets/images/valorantBackground.png",
    index: 18,
    gameName: GameName.Valorant,
  ),
  TileImagePre(
    image: "assets/images/valorantBackground.png",
    index: 19,
    gameName: GameName.Valorant,
  ),
  TileImagePre(
    image: "assets/images/valorantBackground.png",
    index: 20,
    gameName: GameName.Valorant,
  ),
  TileImagePre(
    image: "assets/images/valorantBackground.png",
    index: 21,
    gameName: GameName.Valorant,
  ),
  TileImagePre(
    image: "assets/images/valorantBackground.png",
    index: 22,
    gameName: GameName.Valorant,
  ),
  TileImagePre(
    image: "assets/images/valorantBackground.png",
    index: 23,
    gameName: GameName.Valorant,
  ),
];

List<DropdownMenuItem<TournamentType>>? listTournamentTypeDropdown = listTournamentType.map((value) {
  return DropdownMenuItem<TournamentType>(
    value: value,
    child: Text(value.name),
  );
}).toList();
List<DropdownMenuItem<TournamentState>>? listTournamentStateDropdown = TournamentState.values.map((value) {
  return DropdownMenuItem<TournamentState>(
    value: value,
    child: Text(value.name),
  );
}).toList();

List<DropdownMenuItem<ServerType>>? listServerTypeDropdown = ServerType.values.map((value) {
  return DropdownMenuItem<ServerType>(
    value: value,
    child: Text(value.name),
  );
}).toList();

List<DropdownMenuItem<GameName>>? listGameNameDropdown = GameName.values.map((value) {
  return DropdownMenuItem<GameName>(
    value: value,
    child: Text(value.state),
  );
}).toList();