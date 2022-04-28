import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:o_spawn_cup/app/bloc/app_bloc.dart';
import 'package:o_spawn_cup/models/Member/member.dart';
import 'package:o_spawn_cup/repository/member_repository.dart';

part 'drawer_state.dart';

class DrawerCubit extends Cubit<DrawerState> {
  MemberRepository memberRepository;
  AppBloc appBloc;
  late Member member;
  late final StreamSubscription<Member?> _memberSubscription;
  DrawerCubit({required this.memberRepository, required this.appBloc})
      : super(DrawerInitial()) {
    _memberSubscription =
        memberRepository.currentMember(appBloc.state.user!.id).listen((event) {
      if (event != null) {
        member = event;
        emit(DrawerMemberChanged(member: member));
      }
    });
  }
  @override
  Future<void> close() {
    _memberSubscription.cancel();

    return super.close();
  }
}
