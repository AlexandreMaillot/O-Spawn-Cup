import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cloud_firestore_odm/cloud_firestore_odm.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:o_spawn_cup/models/MemberTournament/member_tournament.dart';
import 'package:o_spawn_cup/models/Round/round.dart';

part 'round_classement_member.g.dart';
@JsonSerializable()
class RoundClassementMember {
  Round round;
  MemberTournament memberTournament;
  int kill;
  int rang;
  String? screenshot;

  RoundClassementMember({required this.round,required this.memberTournament,required this.kill,required this.rang});
  factory RoundClassementMember.fromJson(Map<String, dynamic> json) => _$RoundClassementMemberFromJson(json);
}
@Collection<RoundClassementMember>('RoundClassementMember')
final roundClassementMembersRef = RoundClassementMemberCollectionReference();