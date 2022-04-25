part of 'cup_detail_cubit.dart';

abstract class CupDetailState extends Equatable {
  const CupDetailState();
}

class CupDetailInitial extends CupDetailState {
  @override
  List<Object> get props => [];
}

class CupDetailTournamentChanged extends CupDetailState {
  final Tournament? tournament;
  final bool isClose;
  const CupDetailTournamentChanged({
    required this.tournament,
    required this.isClose,
  });
  @override
  List<Tournament?> get props => [tournament];
}

class CupDetailListTeamChanged extends CupDetailState {
  final List<Team> listTeam;
  const CupDetailListTeamChanged({required this.listTeam});
  @override
  List<Object> get props => [listTeam];
}

class CupDetailMemberChanged extends CupDetailState {
  final Member member;
  const CupDetailMemberChanged({required this.member});
  @override
  List<Object> get props => [member];
}

class CupDetailMemberTournamentAdded extends CupDetailState {
  const CupDetailMemberTournamentAdded();
  @override
  List<Object> get props => [];
}

class CupDetailListMemberTournamentChanged extends CupDetailState {
  final List<MemberTournament> listMemberTournament;
  const CupDetailListMemberTournamentChanged({
    required this.listMemberTournament,
  });
  @override
  List<Object> get props => [listMemberTournament];
}

class CupDetailErrorMemberTournamentAdded extends CupDetailState {
  final String errorMsg;
  const CupDetailErrorMemberTournamentAdded({required this.errorMsg});
  @override
  List<Object> get props => [errorMsg];
}
