import 'package:dotted_line/dotted_line.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_form_bloc/flutter_form_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:formz/formz.dart';
import 'package:o_spawn_cup/bloc/bloc_router.dart';
import 'package:o_spawn_cup/bloc/member_tournament_firestore_bloc/member_tournament_firestore_bloc.dart';
import 'package:o_spawn_cup/bloc/sign_cup_bloc/sign_cup_bloc.dart';
import 'package:o_spawn_cup/cubit/header_sign_cup_cubit.dart';
import 'package:o_spawn_cup/cubit/member_bloc/member_cubit.dart';
import 'package:o_spawn_cup/cubit/round_stat_cubit.dart';
import 'package:o_spawn_cup/cubit/row_member_leader/row_member_leader_cubit.dart';
import 'package:o_spawn_cup/cubit/team_firestore/team_firestore_cubit.dart';
import 'package:o_spawn_cup/models/Team/team.dart';
import 'package:o_spawn_cup/models/make_it_responsive.dart';
import 'package:o_spawn_cup/pages/cup_details/bloc/sign_tournament_form_bloc.dart';
import 'package:o_spawn_cup/pages/cup_details/cubit/cup_detail_cubit.dart';
import 'package:o_spawn_cup/pages/cup_details/cubit/show_stat_cubit.dart';
import 'package:o_spawn_cup/pages/cup_details/cup_details.dart';
import 'package:o_spawn_cup/pages/cup_details/widgets/container_header.dart';
import 'package:o_spawn_cup/pages/cup_details/widgets/text_field_gamer_tag.dart';
import 'package:o_spawn_cup/repository/member_tounament_repository.dart';
import 'package:o_spawn_cup/services/firebase_handler.dart';
import 'package:o_spawn_cup/services/utils.dart';
import 'package:o_spawn_cup/shared/widgets/custom_app_bar.dart';
import 'package:o_spawn_cup/shared/widgets/custom_button_theme.dart';
import 'package:o_spawn_cup/shared/widgets/custom_drawer.dart';
import 'package:o_spawn_cup/shared/widgets/custom_text_field.dart';
import 'package:o_spawn_cup/shared/widgets/subtiltle_element.dart';
import 'package:o_spawn_cup/shared/widgets/text_element.dart';
import 'package:o_spawn_cup/constant.dart';
import 'package:o_spawn_cup/models/Member/member.dart';
import 'dart:math';

import 'package:o_spawn_cup/models/Tournament/tournament.dart';
import 'package:o_spawn_cup/models/Tournament/tournament_state.dart';
import 'package:o_spawn_cup/models/role_type.dart';

class CupDetailView extends StatelessWidget {
  CupDetailView({Key? key, required this.tournament}) : super(key: key);
  TextEditingController gamerTagController = TextEditingController();
  TextEditingController teamNameController = TextEditingController();
  late Tournament tournament;
  List<Team> teams = [];
  String msgSnack = 'Inscription validée !';
  bool errorSign = false;
  String teamNameTextFieldHint = "Nom d'équipe";

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    var cupDetailCubit = context.read<CupDetailCubit>();

