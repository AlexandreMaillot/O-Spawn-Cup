part of 'row_member_leader_cubit.dart';

abstract class RowMemberLeaderState extends Equatable {
  RoleType roleType;
  RowMemberLeaderState({required this.roleType});
  @override
  List<RoleType> get props => [roleType];
}

class RowMemberLeaderInitial extends RowMemberLeaderState {
  RowMemberLeaderInitial({required RoleType roleType}) : super(roleType: roleType);
}
