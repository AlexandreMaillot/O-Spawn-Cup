part of 'show_stat_cubit.dart';

abstract class ShowStatState extends Equatable {
  const ShowStatState();
}

class ShowStatInitial extends ShowStatState {
  final bool globalStat = true;

  @override
  List<Object?> get props => [globalStat];
}

class ShowStatChanged extends ShowStatState {
  final bool globalStat;
  const ShowStatChanged({required this.globalStat});
  @override
  List<Object?> get props => [globalStat];
}

class ShowStatTeamsLoaded extends ShowStatState {
  final List<Team> listTeam;
  const ShowStatTeamsLoaded({required this.listTeam});
  @override
  List<Object?> get props => [listTeam];
}

class ShowStatTournamentLoaded extends ShowStatState {
  final Tournament tournament;
  const ShowStatTournamentLoaded({required this.tournament});
  @override
  List<Object?> get props => [tournament];
}

class ShowStatRowSelected extends ShowStatState {
  final int? rowSelect;
  const ShowStatRowSelected({required this.rowSelect});
  @override
  List<Object?> get props => [rowSelect];
}

class ShowStatMemberTournamentLoaded extends ShowStatState {
  final List<MemberTournament> listMemberTournament;
  const ShowStatMemberTournamentLoaded({required this.listMemberTournament});
  @override
  List<Object?> get props => [listMemberTournament];
}

class ShowStatMemberTournamentDisqualified extends ShowStatState {
  final List<MemberTournament> listMemberTournament;
  const ShowStatMemberTournamentDisqualified({
    required this.listMemberTournament,
  });
  @override
  List<Object?> get props => [listMemberTournament];
}

class ShowStatTeamDisqualified extends ShowStatState {
  final List<Team> listTeam;
  const ShowStatTeamDisqualified({required this.listTeam});
  @override
  List<Object?> get props => [listTeam];
}
