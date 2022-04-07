part of 'show_stat_cubit.dart';

abstract class ShowStatState extends Equatable {
  ShowStatState();
}
class ShowStatInitial extends ShowStatState {
  bool globalStat = true;
  ShowStatInitial();

  @override
  List<Object?> get props => [];
}
class ShowStatChanged extends ShowStatState {
  bool globalStat = true;
  ShowStatChanged({required this.globalStat});
  @override
  List<Object?> get props => [globalStat];
}
class ShowStatTeamsLoaded extends ShowStatState {
  List<Team> listTeam = [];
  ShowStatTeamsLoaded({required this.listTeam});
  @override
  List<Object?> get props => [listTeam];
}
class ShowStatTournamentLoaded extends ShowStatState {
  Tournament tournament;
  ShowStatTournamentLoaded({required this.tournament});
  @override
  List<Object?> get props => [tournament];
}
class ShowStatRowSelected extends ShowStatState {
  int? rowSelect;
  ShowStatRowSelected({required this.rowSelect});
  @override
  List<Object?> get props => [rowSelect];
}

class ShowStatMemberTournamentLoaded extends ShowStatState {
  List<MemberTournament> listMemberTournament;
  ShowStatMemberTournamentLoaded({required this.listMemberTournament});
  @override
  List<Object?> get props => [listMemberTournament];
}
class ShowStatMemberTournamentDisqualified extends ShowStatState {
  List<MemberTournament> listMemberTournament = [];
  ShowStatMemberTournamentDisqualified({required this.listMemberTournament});
  @override
  List<Object?> get props => [listMemberTournament];
}
class ShowStatTeamDisqualified extends ShowStatState {
  List<Team> listTeam;
  ShowStatTeamDisqualified({required this.listTeam});
  @override
  List<Object?> get props => [listTeam];
}
