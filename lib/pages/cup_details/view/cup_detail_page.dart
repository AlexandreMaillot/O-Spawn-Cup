import 'package:authentication_repository/authentication_repository.dart';
import "package:flutter/material.dart";
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:o_spawn_cup/app/app.dart';

import 'package:o_spawn_cup/bloc/member_tournament_firestore_bloc/member_tournament_firestore_bloc.dart';
import 'package:o_spawn_cup/bloc/sign_cup_bloc/sign_cup_bloc.dart';
import 'package:o_spawn_cup/cubit/header_sign_cup_cubit.dart';
import 'package:o_spawn_cup/cubit/member_bloc/member_cubit.dart';
import 'package:o_spawn_cup/cubit/round_stat_cubit.dart';
import 'package:o_spawn_cup/cubit/row_member_leader/row_member_leader_cubit.dart';
import 'package:o_spawn_cup/cubit/show_stat_cubit.dart';
import 'package:o_spawn_cup/cubit/team_firestore/team_firestore_cubit.dart';
import 'package:o_spawn_cup/models/Member/member.dart' as m;

import "package:o_spawn_cup/models/Tournament/tournament.dart";
import 'package:o_spawn_cup/pages/cup_details/bloc/sign_tournament_form_bloc.dart';
import 'package:o_spawn_cup/pages/cup_details/cubit/cup_detail_cubit.dart';
import 'package:o_spawn_cup/pages/cup_details/view/cup_detail_view.dart';
import 'package:o_spawn_cup/repository/member_repository.dart';
import 'package:o_spawn_cup/repository/member_tounament_repository.dart';
import 'package:o_spawn_cup/repository/team_repository.dart';
import 'package:o_spawn_cup/repository/tournament_repository.dart';


class CupDetailPage extends StatelessWidget {
  Tournament tournament;
  CupDetailPage({Key? key, required this.tournament}) : super(key: key);
  Route route() {
    return MaterialPageRoute<void>(builder: (_) => CupDetailPage(tournament: tournament,));
  }
  Page page() => MaterialPage<void>(child: CupDetailPage(tournament: tournament,));
  @override
  Widget build(BuildContext context) {
    var cupDetailCubit = CupDetailCubit(tournamentRepository: TournamentRepository(tournamentCollectionReference: TournamentCollectionReference()),teamRepository: TeamRepository(teamCollectionReference: TeamCollectionReference(tournamentsRef.doc(tournament.documentId).reference)),appBloc: context.read<AppBloc>(),memberRepository: MemberRepository(memberCollectionReference: m.MemberCollectionReference()));
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
        BlocProvider(
          create: (_) => cupDetailCubit,
        ),
        BlocProvider(
          create: (_) => SignTournamentFormBloc(cupDetailCubit: cupDetailCubit),
        ),
      ],
      child: CupDetailView(
        tournament: tournament,
      ),
    );
  }
}
