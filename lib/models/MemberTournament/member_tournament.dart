import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cloud_firestore_odm/cloud_firestore_odm.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:o_spawn_cup/models/RoundClassementMember/round_classement_member.dart';
import 'package:o_spawn_cup/models/Team/team.dart';
import 'package:o_spawn_cup/models/Tournament/tournament.dart';

import 'package:o_spawn_cup/models/role_type.dart';

import '../Member/member.dart';
part 'member_tournament.g.dart';
@JsonSerializable(explicitToJson: true)
class MemberTournament {
  @JsonKey(ignore: true)
  String? documentId;
  String gamerTag;
  RoleType role;

  MemberTournament({required this.gamerTag,required this.role});
  factory MemberTournament.fromJson(Map<String, dynamic> json) => _$MemberTournamentFromJson(json);
  Map<String, dynamic> toJson() => _$MemberTournamentToJson(this);

}
@Collection<MemberTournament>('MemberTournaments')
@Collection<Member>('MemberTournaments/*/members')
final memberTournamentsRef = MemberTournamentCollectionReference();
