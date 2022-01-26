enum GameName {
  Fornite,
  Valorant,
  LeagueOfLegend,
  CSGO
}

extension GameNameExt on GameName {
  String get state {
    switch (this) {
      case GameName.Fornite:
        return "Fornite";
      case GameName.Valorant:
        return "Valorant";
      case GameName.LeagueOfLegend:
        return "League of legend";
      case GameName.CSGO:
        return "CSGO";
      default:
        return "";
    }
  }
}