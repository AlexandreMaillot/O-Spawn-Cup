import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:o_spawn_cup/app/app.dart';
import 'package:o_spawn_cup/pages/profil/cubit/profil_cubit.dart';
import 'package:o_spawn_cup/pages/profil/view/profil_view.dart';
import 'package:o_spawn_cup/repository/member_repository.dart';

class Profil extends StatelessWidget {
  static Page page() => const MaterialPage<void>(child: Profil());

  const Profil({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final appBloc = context.read<AppBloc>();
    final memberRepository = context.read<MemberRepository>();

    return BlocProvider(
      create: (context) =>
          ProfilCubit(memberRepository: memberRepository, appBloc: appBloc),
      child: const ProfilView(),
    );
  }
}
