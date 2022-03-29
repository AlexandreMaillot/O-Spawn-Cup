part of 'cup_detail_cubit.dart';

abstract class CupDetailState extends Equatable {
  const CupDetailState();
}

class CupDetailInitial extends CupDetailState {
  @override
  List<Object> get props => [];
}
class CupDetailTournamentChanged extends CupDetailState {
  Tournament? tournament;
  bool isClose;
  CupDetailTournamentChanged({required this.tournament,required this.isClose});
  @override
  List<Tournament?> get props => [tournament];
}
class CupDetailListTeamChanged extends CupDetailState {
  List<Team> listTeam;
  CupDetailListTeamChanged({required this.listTeam});
  @override
  List<Object> get props => [listTeam];
}
class CupDetailMemberTournamentAdded extends CupDetailState {
  CupDetailMemberTournamentAdded();
  @override
  List<Object> get props => [];
}
