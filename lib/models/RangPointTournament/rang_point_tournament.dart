
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cloud_firestore_odm/cloud_firestore_odm.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:o_spawn_cup/models/Tournament/tournament.dart';
part 'rang_point_tournament.g.dart';
@JsonSerializable()
class RangPointTournament {
  int rang;
  int point;
  Tournament tournament;

  RangPointTournament({required this.rang,required this.point,required this.tournament});
  factory RangPointTournament.fromJson(Map<String, dynamic> json) => _$RangPointTournamentFromJson(json);

}
@Collection<RangPointTournament>('RangPointTournament')
final rangPointTournamentsRef = RangPointTournamentCollectionReference();