    return Scaffold(
      backgroundColor: colorBackgroundTheme,
      endDrawer: CustomDrawer(screenSize: screenSize),
      appBar: CustomAppBar(
        title: 'INSCRIPTION',
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            ContainerHeader(),
            Container(
              padding: const EdgeInsets.only(
                  top: 25, right: 15, left: 15, bottom: 15),
              child: Column(
                children: [
                  RowInformationTournament(
                      leftText: 'Date inscription:',
                      rightText:
                          Utils().formatDate(tournament.dateDebutInscription)),
                  RowInformationTournament(
                      leftText: 'Date du tournois:',
                      rightText:
                          Utils().formatDate(tournament.dateDebutTournois)),
                  RowInformationTournament(
                      leftText: 'Nombre de games:',
                      rightText: tournament.roundNumber.toString()),
                  RowInformationTournament(
                      leftText: 'Type de tournois:',
                      rightText: tournament.tournamentType.name),
                  BlocBuilder<CupDetailCubit, CupDetailState>(
                    buildWhen: (previous, current) =>
                        current is CupDetailTournamentChanged,
                    builder: (context, state) {
                      if (state.runtimeType == CupDetailTournamentChanged &&
                          (state as CupDetailTournamentChanged).isClose) {
                        return RowInformationTournament(
                            leftText: 'Etat:',
                            rightText: state.tournament!.state.name);
                      }
                      return Container();
                    },
                  ),
                  BlocBuilder<CupDetailCubit, CupDetailState>(
                    buildWhen: (previous, current) => current is CupDetailListTeamChanged || current is CupDetailTournamentChanged,
                    builder: (context, state) {
                      if(cupDetailCubit.tournament != null) {
                        return RowInformationTournament(
                            leftText: 'Place restantes:',
                            rightText: (state.runtimeType == CupDetailListTeamChanged || state.runtimeType == CupDetailTournamentChanged)
                                ? (cupDetailCubit.tournament!.capacity - cupDetailCubit.listTeam.length).toString() +
                                '/' +
                                cupDetailCubit.tournament!.capacity.toString()
                                : '0/0');
                      }
                      return const CircularProgressIndicator();
                    },
                  ),
                  BlocBuilder<CupDetailCubit, CupDetailState>(
                      buildWhen: (previous, current) =>
                          current is CupDetailListTeamChanged || current is CupDetailTournamentChanged,
                      builder: (context, state) {
                        // print(state);
                        if(cupDetailCubit.tournament != null) {
                          if (state is CupDetailListTeamChanged ||
                              state is CupDetailTournamentChanged) {
                            var statePlaces = cupDetailCubit.placesRestante(
                                cupDetailCubit.tournament!,
                                cupDetailCubit.listTeam);
                            if (statePlaces == statePlacesRestante.isNotFull &&
                                cupDetailCubit.tournament!.state ==
                                    TournamentState.inscriptionOuverte) {
                              return Container(
                                padding: const EdgeInsets.only(top: 20),
                                // height: screenSize.height * 0.38,
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
                              );
                            }
                          }
                        }

                        return const CircularProgressIndicator();
                      }),
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
            )
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

    return Column(
      children: [
        Container(
          padding: const EdgeInsets.only(top: 5, bottom: 10),
          child: SubtitleElement(
            text: 'Liste des équipes',
            color: colorTheme,
          ),
        ),
        BlocBuilder<ShowStatCubit, ShowStatState>(
          buildWhen: (previous, current) => current is ShowStatChanged,
          builder: (context, state) {
            if(state is ShowStatChanged) {
              var showStatCubit = context.read<ShowStatCubit>();
              return Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  TextButton(
                      child: SubtitleElement(
                        text: 'Global',
                        color: (showStatCubit.globalStat) ? colorOrange : Colors.white,
                      ),
                      onPressed: () => showStatCubit.changeStatShow(true)),
                  TextButton(
                      child: SubtitleElement(
                          text: 'Détaillé',
                          color:
                          (!showStatCubit.globalStat) ? colorOrange : Colors.white),
                      onPressed: () => showStatCubit.changeStatShow(false)),
                ],
              );
            }
            return const CircularProgressIndicator();
          },
        ),
        BlocBuilder<ShowStatCubit, ShowStatState>(
          buildWhen: (previous, current) => current is ShowStatChanged || current is ShowStatTournamentLoaded,
          builder: (context, state) {
            var showStatCubit = context.read<ShowStatCubit>();
            return (showStatCubit.globalStat)
                ? (showStatCubit.listTeam.isNotEmpty)
                    ? Column(
                        children: [
                          const columnTable(),
                          TableTeamStat(tournament: showStatCubit.tournament),
                        ],
                      )
                    : Padding(
                        padding: const EdgeInsets.all(10),
                        child: Center(
                            child: TextElement(
                          text: "Il n'y a encore aucune équipe inscrite",
                          color: Colors.white,
                        )),
                      )
                : Column(
                    children: [
                      const columnTable(),
                      BlocBuilder<RoundStatCubit, RoundStatState>(
                        builder: (context, stateRound) {
                          return DefaultTabController(
                            length: tournament.roundNumber,
                            child: Builder(
                              builder: (BuildContext context) {
                                final TabController controller =
                                    DefaultTabController.of(context)!;
                                controller.animateTo(stateRound.roundShow);
                                return Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Column(
                                    children: <Widget>[
                                      Row(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          IconButton(
                                            onPressed: () => context
                                                .read<RoundStatCubit>()
                                                .changeTabContinue(),
                                            icon: const Icon(
                                              Icons.chevron_left,
                                              color: Colors.white,
                                              size: 36,
                                            ),
                                          ),
                                          TextElement(
                                            text:
                                                'Round ${stateRound.roundShow + 1}',
                                            color: colorTheme,
                                          ),
                                          IconButton(
                                              onPressed: () => context
                                                  .read<RoundStatCubit>()
                                                  .changeTabCancel(),
                                              icon: const Icon(
                                                Icons.chevron_right,
                                                color: Colors.white,
                                                size: 36,
                                              ))
                                        ],
                                      ),
                                      TableTeamStat(tournament: tournament),
                                      const TabPageSelector(
                                          selectedColor: Color(0xffFFD739)),
                                    ],
                                  ),
                                );
                              },
                            ),
                          );
                        },
                      ),
                    ],
                  );
          },
        )
      ],
    );
  }
}

