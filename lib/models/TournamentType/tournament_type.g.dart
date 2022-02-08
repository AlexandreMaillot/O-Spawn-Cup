// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tournament_type.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TournamentType _$TournamentTypeFromJson(Map<String, dynamic> json) =>
    TournamentType(
      name: json['name'] as String,
      capacityTeam: json['capacityTeam'] as int,
    );

Map<String, dynamic> _$TournamentTypeToJson(TournamentType instance) =>
    <String, dynamic>{
      'name': instance.name,
      'capacityTeam': instance.capacityTeam,
    };
