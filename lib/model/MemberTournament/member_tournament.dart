import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cloud_firestore_odm/cloud_firestore_odm.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:o_spawn_cup/model/RoundClassementMember/round_classement_member.dart';
import 'package:o_spawn_cup/model/Team/team.dart';
import 'package:o_spawn_cup/model/Tournament/tournament.dart';

import 'package:o_spawn_cup/model/role_type.dart';

import '../Member/member.dart';
part 'member_tournament.g.dart';
@JsonSerializable()
class MemberTournament {
  Member member;
  Tournament tournament;
  String gamerTag;
  RoleType role;
  Team team;
  List<RoundClassementMember> listRoundClassementMember = [];

  MemberTournament({required this.member,required this.tournament,required this.gamerTag,required this.role,required this.team});
  factory MemberTournament.fromJson(Map<String, dynamic> json) => _$MemberTournamentFromJson(json);
  Map<String, dynamic> toJson() => _$MemberTournamentToJson(this);
  Map<String, dynamic> _$MemberTournamentToJson(MemberTournament instance) =>
      <String, dynamic>{
        'member': instance.member.toJson(),
        'tournament': instance.tournament.toJson(),
        'gamerTag': instance.gamerTag,
        'role': _$RoleTypeEnumMap[instance.role],
        'team': instance.team.toJson(),
        'listRoundClassementMember': instance.listRoundClassementMember,
      };
}
@Collection<MemberTournament>('MemberTournaments')
@Collection<Team>('MemberTournaments/*/Teams')
@Collection<Tournament>('MemberTournaments/*/Tournaments')
final memberTournamentsRef = MemberTournamentCollectionReference();
