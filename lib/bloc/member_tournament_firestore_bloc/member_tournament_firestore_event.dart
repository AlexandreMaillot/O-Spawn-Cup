part of 'member_tournament_firestore_bloc.dart';

abstract class MemberTournamentFirestoreEvent extends Equatable {
  const MemberTournamentFirestoreEvent();

  @override
  List<Object?> get props => [];
}
class MemberTournamentFirestoreAdd extends MemberTournamentFirestoreEvent{

  String teamName;
  String gamerTag;
  RoleType roleType;
  MemberTournamentFirestoreAdd({required this.teamName,required this.gamerTag,required RoleType this.roleType});
  List<Object?> get props => [teamName,gamerTag,roleType];
}

class MemberTournamentFirestoreUpdate extends MemberTournamentFirestoreEvent{}