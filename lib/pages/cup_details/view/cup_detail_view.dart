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
import 'package:o_spawn_cup/cubit/show_stat_cubit.dart';
import 'package:o_spawn_cup/cubit/team_firestore/team_firestore_cubit.dart';
import 'package:o_spawn_cup/models/Team/team.dart';
import 'package:o_spawn_cup/models/make_it_responsive.dart';
import 'package:o_spawn_cup/pages/cup_details/bloc/sign_tournament_form_bloc.dart';
import 'package:o_spawn_cup/pages/cup_details/cubit/cup_detail_cubit.dart';
import 'package:o_spawn_cup/pages/cup_details/cup_details.dart';
import 'package:o_spawn_cup/pages/cup_details/widgets/text_field_gamer_tag.dart';
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
            buildContainerHeader(screenSize, tournament),
            Container(
              padding: const EdgeInsets.only(
                  top: 25, right: 15, left: 15, bottom: 15),
              child: Column(
                children: [
                  rowInformationTournament(leftText: 'Date inscription:', rightText: Utils().formatDate(tournament.dateDebutInscription)),
                  rowInformationTournament(leftText: 'Date du tournois:', rightText: Utils().formatDate(tournament.dateDebutTournois)),
                  rowInformationTournament(leftText: 'Nombre de games:',rightText: tournament.roundNumber.toString()),
                  rowInformationTournament(leftText: 'Type de tournois:',rightText: tournament.tournamentType.name),
                  BlocBuilder<CupDetailCubit, CupDetailState>(
                    buildWhen: (previous, current) => current is CupDetailTournamentChanged,
                    builder: (context, state) {
                      if(state.runtimeType == CupDetailTournamentChanged && (state as CupDetailTournamentChanged).isClose) {
                          return rowInformationTournament(leftText: 'Etat:', rightText: state.tournament!.state.name);
                      }
                      return Container();
                    },
                  ),

                  BlocBuilder<CupDetailCubit, CupDetailState>(
                    buildWhen: (previous, current) => current is CupDetailListTeamChanged,
                    builder: (context, state) {
                      return rowInformationTournament(
                          leftText: 'Place restantes:',
                          rightText: (state.runtimeType == CupDetailListTeamChanged)
                            ? (cupDetailCubit.tournament.capacity - (state as CupDetailListTeamChanged).listTeam.length).toString() +
                              '/' +
                          cupDetailCubit.tournament.capacity.toString()
                              : '0/0');
                    },
                  ),
                BlocBuilder<CupDetailCubit, CupDetailState>(
                    builder: (context, state) {
                      if(state is CupDetailListTeamChanged || state is CupDetailTournamentChanged) {
                        var statePlaces = cupDetailCubit.placesRestante(cupDetailCubit.tournament, cupDetailCubit.listTeam);
                        if(statePlaces == statePlacesRestante.isNotFull && cupDetailCubit.tournament.state == TournamentState.inscriptionOuverte) {
                          return Container(
                            padding: const EdgeInsets.only(top: 20),
                            // height: screenSize.height * 0.38,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                      return Container();
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

  Member addMember() {
    var rng = Random();
    Member member =
    Member(pseudo: 'Tama' + rng.nextInt(100).toString(), uid: 'ffsq');
    return member;
  }

  void afterAddMemberTournament() {
    msgSnack = 'Inscription validée !';
    errorSign = false;
    teamNameController.text = '';
    gamerTagController.text = '';
  }

  buildContainerHeader(Size screenSize, Tournament tournament) {
    return BlocBuilder<MemberCubit, MemberState>(
      builder: (context, stateMember) {
        return BlocBuilder<HeaderSignCupCubit, HeaderSignCupState>(
          builder: (context, stateHeader) {
            return Hero(
              tag: 'tagcard_cup_${tournament.documentId}',
              child: Container(
                // width: screenSize.width,
                height: screenSize.height * 0.25,
                // color: Colors.orange,
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: (tournament.state == TournamentState.inscriptionOuverte)
                          ? colorOpen
                          : (tournament.state == TournamentState.enCours)
                          ? colorInProgress
                          : colorClose,
                      blurRadius: 25.0, // soften the shadow
                      spreadRadius: 10, //extend the shadow
                      offset: const Offset(
                        0, // Move to right 10  horizontally
                        -15, // Move to bottom 10 Vertically
                      ),
                    )
                  ],
                  image: DecorationImage(
                    colorFilter: ColorFilter.mode(
                        Colors.black.withOpacity(0.95), BlendMode.dstATop),
                    opacity: 0.31,
                    image: Image.network(tournament.imageUrl!).image,
                    fit: BoxFit.cover,
                  ),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      height: screenSize.height * 0.03,
                    ),
                    Text(
                      tournament.name,
                      style: TextStyle(
                          color: colorTheme,
                          fontSize: 35,
                          fontFamily: 'o_spawn_cup_font',
                          fontWeight: FontWeight.normal),
                    ),
                    SubtitleElement(
                      text: tournament.game.name,
                      color: Colors.white,
                    ),
                    Row(
                      // mainAxisAlignment: MainAxisAlignment.,
                      children: [
                        Expanded(
                            flex: 1,
                            child: Material(
                              color: Colors.transparent,
                              child: IconButton(
                                splashColor: Colors.transparent,
                                highlightColor: Colors.transparent,
                                icon:
                                ((stateMember as MemberInitial).member?.isAdmin == true)
                                    ? const Icon(Icons.close_outlined,color: Colors.white,)
                                    : Container(),
                                onPressed: () => context.read<HeaderSignCupCubit>().closeCup(tournament),
                              ),
                            )),
                        Expanded(
                          flex: 5,
                          child: Text(
                            'Serveur: ${tournament.server.name}',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                color: colorTheme,
                                fontSize: 12,
                                fontFamily: 'o_spawn_cup_font',
                                fontWeight: FontWeight.normal),
                          ),
                        ),
                        Expanded(
                          flex: 1,
                          child: Material(
                            color: Colors.transparent,
                            child: IconButton(
                              splashColor: Colors.transparent,
                              highlightColor: Colors.transparent,
                              icon:
                              ((stateMember as MemberInitial).member?.isAdmin == true)
                                  ? SvgPicture.asset(
                                'assets/images/icon_edit.svg',
                                // height: 30,
                                // width: 37,
                              )
                                  : Container(),
                              onPressed: () => Navigator.of(context).push(BlocRouter().cupForm(tournament)),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            );
          },
        );
      },
    );
  }

  Container buildContainerMap(Size screenSize) {
    return Container(
      width: screenSize.width,
      height: screenSize.height * 0.18,
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(Radius.circular(13)),
        image: DecorationImage(
          opacity: 0.9,
          image: Image.asset('assets/images/forniteBackground.png').image,
          fit: BoxFit.cover,
        ),
      ),
      child: const Center(
        child: Text(
          'Believer Beach',
          style: TextStyle(
            color: Colors.white,
            fontSize: 44,
          ),
        ),
      ),
    );
  }

  BlocBuilder buildListTeam() {
    return BlocBuilder<TeamFirestoreCubit, TeamFirestoreState>(
      builder: (context, state) {
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
              builder: (context, state) {
                return Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    TextButton(
                        child: SubtitleElement(
                          text: 'Global',
                          color:
                          (state.globalStat) ? colorOrange : Colors.white,
                        ),
                        onPressed: () =>
                            context.read<ShowStatCubit>().changeStatShow(true)),
                    TextButton(
                        child: SubtitleElement(
                            text: 'Détaillé',
                            color: (!state.globalStat)
                                ? colorOrange
                                : Colors.white),
                        onPressed: () => context
                            .read<ShowStatCubit>()
                            .changeStatShow(false)),
                  ],
                );
              },
            ),
            BlocBuilder<ShowStatCubit, ShowStatState>(
              builder: (context, state) {
                return (state.globalStat)
                    ? (context.read<TeamFirestoreCubit>().listTeam.isNotEmpty)
                    ? Column(
                  children: [
                    const columnTable(),
                    tableTeamStat(tournament: tournament),
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
                                    tableTeamStat(tournament: tournament),
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
      },
    );
  }
}





class tableTeamStat extends StatelessWidget {
  const tableTeamStat({
    Key? key,
    required this.tournament,
  }) : super(key: key);

  final Tournament tournament;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10.0),
      child: ListView.builder(
        shrinkWrap: true,
        itemCount: context.read<TeamFirestoreCubit>().listTeam.length,
        itemBuilder: (context, indexTeams) {
          return Column(
            children: [
              rowStatTeam(tournament: tournament, indexTeams: indexTeams),
              const Divider(color: Colors.grey),
              (context.read<TeamFirestoreCubit>().indexSelect == indexTeams)
                  ? listMemberInTeam(
                tournament: tournament,
                indexTeams: indexTeams,
              )
                  : Container(),
            ],
          );
        },
      ),
    );
  }
}

class rowStatTeam extends StatelessWidget {
  const rowStatTeam({
    Key? key,
    required this.tournament,
    required this.indexTeams,
  }) : super(key: key);

  final Tournament tournament;
  final int indexTeams;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => context.read<TeamFirestoreCubit>().changeRowSelect(
        indexTeams,
        tournament,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            flex: 3,
            child: Row(
              children: [
                AnimatedContainer(
                  duration: const Duration(seconds: 2),
                  child: Transform.rotate(
                    angle: (context.read<TeamFirestoreCubit>().indexSelect ==
                        indexTeams)
                        ? 0
                        : 180 * pi / 180,
                    child: IconButton(
                        splashColor: Colors.transparent,
                        highlightColor: Colors.transparent,
                        onPressed: () {},
                        icon: SvgPicture.asset(
                          'assets/images/downArrow.svg',
                          height: 10,
                          width: 15,
                          color:
                          (context.read<TeamFirestoreCubit>().indexSelect ==
                              indexTeams)
                              ? colorTheme
                              : Colors.white,
                        )),
                  ),
                ),
                TextElement(
                  text:
                  '${indexTeams + 1}. ${context.read<TeamFirestoreCubit>().listTeam[indexTeams].name}',
                  color: (context.read<TeamFirestoreCubit>().indexSelect ==
                      indexTeams)
                      ? colorTheme
                      : Colors.white,
                  textAlign: TextAlign.start,
                ),
              ],
            ),
          ),
          Expanded(
            flex: 1,
            child: TextElement(
              text: '0',
              color:
              (context.read<TeamFirestoreCubit>().indexSelect == indexTeams)
                  ? colorTheme
                  : Colors.white,
              textAlign: TextAlign.center,
            ),
          ),
          Expanded(
            flex: 1,
            child: TextElement(
              text: '0',
              color:
              (context.read<TeamFirestoreCubit>().indexSelect == indexTeams)
                  ? colorTheme
                  : Colors.white,
              textAlign: TextAlign.center,
            ),
          ),
          Expanded(
            flex: 1,
            child: TextElement(
              text: '0',
              color:
              (context.read<TeamFirestoreCubit>().indexSelect == indexTeams)
                  ? colorTheme
                  : Colors.white,
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
      highlightColor: Colors.transparent,
      splashColor: Colors.transparent,
    );
  }
}

class listMemberInTeam extends StatelessWidget {
  const listMemberInTeam({
    Key? key,
    required this.tournament,
    required this.indexTeams,
  }) : super(key: key);

  final Tournament tournament;
  final int indexTeams;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: context.read<TeamFirestoreCubit>().listMemberTournament.length,
      shrinkWrap: true,
      itemBuilder: (context, indexMemberTournament) {
        return AnimatedContainer(
          duration: const Duration(milliseconds: 100),
          padding: const EdgeInsets.only(top: 10),
          child: Column(
            children: [
              BlocBuilder<MemberCubit, MemberState>(
                builder: (context, state) {
                  return Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      (context
                          .read<TeamFirestoreCubit>()
                          .listMemberTournament[
                      indexMemberTournament]
                          .member
                          .uid ==
                          FirebaseAuth.instance.currentUser!.uid ||
                          (state as MemberInitial).member?.isAdmin == true)
                          ? SizedBox(
                        height: 20,
                        // color: Colors.green,
                        child: IconButton(
                          padding: const EdgeInsets.all(0.0),
                          onPressed: () {
                            context
                                .read<TeamFirestoreCubit>()
                                .disqualificationMember(
                                indexMemberTournament,
                                tournament,
                                context
                                    .read<TeamFirestoreCubit>()
                                    .listTeam[indexTeams],
                                context
                                    .read<TeamFirestoreCubit>()
                                    .listMemberTournament[
                                indexMemberTournament]);
                            context
                                .read<TeamFirestoreCubit>()
                                .disqualifiedTeam(
                              indexTeams,
                              tournament,
                            );
                          },
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
                          text: context
                              .read<TeamFirestoreCubit>()
                              .listMemberTournament[indexMemberTournament]
                              .gamerTag,
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
                  );
                },
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
}

class columnTable extends StatelessWidget {
  const columnTable({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          flex: 3,
          child: TextElement(
            text: 'Nom des équipes',
            color: Colors.white,
            textAlign: TextAlign.center,
          ),
        ),
        Expanded(
          flex: 1,
          child: TextElement(
            text: 'Rang',
            color: Colors.white,
            textAlign: TextAlign.center,
          ),
        ),
        Expanded(
          flex: 1,
          child: TextElement(
            text: 'KDA',
            color: Colors.white,
            textAlign: TextAlign.center,
          ),
        ),
        Expanded(
          flex: 1,
          child: TextElement(
            text: 'Ratio',
            color: Colors.white,
            textAlign: TextAlign.center,
          ),
        ),
      ],
    );
  }
}

class rowInformationTournament extends StatelessWidget {
  const rowInformationTournament({
    Key? key,
    required this.leftText,
    required this.rightText,
  }) : super(key: key);

  final String leftText;
  final String rightText;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        top: 4.0,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          TextElement(
            text: leftText,
            color: Colors.white,
          ),
          TextElement(
            text: rightText,
            color: colorTheme,
          ),
        ],
      ),
    );
  }
}
