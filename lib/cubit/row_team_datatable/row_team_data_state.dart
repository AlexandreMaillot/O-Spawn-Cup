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
class RowTeamDataLoading extends RowTeamDataState {
  RowTeamDataLoading(int? indexSelect) : super(null);
}
class RowTeamDataSelected extends RowTeamDataState {


  RowTeamDataSelected(int? indexSelect) : super(indexSelect);
  @override
  List<int?> get props => [indexSelect];
}
class RowTeamDataDisqualified extends RowTeamDataState {
  RowTeamDataDisqualified(int? indexSelect) : super(indexSelect);
}
class RowTeamDataAddedMember extends RowTeamDataState {
  RowTeamDataAddedMember(int? indexSelect) : super(indexSelect);
}
