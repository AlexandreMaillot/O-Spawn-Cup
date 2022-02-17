import "package:cloud_firestore/cloud_firestore.dart";
import "package:cloud_firestore_odm/cloud_firestore_odm.dart";
import "package:dotted_border/dotted_border.dart";
import "package:dotted_line/dotted_line.dart";
import 'package:firebase_core/firebase_core.dart';
import "package:flutter/material.dart";
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import "package:flutter_switch/flutter_switch.dart";
import "package:mailer/mailer.dart";
import "package:mailer/smtp_server.dart";
import "package:mailer/smtp_server/gmail.dart";
import 'package:o_spawn_cup/bloc/member_tournament_firestore_bloc/member_tournament_firestore_bloc.dart';
import 'package:o_spawn_cup/cubit/row_member_leader/row_member_leader_cubit.dart';
import 'package:o_spawn_cup/cubit/team_firestore/team_firestore_cubit.dart';
import 'package:o_spawn_cup/service/firebase_handler.dart';
import "package:o_spawn_cup/ui/CustomsWidgets/custom_app_bar.dart";
import "package:o_spawn_cup/ui/CustomsWidgets/custom_button_theme.dart";
import "package:o_spawn_cup/ui/CustomsWidgets/custom_drawer.dart";
import "package:o_spawn_cup/ui/CustomsWidgets/custom_text_field.dart";
import "package:o_spawn_cup/ui/CustomsWidgets/subtiltle_element.dart";
import "package:o_spawn_cup/ui/CustomsWidgets/text_element.dart";
import "package:o_spawn_cup/constant.dart";
import "package:o_spawn_cup/models/Member/member.dart";
import "package:o_spawn_cup/models/MemberTournament/member_tournament.dart"
    as Mt;
import "package:o_spawn_cup/models/Team/team.dart" as t;
import "dart:math";

import "package:o_spawn_cup/models/Tournament/tournament.dart";
import "package:o_spawn_cup/models/Tournament/tournament_state.dart";
import "package:o_spawn_cup/models/role_type.dart";

import '../../models/Team/team.dart';


class SignCup extends StatelessWidget {
  Tournament tournament;
  SignCup({Key? key,required this.tournament}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(providers: [
        BlocProvider(
          create: (_) => MemberTournamentFirestoreBloc(tournament: tournament),
        ),
      BlocProvider(
        create: (_) => RowMemberLeaderCubit(),
      ),
      BlocProvider(
        create: (_) => TeamFirestoreCubit(),
      ),
    ],
      child: SignCupView(tournament: tournament,),
    );
  }
}

class SignCupView extends StatelessWidget {
  SignCupView({Key? key, required this.tournament}) : super(key: key);
  TextEditingController gamerTagController = TextEditingController();
  TextEditingController teamNameController = TextEditingController();
  late Tournament tournament;
  late String years;
  late String month;
  late String day;
  late String date;
  List<Team> teams = [];
  String msgSnack = "Inscription validée !";
  bool errorSign = false;
  String teamNameTextFieldHint = "Nom d'équipe";





