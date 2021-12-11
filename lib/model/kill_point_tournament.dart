class KillPointTournament {
  int pointPerKill;


  KillPointTournament({required this.pointPerKill});

  KillPointTournament.fromJson(Map<String, Object?> json) : this(
    pointPerKill: json["gameName"]! as int,
  );


  Map<String, Object?> toJson() {
    return {
      "pointPerKill": pointPerKill,
    };
  }

  calculKillPoint(int kill) {

  }
  updateKillPointTournament() {

  }
}