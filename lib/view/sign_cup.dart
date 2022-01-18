import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cloud_firestore_odm/cloud_firestore_odm.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/material.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:o_spawn_cup/CustomsWidgets/custom_app_bar.dart';
import 'package:o_spawn_cup/CustomsWidgets/custom_drawer.dart';
import 'package:o_spawn_cup/CustomsWidgets/custom_text_field.dart';

import 'package:o_spawn_cup/model/Team/team.dart';
import 'package:o_spawn_cup/model/Tournament/tournament.dart';

import '../constant.dart';

class SignCup extends StatefulWidget {
  QueryDocumentSnapshot<Tournament?> tournamentSnap;
  SignCup({Key? key, required this.tournamentSnap}) : super(key: key);

  @override
  _SignCupState createState() => _SignCupState();
}

class _SignCupState extends State<SignCup> {
  // late Stream<QuerySnapshot<Object?>> teamList = memberTournamentsRef.reference.where("tournament",isEqualTo: widget.tournament).snapshots();
  // MemberTournamentCollectionReference addressesRef = memberTournamentsRef;
  late TextEditingController gamerTagController;
  TypeMember _typeMember = TypeMember.MembreEquipe;
  @override
  void initState() {
    gamerTagController = TextEditingController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Tournament tournament = widget.tournamentSnap.data()!;
    Size screenSize = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: colorBackgroundTheme,
      drawer: CustomDrawer(screenSize: screenSize),
      appBar: CustomAppBar(
        title: "INSCRIPTION",
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              width: screenSize.width,
              height: screenSize.height * 0.25,
              // color: Colors.orange,
              decoration: BoxDecoration(
                image: DecorationImage(
                  colorFilter: ColorFilter.mode(
                      Colors.black.withOpacity(0.95), BlendMode.dstATop),
                  opacity: 0.31,
                  image:
                      Image.asset("assets/images/forniteBackground.png").image,
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
                        fontFamily: 'o_spawn_cup_font',
                        fontWeight: FontWeight.normal),
                  ),
                  Text(
                    tournament.game.name,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 24,
                      fontFamily: 'o_spawn_cup_font',
                    ),
                  ),
                ],
              ),
            ),
            Container(
              padding: const EdgeInsets.all(15),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Date:",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 22,
                        ),
                      ),
                      Text(
                        tournament.date.toString(),
                        style: TextStyle(
                          color: colorTheme,
                          fontSize: 22,
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 4, bottom: 8),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Nombre de rounds:",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 22,
                          ),
                        ),
                        Text(
                          "${tournament.roundNumber} rounds",
                          style: TextStyle(
                            color: colorTheme,
                            fontSize: 22,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    width: screenSize.width,
                    height: screenSize.height * 0.18,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(13)),
                      image: DecorationImage(
                        opacity: 0.9,
                        image:
                            Image.asset("assets/images/forniteBackground.png")
                                .image,
                        fit: BoxFit.cover,
                      ),
                    ),
                    child: Center(
                      child: Text(
                        "Believer Beach",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 44,
                        ),
                      ),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.only(top: 10),
                    child: Text(
                      "Liste des équipes",
                      style: TextStyle(
                        color: colorTheme,
                        fontSize: 22,
                      ),
                    ),
                  ),
                  FirestoreBuilder<TournamentDocumentSnapshot>(
                      ref: tournamentsRef
                          .doc(widget.tournamentSnap.reference.id),
                      builder: (context,
                          AsyncSnapshot<TournamentDocumentSnapshot> snapshot,
                          Widget? child) {
                        if (snapshot.hasError)
                          return const Center(
                            child: Text(
                              "Impossible de charger les équipes !",
                              style: TextStyle(color: Colors.white),
                            ),
                          );
                        if (!snapshot.hasData)
                          return CircularProgressIndicator();

                        // Access the QuerySnapshot
                        TournamentDocumentSnapshot querySnapshot =
                            snapshot.requireData;
                        print(querySnapshot.data!.listTeam?.length);
                        if (querySnapshot.data!.listTeam?.length != null) {
                          return DataTable(
                              columnSpacing: 50,
                              border: TableBorder(
                                  horizontalInside: BorderSide(
                                      width: 1,
                                      color: Color(0xff696969),
                                      style: BorderStyle.solid)),
                              headingRowHeight: 30,
                              columns: const [
                                DataColumn(
                                    tooltip: "Nom des équipes",
                                    label: Text(
                                      "Equipes",
                                      style: TextStyle(color: Colors.white),
                                      textAlign: TextAlign.start,
                                    )),
                                DataColumn(
                                    tooltip: "Place des l'équipes",
                                    label: Text(
                                      "Rang",
                                      style: TextStyle(color: Colors.white),
                                    )),
                                DataColumn(
                                    tooltip: "Kill/Mort/Assistance",
                                    label: Text(
                                      "KDA",
                                      style: TextStyle(color: Colors.white),
                                    )),
                                DataColumn(
                                    tooltip:
                                        "Ratio entre les kill,mort et assist",
                                    label: Text(
                                      "Ratio",
                                      style: TextStyle(color: Colors.white),
                                    )),
                              ],
                              rows: _createRows(querySnapshot.data?.listTeam));
                          // return Center(child: Text("Il n'y a encore aucune équipe inscritddde"));
                        } else {
                          return Padding(
                            padding: const EdgeInsets.all(10),
                            child: Center(
                                child: Text(
                              "Il n'y a encore aucune équipe inscrite",
                              style: TextStyle(color: Colors.white),
                            )),
                          );
                        }
                      }),
                  Container(
                    padding: const EdgeInsets.only(top: 20),
                    height: screenSize.height * 0.35,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          child: Text(
                            "Inscription au tournois",
                            style: TextStyle(color: colorTheme, fontSize: 20),
                          ),
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
                                    color:
                                        (_typeMember == TypeMember.chefEquipe)
                                            ? colorTheme
                                            : Colors.white,
                                    borderRadius: BorderRadius.only(
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
                                          _typeMember = TypeMember.chefEquipe;
                                        });
                                      },
                                      child: Text(
                                        "Chef d'équipe",
                                        style: TextStyle(
                                            color: colorBackgroundTheme),
                                      )),
                                ),
                              ),
                              VerticalDivider(
                                color: Color(0xff696969),
                                width: 1,
                                thickness: 1,
                                // endIndent: 1,
                              ),
                              Expanded(
                                child: Container(
                                  decoration: BoxDecoration(
                                    color:
                                        (_typeMember == TypeMember.MembreEquipe)
                                            ? colorTheme
                                            : Colors.white,
                                    borderRadius: BorderRadius.only(
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
                                          _typeMember = TypeMember.MembreEquipe;
                                        });
                                      },
                                      child: Text(
                                        "Membre d'équipe",
                                        style: TextStyle(
                                            color: colorBackgroundTheme),
                                      )
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        CustomTextField(
                            screenSize: screenSize,
                            text: "GamerTag",
                            buttonColor: Colors.white,
                            borderColor: Colors.white,
                            controller: gamerTagController),
                      ],
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  _createRows(List<Team>? listTeam) {
    print(listTeam!.length);
    List<DataRow> listdata = [];
    if (listTeam.isNotEmpty) {
      listTeam.forEach((element) {
        listdata.add(DataRow(cells: [
          DataCell(Text(
            element.name,
            style: TextStyle(color: colorTheme),
          )),
          DataCell(Text(
            'Flutter Basics',
            style: TextStyle(color: Colors.white),
          )),
          DataCell(Text(
            'David John',
            style: TextStyle(color: Colors.white),
          )),
          DataCell(Text(
            'David John',
            style: TextStyle(color: Colors.white),
          ))
        ]));
      });
      return listdata;
    } else {
      return DataRow(cells: []);
    }
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
enum TypeMember { chefEquipe, MembreEquipe }
