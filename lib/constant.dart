import 'package:flutter/material.dart';
import 'package:o_spawn_cup/models/Tournament/tournament_state.dart';
import 'package:o_spawn_cup/models/TournamentType/tournament_type.dart';
import 'package:o_spawn_cup/models/card_game.dart';
import 'package:o_spawn_cup/models/game_name.dart';
import 'package:o_spawn_cup/models/server_type.dart';
import 'package:o_spawn_cup/pages/form_tournament/widgets/tile_image_pre.dart';

const Color colorTheme = Color(0xffFFD739);
const Color colorBackgroundTheme = Color(0xff191919);
const Color colorTextTheme = Color(0xff201607);
const Color colorHintTextTheme = Color(0xff707070);
const Color colorOrange = Color(0xffDE7137);
const Color colorOpen = Color(0xff28F202);
const Color colorInProgress = Color(0xff006FFF);
const Color colorClose = Color(0xffFF0000);

final List<CardGame> listCardGame = [
  CardGame('assets/images/csgoBackground.png', GameName.csgo),
  CardGame('assets/images/forniteBackground.png', GameName.fornite),
  CardGame('assets/images/lolBackground.png', GameName.leagueOfLegend),
  CardGame('assets/images/valorantBackground.png', GameName.valorant),
];

const List<TournamentType> listTournamentType = [
  TournamentType.solo,
  TournamentType.duo,
  TournamentType.trio,
  TournamentType.quatuor,
  TournamentType.quintet,
];

final List<TileImagePre> listImagePre = [
  const TileImagePre(
    image: 'assets/images/forniteBackground.png',
    index: 0,
    gameName: GameName.fornite,
  ),
  const TileImagePre(
    image: 'assets/images/forniteBackground.png',
    index: 1,
    gameName: GameName.fornite,
  ),
  const TileImagePre(
    image: 'assets/images/forniteBackground.png',
    index: 2,
    gameName: GameName.fornite,
  ),
  const TileImagePre(
    image: 'assets/images/forniteBackground.png',
    index: 3,
    gameName: GameName.fornite,
  ),
  const TileImagePre(
    image: 'assets/images/forniteBackground.png',
    index: 4,
    gameName: GameName.fornite,
  ),
  const TileImagePre(
    image: 'assets/images/forniteBackground.png',
    index: 5,
    gameName: GameName.fornite,
  ),
  const TileImagePre(
    image: 'assets/images/csgoBackground.png',
    index: 6,
    gameName: GameName.csgo,
  ),
  const TileImagePre(
    image: 'assets/images/csgoBackground.png',
    index: 7,
    gameName: GameName.csgo,
  ),
  const TileImagePre(
    image: 'assets/images/csgoBackground.png',
    index: 8,
    gameName: GameName.csgo,
  ),
  const TileImagePre(
    image: 'assets/images/csgoBackground.png',
    index: 9,
    gameName: GameName.csgo,
  ),
  const TileImagePre(
    image: 'assets/images/csgoBackground.png',
    index: 10,
    gameName: GameName.csgo,
  ),
  const TileImagePre(
    image: 'assets/images/csgoBackground.png',
    index: 11,
    gameName: GameName.csgo,
  ),
  const TileImagePre(
    image: 'assets/images/lolBackground.png',
    index: 12,
    gameName: GameName.leagueOfLegend,
  ),
  const TileImagePre(
    image: 'assets/images/lolBackground.png',
    index: 13,
    gameName: GameName.leagueOfLegend,
  ),
  const TileImagePre(
    image: 'assets/images/lolBackground.png',
    index: 14,
    gameName: GameName.leagueOfLegend,
  ),
  const TileImagePre(
    image: 'assets/images/lolBackground.png',
    index: 15,
    gameName: GameName.leagueOfLegend,
  ),
  const TileImagePre(
    image: 'assets/images/lolBackground.png',
    index: 16,
    gameName: GameName.leagueOfLegend,
  ),
  const TileImagePre(
    image: 'assets/images/lolBackground.png',
    index: 17,
    gameName: GameName.leagueOfLegend,
  ),
  const TileImagePre(
    image: 'assets/images/valorantBackground.png',
    index: 18,
    gameName: GameName.valorant,
  ),
  const TileImagePre(
    image: 'assets/images/valorantBackground.png',
    index: 19,
    gameName: GameName.valorant,
  ),
  const TileImagePre(
    image: 'assets/images/valorantBackground.png',
    index: 20,
    gameName: GameName.valorant,
  ),
  const TileImagePre(
    image: 'assets/images/valorantBackground.png',
    index: 21,
    gameName: GameName.valorant,
  ),
  const TileImagePre(
    image: 'assets/images/valorantBackground.png',
    index: 22,
    gameName: GameName.valorant,
  ),
  const TileImagePre(
    image: 'assets/images/valorantBackground.png',
    index: 23,
    gameName: GameName.valorant,
  ),
];

final List<DropdownMenuItem<TournamentType>> listTournamentTypeDropdown =
    listTournamentType.map((value) {
  return DropdownMenuItem<TournamentType>(
    value: value,
    child: Text(value.name),
  );
}).toList();
final List<DropdownMenuItem<TournamentState>> listTournamentStateDropdown =
    TournamentState.values.map((value) {
  return DropdownMenuItem<TournamentState>(
    value: value,
    child: Text(value.name),
  );
}).toList();

final List<DropdownMenuItem<ServerType>> listServerTypeDropdown =
    ServerType.values.map((value) {
  return DropdownMenuItem<ServerType>(
    value: value,
    child: Text(value.name),
  );
}).toList();

final List<DropdownMenuItem<GameName>> listGameNameDropdown =
    GameName.values.map((value) {
  return DropdownMenuItem<GameName>(
    value: value,
    child: Text(value.state),
  );
}).toList();
