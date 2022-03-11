import "package:cloud_firestore/cloud_firestore.dart";
import "package:cloud_firestore_odm/cloud_firestore_odm.dart";
import "package:dotted_border/dotted_border.dart";
import "package:dotted_line/dotted_line.dart";
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import "package:flutter/material.dart";
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import "package:flutter_switch/flutter_switch.dart";
import 'package:formz/formz.dart';
import "package:mailer/mailer.dart";
import "package:mailer/smtp_server.dart";
import "package:mailer/smtp_server/gmail.dart";
import 'package:o_spawn_cup/bloc/member_tournament_firestore_bloc/member_tournament_firestore_bloc.dart';
import 'package:o_spawn_cup/bloc/sign_cup_bloc/sign_cup_bloc.dart';
import 'package:o_spawn_cup/cubit/round_stat_cubit.dart';
import 'package:o_spawn_cup/cubit/row_member_leader/row_member_leader_cubit.dart';
import 'package:o_spawn_cup/cubit/show_stat_cubit.dart';
import 'package:o_spawn_cup/cubit/team_firestore/team_firestore_cubit.dart';
import 'package:o_spawn_cup/service/firebase_handler.dart';
import 'package:o_spawn_cup/service/utils.dart';
import "package:o_spawn_cup/ui/CustomsWidgets/custom_app_bar.dart";
import "package:o_spawn_cup/ui/CustomsWidgets/custom_button_theme.dart";
import "package:o_spawn_cup/ui/CustomsWidgets/custom_drawer.dart";
import "package:o_spawn_cup/ui/CustomsWidgets/custom_text_field.dart";
import "package:o_spawn_cup/ui/CustomsWidgets/subtiltle_element.dart";
import "package:o_spawn_cup/ui/CustomsWidgets/text_element.dart";
import "package:o_spawn_cup/constant.dart";
import "package:o_spawn_cup/models/Member/member.dart";
import "dart:math";

import "package:o_spawn_cup/models/Tournament/tournament.dart";
import "package:o_spawn_cup/models/Tournament/tournament_state.dart";
import "package:o_spawn_cup/models/role_type.dart";

import '../../bloc/bloc_router.dart';
import '../../cubit/header_sign_cup_cubit.dart';
import '../../cubit/member_bloc/member_cubit.dart';
import '../../models/Team/team.dart';

class SignCup extends StatelessWidget {
  Tournament tournament;
  SignCup({Key? key, required this.tournament}) : super(key: key);
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
      child: SignCupView(
        tournament: tournament,
      ),
    );
  }
}

class SignCupView extends StatelessWidget {
  SignCupView({Key? key, required this.tournament}) : super(key: key);
  TextEditingController gamerTagController = TextEditingController();
  TextEditingController teamNameController = TextEditingController();
  late Tournament tournament;
  List<Team> teams = [];
  String msgSnack = "Inscription validée !";
  bool errorSign = false;
  String teamNameTextFieldHint = "Nom d'équipe";

