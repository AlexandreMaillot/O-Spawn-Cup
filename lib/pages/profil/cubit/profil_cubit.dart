import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:o_spawn_cup/app/bloc/app_bloc.dart';
import 'package:o_spawn_cup/models/Member/member.dart';
import 'package:o_spawn_cup/repository/member_repository.dart';

part 'profil_state.dart';

class ProfilCubit extends Cubit<ProfilState> {
  AppBloc appBloc;
  MemberRepository memberRepository;
  late Member? member;
  ProfilCubit({required this.memberRepository, required this.appBloc})
      : super(ProfilInitial()) {
    memberRepository.currentMember(appBloc.state.user!.id).listen((member) {
      if (member != null) {
        this.member = member;
        emit(ProfilMemberChanged(member: member));
      }
    });
  }
}
