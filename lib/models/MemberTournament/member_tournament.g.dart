// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'member_tournament.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MemberTournament _$MemberTournamentFromJson(Map<String, dynamic> json) =>
    MemberTournament(
      gamerTag: json['gamerTag'] as String,
      role: $enumDecode(_$RoleTypeEnumMap, json['role']),
      member: Member.fromJson(json['member'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$MemberTournamentToJson(MemberTournament instance) =>
    <String, dynamic>{
      'gamerTag': instance.gamerTag,
      'role': _$RoleTypeEnumMap[instance.role],
      'member': instance.member.toJson(),
    };

const _$RoleTypeEnumMap = {
  RoleType.leader: 'leader',
  RoleType.player: 'player',
};
