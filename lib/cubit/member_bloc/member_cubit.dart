import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:o_spawn_cup/models/Member/member.dart';
import 'package:o_spawn_cup/services/authentification.dart';

part 'member_state.dart';

class MemberCubit extends Cubit<MemberState> {
  late StreamSubscription authController;
  MemberCubit() : super(const MemberInitial()) {
    authController = _authentification.selectMemberConnected().listen((event) {
      emit(MemberInitial(member: event.data));
    });
  }

  final Authentification _authentification = Authentification();

  void dispose() {
    authController.cancel();
  }
}
