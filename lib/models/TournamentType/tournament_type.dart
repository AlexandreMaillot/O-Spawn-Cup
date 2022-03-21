
import 'package:equatable/equatable.dart';
import "package:json_annotation/json_annotation.dart";

part "tournament_type.g.dart";
@JsonSerializable()
class TournamentType extends Equatable {
  final String name;
  final int capacityTeam;

  const TournamentType({required this.name,required this.capacityTeam});
  factory TournamentType.fromJson(Map<String, dynamic> json) => _$TournamentTypeFromJson(json);
  Map<String, dynamic> toJson() => _$TournamentTypeToJson(this);

  static const solo = TournamentType(capacityTeam: 1,name: "Solo");
  static const duo = TournamentType(capacityTeam: 2,name: "Duo");
  static const trio = TournamentType(capacityTeam: 3,name: "Trio");
  static const quatuor = TournamentType(capacityTeam: 4,name: "Quatuor");
  static const quintet = TournamentType(capacityTeam: 5,name: "Quintet");

  @override
  List<Object?> get props => [name,capacityTeam];
}