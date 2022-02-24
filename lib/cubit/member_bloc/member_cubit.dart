import "dart:async";

import "package:bloc/bloc.dart";
import "package:equatable/equatable.dart";
import "package:o_spawn_cup/service/authentification.dart";

import "../../models/Member/member.dart";

part "member_state.dart";

class MemberCubit extends Cubit<MemberState> {
  late StreamSubscription authController;
  MemberCubit() : super(MemberInitial()) {
    authController  = _authentification.selectMemberConnected().listen((event) { emit(MemberInitial(member: event.data));});
  }

  final Authentification _authentification = Authentification();


}
