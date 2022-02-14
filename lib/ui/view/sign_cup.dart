import "package:cloud_firestore/cloud_firestore.dart";
import "package:cloud_firestore_odm/cloud_firestore_odm.dart";
import "package:dotted_border/dotted_border.dart";
import "package:dotted_line/dotted_line.dart";
import "package:flutter/material.dart";
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import "package:flutter_switch/flutter_switch.dart";
import "package:mailer/mailer.dart";
import "package:mailer/smtp_server.dart";
import "package:mailer/smtp_server/gmail.dart";
import 'package:o_spawn_cup/bloc/member_tournament_firestore_bloc/member_tournament_firestore_bloc.dart';
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


class SignCup extends StatelessWidget {
  Tournament tournament;
  SignCup({Key? key,required this.tournament}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => MemberTournamentFirestoreBloc(tournament: tournament),
      child: SignCupView(tournament: tournament,),
    );
  }
}
class SignCupView extends StatelessWidget {
  SignCupView({Key? key, required this.tournament}) : super(key: key);
  late TextEditingController gamerTagController;
  late TextEditingController teamNameController;
  late Tournament tournament;
  late String years;
  late String month;
  late String day;
  late String date;
  String msgSnack = "Inscription validée !";
  bool errorSign = false;
  String teamNameTextFieldHint = "Nom d'équipe";
  RoleType _roleType = RoleType.leader;

  @override
  Widget build(BuildContext context) {
    gamerTagController = TextEditingController();
    teamNameController = TextEditingController();
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
                  rowInformationTournament(
                      leftText: "Nombre d'équipe:",
                      rightText: tournament.capacity.toString()),
                  rowInformationTournament(
                      leftText: "Place restantes:",
                      rightText:
                          (tournament.capacity - tournament.listTeam.length)
                              .toString()),
                  Padding(
                    padding: const EdgeInsets.only(top: 20.0),
                    child: buildContainerMap(screenSize),
                  ),
                  Container(
                    padding: const EdgeInsets.only(top: 20),
                    height: screenSize.height * 0.35,
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
                        Container(
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
                                child: Container(
                                  decoration: BoxDecoration(
                                    color: (isLeader())
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
                                        _roleType = RoleType.leader;
                                      },
                                      child: TextElement(
                                        text: "Chef d'équipe",
                                      )),
                                ),
                              ),
                              const VerticalDivider(
                                color: Color(0xff696969),
                                width: 1,
                                thickness: 1,
                                // endIndent: 1,
                              ),
                              Expanded(
                                child: Container(
                                  decoration: BoxDecoration(
                                    color: (isPlayer())
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
                                        _roleType = RoleType.player;
                                      },
                                      child: TextElement(
                                        text: "Membre d'équipe",
                                      )),
                                ),
                              ),
                            ],
                          ),
                        ),
                        CustomTextField(
                            screenSize: screenSize,
                            text:
                                (isPlayer()) ? "Code d'équipe" : "Nom d'équipe",
                            buttonColor: Colors.white,
                            borderColor: Colors.white,
                            controller: teamNameController),
                        Padding(
                          padding: const EdgeInsets.only(top: 20),
                          child: CustomButtonTheme(
                            colorButton: colorTheme,
                            colorText: colorBackgroundTheme,
                            screenSize: screenSize,
                            text: "Confirmation",
                            onPressedMethod: () async {
                              await () async {
                                context.read<MemberTournamentFirestoreBloc>().add(MemberTournamentFirestoreAdd(teamName: teamNameController.text, gamerTag: gamerTagController.text, roleType: _roleType));
                                // msgSnack = "Veuillez renseigner le gamerTag et nom/code de team !";
                                // errorSign = true;
                                afterAddMemberTournament();
                                ScaffoldMessenger.of(context).showSnackBar(snackBar);
                              }();
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
                  buildListTeam(),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Future<void> sendEmailMessage() async {
    SmtpServer smtpServer = paramEmail();
    Message message = createMessage();

    await showReport(message, smtpServer);
  }

  SmtpServer paramEmail() {
    String username = "tamoro974@gmail.com";
    String token = "fftvuferdeyhpqqh";
    // String password = 'AIzaSyC67O8S6jcsHAnV0ursdHN2gTcjeaj76wA';
    // String password = 'fgmpfizenmfzmdlb';

    final smtpServer = gmail(username, token);
    return smtpServer;
  }

  Message createMessage() {
    final message = Message()
      ..from = Address("contact@o-spawn.re", "O-Spawn")
      ..recipients.add("alexandre.maillot97@gmail.com")
      ..ccRecipients.addAll(["destCc1@example.com", "destCc2@example.com"])
      ..bccRecipients.add(Address("bccAddress@example.com"))
      ..subject = "Test Dart Mailer library :: 😀 :: ${DateTime.now()}"
      ..text = "This is the plain text.\nThis is line 2 of the text part."
      ..html = "<h1>Test</h1>\n<p>Hey! Here's some HTML content</p>";
    return message;
  }

  Future<void> showReport(Message message, SmtpServer smtpServer) async {
    try {
      final sendReport = await send(message, smtpServer);
      print("Message sent: " + sendReport.toString());
    } on MailerException catch (e) {
      print("$e Message not sent.");
      for (var p in e.problems) {
        print("Problem: ${p.code}: ${p.msg}");
      }
    }
  }

  Member addMember() {
    var rng = Random();
    Member member =
        Member(pseudo: "Tama" + rng.nextInt(100).toString(), uid: "ffsq");
    return member;
  }

  Future<void> addMemberTournament(Member member, t.Team team) async {
    Mt.MemberTournament memberTournament = Mt.MemberTournament(
        member: member,
        tournament: tournament,
        gamerTag: gamerTagController.text,
        role: _roleType,
        team: team);
    Mt.memberTournamentsRef.add(memberTournament);
  }

  void afterAddMemberTournament() {
    msgSnack = "Inscription validée !";
    errorSign = false;
    teamNameController.text = "";
    gamerTagController.text = "";
  }

  bool isPlayer() => _roleType == RoleType.player;

  bool isLeader() => _roleType == RoleType.leader;

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
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Container(
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

  Column buildListTeam() {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.only(top: 5, bottom: 10),
          child: SubtitleElement(
            text: "Liste des équipes",
            color: colorTheme,
          ),
        ),
        (tournament.listTeam.isNotEmpty)
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
                rows: _createRows(tournament.listTeam))
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
