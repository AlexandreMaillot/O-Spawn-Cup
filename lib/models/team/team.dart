import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:o_spawn_cup/models/MemberTournament/member_tournament.dart';

part 'team.g.dart';

@JsonSerializable()
class Team extends Equatable {
  @JsonKey(ignore: true)
  final String? documentId;
  @JsonKey(ignore: true)
  final List<MemberTournament> listMemberTournament;
  final String name;
  final String? teamCode;
  final bool isDisqualified;

  const Team({
    required this.name,
    this.listMemberTournament = const <MemberTournament>[],
    this.documentId,
    this.teamCode,
    this.isDisqualified = false,
  });

  Team copyWith({
    String? documentId,
    List<MemberTournament>? listMemberTournament,
    String? name,
    String? teamCode,
    bool? isDisqualified,
  }) {
    return Team(
      name: name ?? this.name,
      documentId: documentId ?? this.documentId,
      listMemberTournament: listMemberTournament ?? this.listMemberTournament,
      isDisqualified: isDisqualified ?? this.isDisqualified,
      teamCode: teamCode ?? this.teamCode,
    );
  }

  factory Team.fromJson(Map<String, dynamic> json) => _$TeamFromJson(json);
  Map<String, dynamic> toJson() => _$TeamToJson(this);

  @override
  List<Object?> get props => [documentId, name, teamCode, isDisqualified];
}
