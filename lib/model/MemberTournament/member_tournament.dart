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
  late Team team;
  List<RoundClassementMember> listRoundClassementMember = [];

  MemberTournament({required this.member,required this.tournament,required this.gamerTag,required this.role});
  factory MemberTournament.fromJson(Map<String, dynamic> json) => _$MemberTournamentFromJson(json);


}
@Collection<MemberTournament>('MemberTournament')
final memberTournamentsRef = MemberTournamentCollectionReference();
