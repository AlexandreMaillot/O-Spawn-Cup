import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:o_spawn_cup/app/bloc/app_bloc.dart';
import 'package:o_spawn_cup/models/Member/member.dart';
import 'package:o_spawn_cup/repository/member_repository.dart';
import 'package:o_spawn_cup/shared/drawer/cubit/drawer_cubit.dart';
import 'package:o_spawn_cup/shared/drawer/view/drawer_view.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final appBloc = context.read<AppBloc>();
    final memberRepository = MemberRepository(
      memberCollectionReference: MemberCollectionReference(),
    );

    return BlocProvider(
      create: (context) =>
          DrawerCubit(memberRepository: memberRepository, appBloc: appBloc),
      child: const DrawerView(),
    );
  }
}
