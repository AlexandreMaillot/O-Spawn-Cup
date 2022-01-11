import 'package:cloud_firestore_odm/cloud_firestore_odm.dart';
import 'package:flutter/material.dart';
import 'package:o_spawn_cup/CustomsWidgets/custom_app_bar.dart';
import 'package:o_spawn_cup/CustomsWidgets/custom_background_around_field.dart';
import 'package:o_spawn_cup/CustomsWidgets/custom_drawer.dart';
import 'package:o_spawn_cup/constant.dart';
import 'package:o_spawn_cup/model/TournamentType/tournament_type.dart';
import 'package:o_spawn_cup/model/card_cup.dart';
import 'package:o_spawn_cup/model/game_name.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'floating_action_bottom_sheet.dart';

class ListCup extends StatefulWidget {
  GameName gameName;

  ListCup({Key? key, required this.gameName}) : super(key: key);

  @override
  _ListCupState createState() => _ListCupState();
}

class _ListCupState extends State<ListCup> {
  late SharedPreferences filters;
  @override
  void initState() {
    clearPref();
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
          child: FirestoreBuilder<TournamentTypeQuerySnapshot>(
              ref: tournamentTypesRef.orderByCapacityTeam(),
              builder: (context, AsyncSnapshot<TournamentTypeQuerySnapshot> snapshot,
                  Widget? child) {
                if (snapshot.hasError) {
                  return BackgroundAroundField(
                    screenSize: screenSize,
                    child: const Center(child: Text("Erreur de chargement")),
                  );
                }
                if (!snapshot.hasData) {
                  return BackgroundAroundField(
                      screenSize: screenSize,
                      child: const Center(child: Text("Chargement...")));
                }

                TournamentTypeQuerySnapshot querySnapshot = snapshot.requireData;
                return GridView.count(
                  crossAxisCount: 2,
                  children: List.generate(100, (index) {

                    return Container(child: CardCup(index: index,));
                  }),
                );
              }),
        ),
      ),
      floatingActionButton: FloatingActionBottomSheet(
        key: keyFloating,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
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



