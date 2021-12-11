class TournamentType {
  String name;
  int capacityTeam;

  TournamentType({required this.name,required this.capacityTeam});

  TournamentType.fromJson(Map<String, Object?> json) : this(
    name: json["name"]! as String,
    capacityTeam: json["capacityTeam"]! as int,
  );


  Map<String, Object?> toJson() {
    return {
      "name": name,
      "capacityTeam": capacityTeam,
    };
  }
}
