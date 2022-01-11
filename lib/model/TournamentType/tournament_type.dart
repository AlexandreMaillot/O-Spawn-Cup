import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cloud_firestore_odm/annotation.dart';
import 'package:cloud_firestore_odm/cloud_firestore_odm.dart';
import 'package:json_annotation/json_annotation.dart';

part 'tournament_type.g.dart';
@JsonSerializable()
class TournamentType {
  String name;
  int capacityTeam;

  TournamentType({required this.name,required this.capacityTeam});
  factory TournamentType.fromJson(Map<String, dynamic> json) => _$TournamentTypeFromJson(json);
}
@Collection<TournamentType>('TournamentType')
final tournamentTypesRef = TournamentTypeCollectionReference();