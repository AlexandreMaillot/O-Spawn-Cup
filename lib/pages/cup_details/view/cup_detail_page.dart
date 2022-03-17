import "package:flutter/material.dart";
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:o_spawn_cup/bloc/member_tournament_firestore_bloc/member_tournament_firestore_bloc.dart';
import 'package:o_spawn_cup/bloc/sign_cup_bloc/sign_cup_bloc.dart';
import 'package:o_spawn_cup/cubit/header_sign_cup_cubit.dart';
import 'package:o_spawn_cup/cubit/member_bloc/member_cubit.dart';
import 'package:o_spawn_cup/cubit/round_stat_cubit.dart';
import 'package:o_spawn_cup/cubit/row_member_leader/row_member_leader_cubit.dart';
import 'package:o_spawn_cup/cubit/show_stat_cubit.dart';
import 'package:o_spawn_cup/cubit/team_firestore/team_firestore_cubit.dart';

import "package:o_spawn_cup/models/Tournament/tournament.dart";
import 'package:o_spawn_cup/pages/cup_details/view/cup_detial_view.dart';


class CupDetailPage extends StatelessWidget {
  Tournament tournament;
  CupDetailPage({Key? key, required this.tournament}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) => MemberTournamentFirestoreBloc(tournament: tournament),
        ),
        BlocProvider(
          create: (_) => RowMemberLeaderCubit(),
        ),
        BlocProvider(
          create: (_) => TeamFirestoreCubit(),
        ),

        BlocProvider(
          create: (_) => SignCupBloc(),
        ),
        BlocProvider(
          create: (_) => ShowStatCubit(),
        ),
        BlocProvider(
          create: (_) => RoundStatCubit(roundMax: tournament.roundNumber),
        ),
        BlocProvider(
          create: (_) => MemberCubit(),
        ),
        BlocProvider(
          create: (_) => HeaderSignCupCubit(),
        ),
      ],
      child: CupDetailView(
        tournament: tournament,
      ),
    );
  }
}
