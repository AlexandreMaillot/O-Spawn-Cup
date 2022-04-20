import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:o_spawn_cup/app/app.dart';

import 'package:o_spawn_cup/bloc/member_tournament_firestore_bloc/member_tournament_firestore_bloc.dart';
import 'package:o_spawn_cup/cubit/member_bloc/member_cubit.dart';
import 'package:o_spawn_cup/pages/cup_details/cubit/round_stat/round_stat_cubit.dart';
import 'package:o_spawn_cup/cubit/row_member_leader/row_member_leader_cubit.dart';
import 'package:o_spawn_cup/models/Member/member.dart' as m;

import 'package:o_spawn_cup/models/Tournament/tournament.dart';
import 'package:o_spawn_cup/pages/cup_details/bloc/sign_tournament_form_bloc.dart';
import 'package:o_spawn_cup/pages/cup_details/cubit/cup_detail_cubit.dart';
import 'package:o_spawn_cup/pages/cup_details/cubit/show_stat_cubit.dart';
import 'package:o_spawn_cup/pages/cup_details/view/cup_detail_view.dart';
import 'package:o_spawn_cup/repository/member_repository.dart';
import 'package:o_spawn_cup/repository/team_repository.dart';
import 'package:o_spawn_cup/repository/tournament_repository.dart';
import 'package:o_spawn_cup/services/email_broker.dart';
import 'package:o_spawn_cup/services/email_message.dart';
import 'package:o_spawn_cup/services/smtp_broker.dart';


class CupDetailPage extends StatelessWidget {
  Tournament tournament;
  CupDetailPage({Key? key, required this.tournament}) : super(key: key);
  Route route() {
    return MaterialPageRoute<void>(builder: (_) => CupDetailPage(tournament: tournament,));
  }
  Page page() => MaterialPage<void>(child: CupDetailPage(tournament: tournament,));
  @override
  Widget build(BuildContext context) {
    var tournamentRepository = TournamentRepository(tournamentCollectionReference: TournamentCollectionReference());
    var teamRepository = TeamRepository(teamCollectionReference: TeamCollectionReference(tournamentsRef.doc(tournament.documentId).reference));
    var cupDetailCubit = CupDetailCubit(tournamentRepository: tournamentRepository,
        teamRepository: teamRepository,
        appBloc: context.read<AppBloc>(),
        memberRepository: MemberRepository(memberCollectionReference: m.MemberCollectionReference()),
        emailMessage: EmailMessage(EmailBroker(smtpServer: SmtpBroker.ospawn)),
    );
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) => MemberTournamentFirestoreBloc(tournament: tournament),
        ),
        BlocProvider(
          create: (_) => RowMemberLeaderCubit(),
        ),
        BlocProvider(
          create: (_) => ShowStatCubit(tournament: tournament,tournamentRepository: tournamentRepository,teamRepository: teamRepository),
        ),
        BlocProvider(
          create: (_) => RoundStatCubit(roundMax: tournament.roundNumber),
        ),
        BlocProvider(
          create: (_) => MemberCubit(),
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
