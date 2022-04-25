part of 'row_member_leader_cubit.dart';

abstract class RowMemberLeaderState extends Equatable {
  final RoleType roleType;
  const RowMemberLeaderState({required this.roleType});
  @override
  List<RoleType> get props => [roleType];
}

class RowMemberLeaderInitial extends RowMemberLeaderState {
  const RowMemberLeaderInitial({required RoleType roleType})
      : super(roleType: roleType);
}
