part of 'row_team_data_cubit.dart';

abstract class RowTeamDataState extends Equatable {
  int? indexSelect;
  RowTeamDataState(this.indexSelect);
  @override
  List<int?> get props => [indexSelect];
}

class RowTeamDataInitial extends RowTeamDataState {
  RowTeamDataInitial(int? indexSelect) : super(null);
}
class RowTeamDataSelected extends RowTeamDataState {
  List<MemberTournament> listMemberTournament = [];
  List<Member?> listMember = [];

  RowTeamDataSelected(int? indexSelect,this.listMemberTournament,this.listMember) : super(indexSelect);
  @override
  List<int?> get props => [indexSelect];
}
