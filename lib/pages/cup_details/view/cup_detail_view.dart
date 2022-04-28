import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_form_bloc/flutter_form_bloc.dart';
import 'package:o_spawn_cup/bloc/member_tournament_firestore_bloc/member_tournament_firestore_bloc.dart';
import 'package:o_spawn_cup/constant.dart';
import 'package:o_spawn_cup/cubit/row_member_leader/row_member_leader_cubit.dart';
import 'package:o_spawn_cup/models/role_type.dart';
import 'package:o_spawn_cup/models/tournament/tournament.dart';
import 'package:o_spawn_cup/models/tournament/tournament_state.dart';
import 'package:o_spawn_cup/pages/cup_details/cubit/cup_detail_cubit.dart';
import 'package:o_spawn_cup/pages/cup_details/cup_details.dart';
import 'package:o_spawn_cup/pages/cup_details/widgets/container_header.dart';
import 'package:o_spawn_cup/services/utils.dart';
import 'package:o_spawn_cup/shared/drawer/view/custom_drawer.dart';
import 'package:o_spawn_cup/shared/widgets/custom_app_bar.dart';

class CupDetailView extends StatelessWidget {
  final Tournament tournament;

  const CupDetailView({Key? key, required this.tournament}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final cupDetailCubit = context.read<CupDetailCubit>();

    return Scaffold(
      backgroundColor: colorBackgroundTheme,
      endDrawer: const CustomDrawer(),
      appBar: const CustomAppBar(
        title: 'INSCRIPTION',
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const ContainerHeader(),
            Container(
              padding: const EdgeInsets.only(
                top: 25,
                right: 15,
                left: 15,
                bottom: 15,
              ),
              child: Column(
                children: [
                  RowInformationTournament(
                    leftText: 'Date inscription:',
                    rightText:
                        Utils.formatDate(tournament.dateDebutInscription),
                  ),
                  RowInformationTournament(
                    leftText: 'Date du tournois:',
                    rightText: Utils.formatDate(tournament.dateDebutTournois),
                  ),
                  RowInformationTournament(
                    leftText: 'Nombre de games:',
                    rightText: tournament.roundNumber.toString(),
                  ),
                  RowInformationTournament(
                    leftText: 'Type de tournois:',
                    rightText: tournament.tournamentType.name,
                  ),
                  BlocBuilder<CupDetailCubit, CupDetailState>(
                    buildWhen: (previous, current) =>
                        current is CupDetailTournamentChanged,
                    builder: (context, state) {
                      if (state.runtimeType == CupDetailTournamentChanged &&
                          (state as CupDetailTournamentChanged).isClose) {
                        return RowInformationTournament(
                          leftText: 'Etat:',
                          rightText: state.tournament!.state.state,
                        );
                      }

                      return Container();
                    },
                  ),
                  BlocBuilder<CupDetailCubit, CupDetailState>(
                    buildWhen: (previous, current) =>
                        current is CupDetailListTeamChanged ||
                        current is CupDetailTournamentChanged,
                    builder: (context, state) {
                      if (cupDetailCubit.tournament != null) {
                        return RowInformationTournament(
                          leftText: 'Place restantes:',
                          rightText: (state.runtimeType ==
                                      CupDetailListTeamChanged ||
                                  state.runtimeType ==
                                      CupDetailTournamentChanged)
                              ? '${cupDetailCubit.tournament!.capacity - cupDetailCubit.listTeam.length}/${cupDetailCubit.tournament!.capacity}'
                              : '0/0',
                        );
                      }

                      return const CircularProgressIndicator();
                    },
                  ),
                  BlocBuilder<CupDetailCubit, CupDetailState>(
                    buildWhen: (previous, current) =>
                        current is CupDetailListTeamChanged ||
                        current is CupDetailTournamentChanged,
                    builder: (context, state) {
                      if (cupDetailCubit.tournament != null) {
                        if (state is CupDetailListTeamChanged ||
                            state is CupDetailTournamentChanged) {
                          final statePlaces = cupDetailCubit.placesRestante(
                            cupDetailCubit.tournament!,
                            cupDetailCubit.listTeam,
                          );

                          return statePlaces == statePlacesRestante.isNotFull &&
                                  cupDetailCubit.tournament!.state ==
                                      TournamentState.inscriptionOuverte
                              ? Container(
                                  padding: const EdgeInsets.only(top: 20),
                                  child: Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    mainAxisSize: MainAxisSize.max,
                                    children: const [
                                      Divider(
                                        color: Colors.white,
                                        thickness: 1,
                                      ),
                                      SignTournamentForm(),
                                    ],
                                  ),
                                )
                              : Container();
                        }
                      }

                      return const CircularProgressIndicator();
                    },
                  ),
                  const Divider(
                    color: Colors.white,
                    thickness: 1,
                    height: 50,
                  ),
                  BlocBuilder<MemberTournamentFirestoreBloc,
                      MemberTournamentFirestoreState>(
                    builder: (context, state) {
                      return buildListTeam();
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  bool isLeader(BuildContext context) =>
      context.read<RowMemberLeaderCubit>().state.roleType == RoleType.leader;

  bool isPlayer(BuildContext context) =>
      context.read<RowMemberLeaderCubit>().state.roleType == RoleType.player;

  Widget buildListTeam() {
    return ListTeamWidget(tournament: tournament);
  }
}