  @override
  Widget build(BuildContext context) {
    context.read<TeamFirestoreCubit>().getTeamsTournament(tournament);
    years = tournament.date.toString().substring(0, 4);
    month = tournament.date.toString().substring(4, 6);
    day = tournament.date.toString().substring(6, 8);
    date = day + "/" + month + "/" + years;
    Size screenSize = MediaQuery.of(context).size;

    var snackBar = SnackBar(
      content: Text(msgSnack),
      duration: const Duration(seconds: 3),
      backgroundColor: (errorSign == false) ? Colors.green : Colors.red,
    );




    return Scaffold(
      backgroundColor: colorBackgroundTheme,
      drawer: CustomDrawer(screenSize: screenSize),
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
                  rowInformationTournament(leftText: "Date:", rightText: date),
                  rowInformationTournament(
                      leftText: "Nombre de rounds:",
                      rightText: tournament.roundNumber.toString()),
                  rowInformationTournament(
                      leftText: "Type de tournois:",
                      rightText: tournament.tournamentType.name),
                  BlocBuilder<TeamFirestoreCubit, TeamFirestoreState>(
                    buildWhen: (previous, current) => current.runtimeType == TeamFirestoreLoaded,
                  builder: (context, state) {
                    return rowInformationTournament(
                      leftText: "Place restantes:",
                      rightText: (tournament.capacity - state.listTeam.length).toString() + "/" + tournament.capacity.toString());
                    },
                  ),
                  (tournament.capacity - teams.length == 0) ? Container() : Container(
                    padding: const EdgeInsets.only(top: 20),
                    height: screenSize.height * 0.38,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Divider(
                          color: Colors.white,
                          thickness: 1,
                        ),
                        SubtitleElement(
                          text: "Inscription au tournois",
                          color: colorTheme,
                        ),
                        CustomTextField(
                            screenSize: screenSize,
                            text: "GamerTag",
                            buttonColor: Colors.white,
                            borderColor: Colors.white,
                            controller: gamerTagController),
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
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(31),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Expanded(
                                child: BlocBuilder<RowMemberLeaderCubit, RowMemberLeaderState>(
                                builder: (context, state) {
                                  return Container(
                                  decoration: BoxDecoration(
                                    color: (isLeader(context))
                                        ? colorTheme
                                        : Colors.white,
                                    borderRadius: const BorderRadius.only(
                                        topLeft: Radius.circular(31),
                                        bottomLeft: Radius.circular(31)),
                                  ),
                                  child: TextButton(
                                      style: ButtonStyle(
                                        // foregroundColor: MaterialStateProperty.all(Colors.red),
                                        overlayColor: MaterialStateProperty.all(
                                            Colors.transparent),
                                      ),
                                      onPressed: () {
                                        context.read<RowMemberLeaderCubit>().changedRoleType(RoleType.leader);
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
                                child: BlocBuilder<RowMemberLeaderCubit, RowMemberLeaderState>(
                                builder: (context, state) {
                                  return AnimatedContainer(
                                    duration: const Duration(milliseconds: 200),
                                  decoration: BoxDecoration(
                                    color: (isPlayer(context))
                                        ? colorTheme
                                        : Colors.white,
                                    borderRadius: const BorderRadius.only(
                                        topRight: Radius.circular(31),
                                        bottomRight: Radius.circular(31)),
                                  ),
                                  child: TextButton(
                                      style: ButtonStyle(
                                        // foregroundColor: MaterialStateProperty.all(Colors.red),
                                        overlayColor: MaterialStateProperty.all(
                                            Colors.transparent),
                                      ),
                                      onPressed: () {
                                        context.read<RowMemberLeaderCubit>().changedRoleType(RoleType.player);
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
                        BlocBuilder<RowMemberLeaderCubit, RowMemberLeaderState>(
                        builder: (context, state) {
                          return CustomTextField(
                            screenSize: screenSize,
                            text:
                                (isPlayer(context)) ? "Code d'équipe" : "Nom d'équipe",
                            buttonColor: Colors.white,
                            borderColor: Colors.white,
                            controller: teamNameController);
                          },
                        ),
                        isPlayer(context) ? Text(
                          "*Entrez le code d'équipe reçu par mail si vous êtes membre de l'équipe.",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              color: colorTheme,
                              fontSize: 7,
                              fontFamily: "o_spawn_cup_font",
                              fontWeight: FontWeight.normal),
                        ) : Container(),
                        Padding(
                          padding: const EdgeInsets.only(top: 20),
                          child: BlocBuilder<RowMemberLeaderCubit, RowMemberLeaderState>(
                          builder: (context, state) {
                            return CustomButtonTheme(
                            colorButton: colorTheme,
                            colorText: colorBackgroundTheme,
                            screenSize: screenSize,
                            text: "Confirmation",
                            onPressedMethod: () async {
                              await () async {
                                if(isPlayer(context)){
                                  FirebaseHandler().addMemberWithCodeTeam(tournament, teamNameController.text, gamerTagController.text);
                                }
                                if(isLeader(context)){
                                  FirebaseHandler().addTeamInTournament(tournament, Team(name: teamNameController.text), gamerTagController.text);
                                }

                                afterAddMemberTournament();
                                ScaffoldMessenger.of(context).showSnackBar(snackBar);
                              }();
                            },
                          );
                          },
                        ),
                        )
                      ],
                    ),
                  ),
                  const Divider(
                    color: Colors.white,
                    thickness: 1,
                    height: 50,
                  ),
                  BlocBuilder<MemberTournamentFirestoreBloc, MemberTournamentFirestoreState>(
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

  bool isLeader(BuildContext context) => context.read<RowMemberLeaderCubit>().state.roleType == RoleType.leader;

  bool isPlayer(BuildContext context) => context.read<RowMemberLeaderCubit>().state.roleType == RoleType.player;



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


  Hero buildContainerHeader(Size screenSize, Tournament tournament) {
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
            Container(height: screenSize.height * 0.05,),
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
                Expanded(flex: 1,child: Container(color: Colors.green,)),
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
                      icon: SvgPicture.asset(
                        "assets/images/icon_edit.svg",
                        // height: 30,
                        // width: 37,
                      ),
                      onPressed: () => print("modif"),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
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
        (state.listTeam.isNotEmpty)
            ? DataTable(
                columnSpacing: 50,
                border: const TableBorder(
                    horizontalInside: BorderSide(
                        width: 1,
                        color: Color(0xff696969),
                        style: BorderStyle.solid)),
                headingRowHeight: 30,
                columns: [
                  DataColumn(
                      tooltip: "Nom des équipes",
                      label: TextElement(
                        text: "Equipes",
                        color: Colors.white,
                        textAlign: TextAlign.start,
                      )),
                  DataColumn(
                      tooltip: "Place des l'équipes",
                      label: TextElement(
                        text: "Rang",
                        color: Colors.white,
                      )),
                  DataColumn(
                      tooltip: "Kill/Mort/Assistance",
                      label: TextElement(
                        text: "KDA",
                        color: Colors.white,
                      )),
                  DataColumn(
                      tooltip: "Ratio entre les kill,mort et assist",
                      label: TextElement(
                        text: "Ratio",
                        color: Colors.white,
                      )),
                ],
                rows: _createRows(state.listTeam))
            : Padding(
                padding: const EdgeInsets.all(10),
                child: Center(
                    child: TextElement(
                  text: "Il n'y a encore aucune équipe inscrite",
                  color: Colors.white,
                )),
              ),
      ],
    );
  },
);
  }

  _createRows(List<t.Team>? listTeam) {
    List<DataRow> listdata = [];
    if (listTeam!.isNotEmpty) {
      for (var element in listTeam) {
        listdata.add(DataRow(cells: [
          DataCell(TextElement(
            text: element.name,
            color: colorTheme,
          )),
          const DataCell(Text(
            "0",
            style: TextStyle(color: Colors.white),
          )),
          const DataCell(Text(
            "0",
            style: TextStyle(color: Colors.white),
          )),
          const DataCell(Text(
            "0",
            style: TextStyle(color: Colors.white),
          ))
        ]));
      }
      return listdata;
    }
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

// Tournament t = querySnapshot.snapshot.data()!;
// t.listTeam = [
//   Team(name: "name1"),
//   Team(name: "name2"),
//   Team(name: "name3"),
//   Team(name: "name4"),
//   Team(name: "name5"),
// ];
//  print(t.listTeam!.map((e) => e.toJson()));
// tournamentsRef.doc(querySnapshot.snapshot.id).set(t);
