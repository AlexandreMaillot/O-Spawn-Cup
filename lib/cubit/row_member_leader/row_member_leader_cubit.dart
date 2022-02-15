import "package:bloc/bloc.dart";
import "package:equatable/equatable.dart";
import 'package:o_spawn_cup/models/role_type.dart';

part "row_member_leader_state.dart";

class RowMemberLeaderCubit extends Cubit<RowMemberLeaderState> {
  RowMemberLeaderCubit() : super(RowMemberLeaderInitial(roleType: RoleType.leader));

  changedRoleType(RoleType roleType){
    emit(RowMemberLeaderInitial(roleType: roleType));
  }
}
