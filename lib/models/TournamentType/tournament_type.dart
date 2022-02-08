
import "package:json_annotation/json_annotation.dart";

part "tournament_type.g.dart";
@JsonSerializable()
class TournamentType {
  String name;
  int capacityTeam;

  TournamentType({required this.name,required this.capacityTeam});
  factory TournamentType.fromJson(Map<String, dynamic> json) => _$TournamentTypeFromJson(json);
  Map<String, dynamic> toJson() => _$TournamentTypeToJson(this);
}