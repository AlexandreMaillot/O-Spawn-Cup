part of 'member_tournament_firestore_bloc.dart';

abstract class MemberTournamentFirestoreState extends Equatable {
  const MemberTournamentFirestoreState();
  @override
  List<Object> get props => [];
}

class MemberTournamentFirestoreInitial extends MemberTournamentFirestoreState {}

class MemberTournamentFirestoreAdding extends MemberTournamentFirestoreState {}

class MemberTournamentFirestoreAdded extends MemberTournamentFirestoreState {}

class MemberTournamentFirestoreError extends MemberTournamentFirestoreState {
  final String msg;
  const MemberTournamentFirestoreError({required this.msg});
}

class MemberTournamentFirestoreUpdating extends MemberTournamentFirestoreState {
}

class MemberTournamentFirestoreUpdated extends MemberTournamentFirestoreState {}
