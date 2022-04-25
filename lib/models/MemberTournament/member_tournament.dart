import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:o_spawn_cup/models/Member/member.dart';
import 'package:o_spawn_cup/models/role_type.dart';

part 'member_tournament.g.dart';

@JsonSerializable(explicitToJson: true)
class MemberTournament extends Equatable {
  @JsonKey(ignore: true)
  final String? documentId;
  final String gamerTag;
  final RoleType role;
  final Member member;

  const MemberTournament({
    this.documentId,
    required this.gamerTag,
    required this.role,
    required this.member,
  });

  MemberTournament copyWith({
    String? documentId,
    String? gamerTag,
    RoleType? role,
    Member? member,
  }) {
    return MemberTournament(
      gamerTag: gamerTag ?? this.gamerTag,
      member: member ?? this.member,
      role: role ?? this.role,
      documentId: documentId ?? this.documentId,
    );
  }

  factory MemberTournament.fromJson(Map<String, dynamic> json) =>
      _$MemberTournamentFromJson(json);
  Map<String, dynamic> toJson() => _$MemberTournamentToJson(this);

  @override
  List<Object?> get props => [documentId, gamerTag, role, member];
}
