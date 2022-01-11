import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cloud_firestore_odm/cloud_firestore_odm.dart';
import 'package:json_annotation/json_annotation.dart';

import '../MemberTournament/member_tournament.dart';

part 'team.g.dart';
@JsonSerializable()
class Team {
  String name;
  List<MemberTournament> listMemberTournament = [];
  late String teamCode;
  bool isDisqualified = false;

  Team({required this.name});
  factory Team.fromJson(Map<String, dynamic> json) => _$TeamFromJson(json);
}
@Collection<Team>('Team')
final teamsRef = TeamCollectionReference();