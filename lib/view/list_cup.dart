import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cloud_firestore_odm/cloud_firestore_odm.dart';
import 'package:flutter/material.dart';
import 'package:o_spawn_cup/CustomsWidgets/custom_app_bar.dart';
import 'package:o_spawn_cup/CustomsWidgets/custom_background_around_field.dart';
import 'package:o_spawn_cup/CustomsWidgets/custom_drawer.dart';
import 'package:o_spawn_cup/constant.dart';
import 'package:o_spawn_cup/model/Tournament/tournament.dart';
import 'package:o_spawn_cup/model/TournamentType/tournament_type.dart';
import 'package:o_spawn_cup/CustomsWidgets/card_cup.dart';
import 'package:o_spawn_cup/model/game_name.dart';
import 'package:o_spawn_cup/model/server_type.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:shimmer/shimmer.dart';

import 'floating_action_bottom_sheet.dart';

class ListCup extends StatefulWidget {
  GameName gameName;

  ListCup({Key? key, required this.gameName}) : super(key: key);

  @override
  _ListCupState createState() => _ListCupState();
}

class _ListCupState extends State<ListCup> {
  late SharedPreferences filters;
  late Stream<QuerySnapshot<Object?>> tournamentList = tournamentsRef.reference.orderBy("date",descending: true).where("game",isEqualTo: widget.gameName.name).snapshots();

  @override
  initState() {

    clearPref();
    TournamentType tournamentType;
    // tournamentType = tournamentTypesRef.doc("").select((snapshot) => snapshot.data!.toJson()) as TournamentType;
    // Tournament tournament = Tournament(name: "sdy", date: 20220118, game: GameName.CSGO, server: ServerType.EU, tournamentType: tournamentType, capacity: 50, cashPrize: "cashPrize", roundNumber: 2, killPointTournament: 1);
    super.initState();
  }

  Future<void> clearPref() async {
    filters = await SharedPreferences.getInstance();
    filters.clear();

  }
  @override
  Widget build(BuildContext context) {
    GlobalKey<State<FloatingActionBottomSheet>> keyFloating = GlobalKey<State<FloatingActionBottomSheet>>();
    Size screenSize = MediaQuery.of(context).size;

    return Scaffold(
      drawer: CustomDrawer(screenSize: screenSize),
      appBar: CustomAppBar(
        title: "TOURNOIS",
      ),
      bottomNavigationBar: _buildBottomAppBar(context),
      body: GestureDetector(
        onTap: () {
          // print("aa");
          // print(keyFloating.currentState!.widget.bottomSheetIsShow);
          // if(keyFloating.currentState!.widget.bottomSheetIsShow){
          //   Navigator.of(context).pop();
          // }

        },
        child: Container(
          color: colorBackgroundTheme,
          padding: const EdgeInsets.only(left: 20, right: 20, top: 18),
          child: StreamBuilder(
              stream: tournamentList,
              builder: (context, AsyncSnapshot<QuerySnapshot> snapshot,) {
                if (snapshot.hasError) {
                  return const Center(child: Text("Impossible de charger les tournois !",style: TextStyle(color: Colors.white),),);
                }
                if (!snapshot.hasData) {
                  return Shimmer.fromColors(enabled: true,baseColor: Colors.grey[300]!, highlightColor: Colors.grey[100]!,
                      child: GridView.count(
                        mainAxisSpacing: 10,
                        crossAxisSpacing: 10,
                        crossAxisCount: 2,
                        children: List.generate(8, (index) {
                          return ClipRRect(
                              borderRadius: BorderRadius.circular(22),

                              child: Container(
                                color: Colors.grey,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [],
                                ),
                              )

                          );
                        }),
                      ));
                }

                QuerySnapshot<Tournament?>? querySnapshot = snapshot.requireData as QuerySnapshot<Tournament?>?;
                if(querySnapshot!.docs.isEmpty){
                  return const Center(child: Text("Il n'y a aucun tournois !",style: TextStyle(color: Colors.white),));
                } else {
                  return GridView.count(
                    mainAxisSpacing: 10,
                    crossAxisSpacing: 10,
                    crossAxisCount: 2,
                    children: querySnapshot.docs.map((e) => CardCup(tournamentSnap: e)).toList(),
                    // return Container(child: CardCup(index: index,));
                  );
                }
              }),
        ),
      ),
      floatingActionButton: FloatingActionBottomSheet(
        key: keyFloating,
        functionFilter: loadCup,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }

  loadCup() async {
    String? name = filters.getString("tournamentName");

    String? state = filters.getString("tournamentState");

    if(state == "null") {
      state = "";
    }
    String? type = filters.getString("tournamentType");
    if(type == "null") {
      type = "";
    }

    String? dateDay = filters.getString("day");
    String? dateMonth = filters.getString("month");
    String? dateYears = filters.getString("years");
    String date = dateYears! + dateMonth! + dateDay!;
    // int? capacity = filters.getInt("date");

    // print("iiui");
    print(name);
    print(date);
    print(type);

    print(state);
    print(widget.gameName);
    setState(() {
      tournamentList = tournamentsRef.reference
          .where("game",isEqualTo: widget.gameName.name)
          .where("name",isEqualTo: (name == "") ? null : name)
          .where("date",isGreaterThanOrEqualTo:  (date == "") ? null : int.parse(date))
          .where("state",isEqualTo: (state == "") ? null : state)
          .where("tournamentType.name",isEqualTo: (type == "") ? null : type)
          .orderBy("date",descending: true)
          .snapshots();

          // .where("tournamentType.capacityTeam",isEqualTo: 2) as TournamentQuery;
      // tournamentList = tournamentsRef.orderByDate(descending: false).whereDate(isEqualTo: date).whereName(isEqualTo: name).w;
    });

  }

  BottomAppBar _buildBottomAppBar(BuildContext context) {
    return BottomAppBar(
      // shape: const CircularNotchedRectangle(),
      color: colorTheme,
      child: Row(
        children: <Widget>[
          Container(
            height: 25,
          )
        ],
      ),
    );
  }
}