class TableTeamStat extends StatelessWidget {
  const TableTeamStat({
    Key? key,
    required this.tournament,
  }) : super(key: key);

  final Tournament tournament;

  @override
  Widget build(BuildContext context) {

    return Padding(
      padding: const EdgeInsets.only(top: 10.0),
      child: BlocBuilder<ShowStatCubit, ShowStatState>(
        buildWhen: (previous, current) => current is ShowStatTournamentLoaded || current is ShowStatTeamsLoaded || current is ShowStatRowSelected,
        builder: (context, state) {
        var showStatCubit = context.read<ShowStatCubit>();
        return ListView.builder(
        shrinkWrap: true,
        itemCount: showStatCubit.listTeam.length,
        itemBuilder: (context, indexTeams) {
          return Column(
            children: [
              RowStatTeam(tournament: showStatCubit.tournament, indexTeams: indexTeams),
              const Divider(color: Colors.grey),
              (showStatCubit.indexRowSelect == indexTeams)
                  ? ListMemberInTeam(
                      tournament: showStatCubit.tournament,
                      indexTeams: indexTeams,
                    )
                  : Container(),
            ],
          );
        },
      );
  },
),
    );
  }
}



class ListMemberInTeam extends StatelessWidget {
  const ListMemberInTeam({
    Key? key,
    required this.tournament,
    required this.indexTeams,
  }) : super(key: key);

  final Tournament tournament;
  final int indexTeams;

  @override
  Widget build(BuildContext context) {
    var showStatCubit = context.read<ShowStatCubit>();
    return BlocBuilder<ShowStatCubit, ShowStatState>(
      buildWhen: (previous, current) => current is ShowStatMemberTournamentLoaded,
  builder: (context, state) {
        if(state is ShowStatMemberTournamentLoaded){
          return ListView.builder(
            itemCount: state.listMemberTournament.length,
            shrinkWrap: true,
            itemBuilder: (context, indexMemberTournament) {
              return AnimatedContainer(
                duration: const Duration(milliseconds: 100),
                padding: const EdgeInsets.only(top: 10),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        ((state).listMemberTournament[indexMemberTournament].member.uid == FirebaseAuth.instance.currentUser!.uid
                            || context.read<CupDetailCubit>().member.isAdmin == true)
                            ? SizedBox(
                          height: 20,
                          // color: Colors.green,
                          child: IconButton(
                            padding: const EdgeInsets.all(0.0),
                            onPressed: () => showStatCubit.disqualifiedMemberTournament(state.listMemberTournament[indexMemberTournament],showStatCubit.listTeam[indexTeams]),
                            icon: const Icon(
                              Icons.close_outlined,
                              color: Colors.red,
                            ),
                            alignment: Alignment.center,
                          ),
                        )
                            : const SizedBox(
                          height: 20,
                          width: 40,
                        ),
                        Expanded(
                          flex: 3,
                          child: TextElement(
                            text: state.listMemberTournament[indexMemberTournament].gamerTag,
                            color: Colors.white,
                            textAlign: TextAlign.center,
                          ),
                        ),
                        Expanded(
                          flex: 1,
                          child: TextElement(
                            text: '0',
                            color: Colors.white,
                            textAlign: TextAlign.center,
                          ),
                        ),
                        Expanded(
                          flex: 1,
                          child: TextElement(
                            text: '0',
                            color: Colors.white,
                            textAlign: TextAlign.center,
                          ),
                        ),
                        Expanded(
                          flex: 1,
                          child: TextElement(
                            text: '0',
                            color: Colors.white,
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ],
                    ),
                    const Padding(
                      padding: EdgeInsets.only(top: 10.0),
                      child: DottedLine(
                        dashColor: Colors.grey,
                        lineThickness: 0.2,
                      ),
                    ),
                  ],
                ),
              );
            },
          );
        }
    return const CircularProgressIndicator();
  },
);
  }
}


