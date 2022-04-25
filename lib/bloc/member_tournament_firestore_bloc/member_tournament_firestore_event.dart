part of 'member_tournament_firestore_bloc.dart';

abstract class MemberTournamentFirestoreEvent extends Equatable {
  const MemberTournamentFirestoreEvent();

  @override
  List<Object?> get props => [];
}

class MemberTournamentFirestoreAdd extends MemberTournamentFirestoreEvent {
  final String teamName;
  final String gamerTag;
  final RoleType roleType;
  const MemberTournamentFirestoreAdd({
    required this.teamName,
    required this.gamerTag,
    required this.roleType,
  });
  @override
  List<Object?> get props => [teamName, gamerTag, roleType];
}

class MemberTournamentFirestoreUpdate extends MemberTournamentFirestoreEvent {}
