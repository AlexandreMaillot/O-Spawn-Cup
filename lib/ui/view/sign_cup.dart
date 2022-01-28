import "package:cloud_firestore/cloud_firestore.dart";
import "package:cloud_firestore_odm/cloud_firestore_odm.dart";
import "package:dotted_border/dotted_border.dart";
import "package:dotted_line/dotted_line.dart";
import "package:flutter/material.dart";
import "package:flutter_switch/flutter_switch.dart";
import "package:mailer/mailer.dart";
import "package:mailer/smtp_server.dart";
import "package:mailer/smtp_server/gmail.dart";
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



class SignCup extends StatefulWidget {
  Tournament tournament;
  SignCup({Key? key, required this.tournament}) : super(key: key);

  @override
  _SignCupState createState() => _SignCupState();
}

class _SignCupState extends State<SignCup> {
  // late Stream<QuerySnapshot<Object?>> teamList = memberTournamentsRef.reference.where("tournament",isEqualTo: widget.tournament).snapshots();
  // MemberTournamentCollectionReference addressesRef = memberTournamentsRef;
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
  RoleType _roleType = RoleType.player;
  @override
  void initState() {
    gamerTagController = TextEditingController();
    teamNameController = TextEditingController();
    tournament = widget.tournamentSnap.data()!;
    years = tournament.date.toString().substring(0, 4);
    month = tournament.date.toString().substring(4, 6);
    day = tournament.date.toString().substring(6, 8);
    date = day + "/" + month + "/" + years;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;


    var snackBar = SnackBar(
      content: Text(msgSnack),
      duration: const Duration(seconds: 3),
      backgroundColor: (errorSign == false) ? Colors.green : Colors.red ,
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
                  rowDate(date: date),
                  rowRoundNumber(tournament: tournament),
                  rowTournamentType(tournament: tournament),
                  buildContainerMap(screenSize),
                  Container(
                    padding: const EdgeInsets.only(top: 20),
                    height: screenSize.height * 0.35,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
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
                                        setState(() {
                                          _roleType = RoleType.leader;
                                        });
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
                                        setState(() {
                                          _roleType = RoleType.player;
                                        });
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

                                // await sendEmailMessage();
                                if(teamNameController.text != "" && gamerTagController.text != "") {
                                  Member member = addMember();

                                  t.Team? team;
                                  if (isLeader()) {
                                    team = await verifTeamName(team);
                                    if (team != null) {
                                      // print(getRandomString(5));
                                      team.teamCode = getRandomString(5);
                                      tournament.listTeam.add(team);
                                      await tournamentsRef
                                          .doc(widget.tournamentSnap.id)
                                          .set(tournament);
                                    }
                                  } else if (isPlayer()) {
                                    team = await verifCodeTeam(team);
                                  }
                                  if (team != null) {
                                    await addMemberTournament(member, team);
                                    afterAddMemberTournament();
                                  }
                                } else {
                                  msgSnack = "Veuillez renseigner le gamerTag et nom/code de team !";
                                  errorSign = true;
                                }

                                ScaffoldMessenger.of(context).showSnackBar(snackBar);
                              }();
                              // print(tournament.listTeam?.length);
                            },
                          ),
                        )
                      ],
                    ),
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
    // Use the SmtpServer class to configure an SMTP server:
    // final smtpServer = SmtpServer('smtp.domain.com');
    // See the named arguments of SmtpServer for further configuration
    // options.

    // Create our message.
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

  final String _chars =
      "AaBbCcDdEeFfGgHhIiJjKkLlMmNnOoPpQqRrSsTtUuVvWwXxYyZz1234567890";
  final Random _rnd = Random();
  String getRandomString(int length) {
    return widget.tournamentSnap.id.substring(0, 5) +
        String.fromCharCodes(Iterable.generate(
            length, (_) => _chars.codeUnitAt(_rnd.nextInt(_chars.length))));
  }

  Member addMember() {
    var rng = Random();
    Member member =
        Member(pseudo: "Tama" + rng.nextInt(100).toString(), uid: "ffsq");
    membersRef.add(member);
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

  Future<t.Team?> verifCodeTeam(t.Team? team) async {
    TournamentDocumentSnapshot teamQuery =
        await tournamentsRef.doc(widget.tournamentSnap.id).get();
    Iterable<t.Team>? teamList = teamQuery.data?.listTeam
        .where((element) => element.teamCode == teamNameController.text);
    if (teamList!.isNotEmpty) {
      team = teamList.first;
    } else {
      msgSnack = "Le code équipe n'existe pas !";
      errorSign = true;
    }
    return team;
  }

  Future<t.Team?> verifTeamName(t.Team? team) async {
    team = await (t.Team? team) async {
      TournamentDocumentSnapshot teamQuery =
          await tournamentsRef.doc(widget.tournamentSnap.id).get();
      Iterable<t.Team>? teamList = teamQuery.data?.listTeam
          .where((element) => element.name == teamNameController.text);
      if (teamList!.isEmpty) {
        team = t.Team(name: teamNameController.text);
        t.teamsRef.add(team);
      } else {
        msgSnack = "Le nom de cette team existe déjà !";
        errorSign = true;
      }
      return team;
    }(team);
    return team;
  }

  bool isPlayer() => _roleType == RoleType.player;

  bool isLeader() => _roleType == RoleType.leader;

  Hero buildContainerHeader(Size screenSize, Tournament tournament) {
    return Hero(
      tag: "tagcard_cup_${widget.tournamentSnap.id}",
      child: Container(
        width: screenSize.width,
        height: screenSize.height * 0.25,
        // color: Colors.orange,
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: (widget.tournamentSnap.data()!.state ==
                      TournamentState.incriptionOuverte)
                  ? colorOpen
                  : (widget.tournamentSnap.data()!.state ==
                          TournamentState.enCours)
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
            image: Image.network(tournament.image!).image,
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
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
          padding: const EdgeInsets.only(top: 15, bottom: 10),
          child: SubtitleElement(
            text: "Liste des équipes",
            color: colorTheme,
          ),
        ),
        FirestoreBuilder<TournamentDocumentSnapshot>(
            ref: tournamentsRef.doc(widget.tournamentSnap.reference.id),
            builder: (context,
                AsyncSnapshot<TournamentDocumentSnapshot> snapshot,
                Widget? child) {
              if (snapshot.hasError) {
                return const Center(
                  child: Text(
                    "Impossible de charger les équipes !",
                    style: TextStyle(color: Colors.white),
                  ),
                );
              }
              if (!snapshot.hasData) {
                return const CircularProgressIndicator();
              }

              // Access the QuerySnapshot
              TournamentDocumentSnapshot querySnapshot = snapshot.requireData;
              tournament = querySnapshot.data!;
              ;
              if (querySnapshot.data!.listTeam.isNotEmpty) {
                return DataTable(
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
                    rows: _createRows(querySnapshot.data?.listTeam));
                // return Center(child: Text("Il n'y a encore aucune équipe inscritddde"));
              } else {
                return Padding(
                  padding: const EdgeInsets.all(10),
                  child: Center(
                      child: TextElement(
                    text: "Il n'y a encore aucune équipe inscrite",
                    color: Colors.white,
                  )),
                );
              }
            }),
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

class rowTournamentType extends StatelessWidget {
  const rowTournamentType({
    Key? key,
    required this.tournament,
  }) : super(key: key);

  final Tournament tournament;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          TextElement(
            text: "Type de tournois:",
            color: Colors.white,
          ),
          TextElement(
            text: tournament.tournamentType.name,
            color: colorTheme,
          ),
        ],
      ),
    );
  }
}

class rowDate extends StatelessWidget {
  const rowDate({
    Key? key,
    required this.date,
  }) : super(key: key);

  final String date;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        TextElement(
          text: "Date:",
          color: Colors.white,
        ),
        TextElement(
          text: date,
          color: colorTheme,
        ),
      ],
    );
  }
}

class rowRoundNumber extends StatelessWidget {
  const rowRoundNumber({
    Key? key,
    required this.tournament,
  }) : super(key: key);

  final Tournament tournament;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 4, bottom: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          TextElement(
            text: "Nombre de rounds:",
            color: Colors.white,
          ),
          TextElement(
            text: "${tournament.roundNumber} rounds",
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
