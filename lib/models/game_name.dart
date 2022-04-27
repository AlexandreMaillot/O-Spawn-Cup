enum GameName {
  fornite,
  valorant,
  leagueOfLegend,
  csgo,
}

extension GameNameExt on GameName {
  String get state {
    switch (this) {
      case GameName.fornite:
        return 'Fornite';
      case GameName.valorant:
        return 'Valorant';
      case GameName.leagueOfLegend:
        return 'LeagueOfLegend';
      case GameName.csgo:
        return 'CSGO';
    }
  }
}