  @override
  Widget build(BuildContext context) {
    context.read<TeamFirestoreCubit>().getTeamsTournament(tournament);

    Size screenSize = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: colorBackgroundTheme,
      endDrawer: CustomDrawer(screenSize: screenSize),
      appBar: CustomAppBar(
        title: "INSCRIPTION",
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
                  rowInformationTournament(leftText: "Date inscription:", rightText: Utils().formatDate(tournament.dateDebutInscription)),
                  rowInformationTournament(leftText: "Date du tournois:", rightText: Utils().formatDate(tournament.dateDebutTournois)),
                  rowInformationTournament(
                      leftText: "Nombre de games:",
                      rightText: tournament.roundNumber.toString()),
                  rowInformationTournament(
                      leftText: "Type de tournois:",
                      rightText: tournament.tournamentType.name),
                  BlocBuilder<HeaderSignCupCubit, HeaderSignCupState>(
                    builder: (context, state) {
                    return (tournament.state == TournamentState.inscriptionFermer ||
                        tournament.state == TournamentState.annuler ||
                        tournament.state == TournamentState.complet ||
                        tournament.state == TournamentState.terminer)
                        ? rowInformationTournament(leftText: "Etat:", rightText: tournament.state.state)
                        : Container();
                  },),

                  BlocBuilder<TeamFirestoreCubit, TeamFirestoreState>(
                    buildWhen: (previous, current) =>
                        current.runtimeType == TeamFirestoreLoaded,
                    builder: (context, state) {
                      return rowInformationTournament(
                          leftText: "Place restantes:",
                          rightText: (tournament.capacity -
                                      context
                                          .read<TeamFirestoreCubit>()
                                          .listTeam
                                          .length)
                                  .toString() +
                              "/" +
                              tournament.capacity.toString());
                    },
                  ),
                  (tournament.capacity - teams.length == 0 || tournament.state != TournamentState.incriptionOuverte)
                      ? Container()
                      : Container(
                          padding: const EdgeInsets.only(top: 20),
                          // height: screenSize.height * 0.38,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              const Divider(
                                color: Colors.white,
                                thickness: 1,
                              ),
                              SubtitleElement(
                                text: "Inscription au tournois",
                                color: colorTheme,
                              ),
                              BlocBuilder<SignCupBloc, SignCupState>(
                                builder: (context, state) {
                                  return CustomTextField(
                                      paddingBottom: 10,
                                      onChanged: (context, value) => context
                                          .read<SignCupBloc>()
                                          .add(SignCupGamerTagChanged(
                                              gamerTagController.text)),
                                      errorText: state.gamerTag.invalid
                                          ? "Gamertag invalide"
                                          : null,
                                      screenSize: screenSize,
                                      text: "GamerTag",
                                      buttonColor: Colors.white,
                                      borderColor: Colors.white,
                                      controller: gamerTagController);
                                },
                              ),
                              Text(
                                "*Votre pseudo in game",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    color: colorTheme,
                                    fontSize: 7,
                                    fontFamily: "o_spawn_cup_font",
                                    fontWeight: FontWeight.normal),
                              ),
                              AnimatedContainer(
                                duration: const Duration(milliseconds: 100),
                                width: screenSize.width * 0.87,
                                height: screenSize.height * 0.06,
                                margin:
                                    const EdgeInsets.only(bottom: 10, top: 5),
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(31),
                                ),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Expanded(
                                      child: BlocBuilder<RowMemberLeaderCubit,
                                          RowMemberLeaderState>(
                                        builder: (context, state) {
                                          return Container(
                                            decoration: BoxDecoration(
                                              color: (isLeader(context))
                                                  ? colorTheme
                                                  : Colors.white,
                                              borderRadius:
                                                  const BorderRadius.only(
                                                      topLeft:
                                                          Radius.circular(31),
                                                      bottomLeft:
                                                          Radius.circular(31)),
                                            ),
                                            child: TextButton(
                                                style: ButtonStyle(
                                                  // foregroundColor: MaterialStateProperty.all(Colors.red),
                                                  overlayColor:
                                                      MaterialStateProperty.all(
                                                          Colors.transparent),
                                                ),
                                                onPressed: () {
                                                  context
                                                      .read<
                                                          RowMemberLeaderCubit>()
                                                      .changedRoleType(
                                                          RoleType.leader);
                                                },
                                                child: TextElement(
                                                  text: "Chef d'équipe",
                                                )),
                                          );
                                        },
                                      ),
                                    ),
                                    const VerticalDivider(
                                      color: Color(0xff696969),
                                      width: 1,
                                      thickness: 1,
                                      // endIndent: 1,
                                    ),
                                    Expanded(
                                      child: BlocBuilder<RowMemberLeaderCubit,
                                          RowMemberLeaderState>(
                                        builder: (context, state) {
                                          return AnimatedContainer(
                                            duration: const Duration(
                                                milliseconds: 200),
                                            decoration: BoxDecoration(
                                              color: (isPlayer(context))
                                                  ? colorTheme
                                                  : Colors.white,
                                              borderRadius:
                                                  const BorderRadius.only(
                                                      topRight:
                                                          Radius.circular(31),
                                                      bottomRight:
                                                          Radius.circular(31)),
                                            ),
                                            child: TextButton(
                                                style: ButtonStyle(
                                                  // foregroundColor: MaterialStateProperty.all(Colors.red),
                                                  overlayColor:
                                                      MaterialStateProperty.all(
                                                          Colors.transparent),
                                                ),
                                                onPressed: () {
                                                  context
                                                      .read<
                                                          RowMemberLeaderCubit>()
                                                      .changedRoleType(
                                                          RoleType.player);
                                                },
                                                child: TextElement(
                                                  text: "Membre d'équipe",
                                                )),
                                          );
                                        },
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              BlocBuilder<SignCupBloc, SignCupState>(
                                builder: (context, stateSignBloc) {
                                  return BlocBuilder<RowMemberLeaderCubit,
                                      RowMemberLeaderState>(
                                    builder: (context, state) {
                                      return CustomTextField(
                                          paddingBottom: 10,
                                          onChanged: (context, value) => context
                                              .read<SignCupBloc>()
                                              .add(SignCupTeamCodeChanged(
                                                  teamNameController.text)),
                                          errorText:
                                              stateSignBloc.teamCode.invalid
                                                  ? "Code team invalide"
                                                  : null,
                                          textInputAction: TextInputAction.done,
                                          screenSize: screenSize,
                                          text: (isPlayer(context))
                                              ? "Code d'équipe"
                                              : "Nom d'équipe",
                                          buttonColor: Colors.white,
                                          borderColor: Colors.white,
                                          controller: teamNameController);
                                    },
                                  );
                                },
                              ),
                              isPlayer(context)
                                  ? Text(
                                      "*Entrez le code d'équipe reçu par mail si vous êtes membre de l'équipe.",
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                          color: colorTheme,
                                          fontSize: 7,
                                          fontFamily: "o_spawn_cup_font",
                                          fontWeight: FontWeight.normal),
                                    )
                                  : Container(),
                              Padding(
                                padding: const EdgeInsets.only(top: 20),
                                child: BlocListener<TeamFirestoreCubit,
                                        TeamFirestoreState>(
                                    listener: (context, state) {
                                      if (state is TeamFirestoreSelected ||
                                          state is TeamFirestoreLoaded) {
                                        var msg = "";
                                        var stateTeam;
                                        if (state is TeamFirestoreSelected) {
                                          stateTeam = (state).status;
                                        }
                                        if (state is TeamFirestoreLoaded) {
                                          stateTeam = (state).status;
                                        }
                                        switch (stateTeam) {
                                          case FirebaseStatusEvent.teamExist:
                                            msg = "La team existe déjà !";
                                            errorSign = true;
                                            break;
                                          case FirebaseStatusEvent.teamFull:
                                            msg = "La team est compléte !";
                                            errorSign = false;
                                            break;

                                          case FirebaseStatusEvent.codeNotFound:
                                            msg =
                                                "Le code team n'est pas connu !";
                                            errorSign = true;
                                            break;
                                          case FirebaseStatusEvent
                                              .memberNotConnect:
                                            msg = "Vous n'êtes pas connecter !";
                                            errorSign = true;
                                            break;
                                          case FirebaseStatusEvent.cupFull:
                                            msg = "Le tournois est complet !";
                                            errorSign = false;
                                            break;

                                          case FirebaseStatusEvent
                                              .memberAlreadySign:
                                            msg = "Vous êtes déjà inscrit !";
                                            errorSign = true;
                                            break;
                                          case FirebaseStatusEvent
                                              .memberSignSuccess:
                                            msg = "Enregistrement réussi !";
                                            errorSign = false;
                                            break;
                                        }
                                        if (msg != "") {
                                          ScaffoldMessenger.of(context)
                                              .showSnackBar(SnackBar(
                                            content: Text(msg),
                                            duration:
                                                const Duration(seconds: 3),
                                            backgroundColor:
                                                (errorSign == false)
                                                    ? Colors.green
                                                    : Colors.red,
                                          ));
                                        }
                                      }
                                    },
                                    child: CustomButtonTheme(
                                      colorButton: colorTheme,
                                      colorText: colorBackgroundTheme,
                                      screenSize: screenSize,
                                      text: "Confirmation",
                                      onPressedMethod: () async {
                                        await () async {
                                          context.read<SignCupBloc>().add(
                                              SignCupGamerTagChanged(
                                                  gamerTagController.text));
                                          context.read<SignCupBloc>().add(
                                              SignCupTeamCodeChanged(
                                                  teamNameController.text));
                                          if (context
                                              .read<SignCupBloc>()
                                              .state
                                              .status
                                              .isValidated) {
                                            if (isPlayer(context)) {
                                              context
                                                  .read<TeamFirestoreCubit>()
                                                  .addMemberInTeam(
                                                      tournament,
                                                      teamNameController.text,
                                                      gamerTagController.text);
                                            }
                                            if (isLeader(context)) {
                                              context
                                                  .read<TeamFirestoreCubit>()
                                                  .addNewTeam(
                                                      tournament,
                                                      teamNameController.text,
                                                      gamerTagController.text);
                                            }
                                            context
                                                .read<SignCupBloc>()
                                                .add(const SignCupSubmitted());
                                          } else {}

                                          afterAddMemberTournament();
                                        }();
                                      },
                                    )),
                              )
                            ],
                          ),
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
        Member(pseudo: "Tama" + rng.nextInt(100).toString(), uid: "ffsq");
    return member;
  }

  void afterAddMemberTournament() {
    msgSnack = "Inscription validée !";
    errorSign = false;
    teamNameController.text = "";
    gamerTagController.text = "";
  }

  buildContainerHeader(Size screenSize, Tournament tournament) {
    return BlocBuilder<MemberCubit, MemberState>(
  builder: (context, stateMember) {
    return BlocBuilder<HeaderSignCupCubit, HeaderSignCupState>(
  builder: (context, stateHeader) {
    return Hero(
      tag: "tagcard_cup_${tournament.documentId}",
      child: Container(
        // width: screenSize.width,
        height: screenSize.height * 0.25,
        // color: Colors.orange,
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: (tournament.state == TournamentState.incriptionOuverte)
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
                  fontFamily: "o_spawn_cup_font",
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
                    "Serveur: ${tournament.server.name}",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: colorTheme,
                        fontSize: 12,
                        fontFamily: "o_spawn_cup_font",
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
                                      "assets/images/icon_edit.svg",
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
          image: Image.asset("assets/images/forniteBackground.png").image,
          fit: BoxFit.cover,
        ),
      ),
      child: const Center(
        child: Text(
          "Believer Beach",
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
                text: "Liste des équipes",
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
                          text: "Global",
                          color:
                              (state.globalStat) ? colorOrange : Colors.white,
                        ),
                        onPressed: () =>
                            context.read<ShowStatCubit>().changeStatShow(true)),
                    TextButton(
                        child: SubtitleElement(
                            text: "Détaillé",
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
                                                    "Round ${stateRound.roundShow + 1}",
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
                          "assets/images/downArrow.svg",
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
                      "${indexTeams + 1}. ${context.read<TeamFirestoreCubit>().listTeam[indexTeams].name}",
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
              text: "0",
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
              text: "0",
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
              text: "0",
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
                          text: "0",
                          color: Colors.white,
                          textAlign: TextAlign.center,
                        ),
                      ),
                      Expanded(
                        flex: 1,
                        child: TextElement(
                          text: "0",
                          color: Colors.white,
                          textAlign: TextAlign.center,
                        ),
                      ),
                      Expanded(
                        flex: 1,
                        child: TextElement(
                          text: "0",
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
            text: "Nom des équipes",
            color: Colors.white,
            textAlign: TextAlign.center,
          ),
        ),
        Expanded(
          flex: 1,
          child: TextElement(
            text: "Rang",
            color: Colors.white,
            textAlign: TextAlign.center,
          ),
        ),
        Expanded(
          flex: 1,
          child: TextElement(
            text: "KDA",
            color: Colors.white,
            textAlign: TextAlign.center,
          ),
        ),
        Expanded(
          flex: 1,
          child: TextElement(
            text: "Ratio",
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
