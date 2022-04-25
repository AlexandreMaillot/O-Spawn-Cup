// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'team.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Team _$TeamFromJson(Map<String, dynamic> json) => Team(
      name: json['name'] as String,
      teamCode: json['teamCode'] as String?,
      isDisqualified: json['isDisqualified'] as bool? ?? false,
    );

Map<String, dynamic> _$TeamToJson(Team instance) => <String, dynamic>{
      'name': instance.name,
      'teamCode': instance.teamCode,
      'isDisqualified': instance.isDisqualified,
    };
