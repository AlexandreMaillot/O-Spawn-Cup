import "package:cloud_firestore/cloud_firestore.dart";
import "package:cloud_firestore_odm/cloud_firestore_odm.dart";
import "package:flutter/material.dart";
import 'package:o_spawn_cup/bloc/bloc_list_cup.dart';
import 'package:o_spawn_cup/bloc/bloc_provider.dart';
import "package:o_spawn_cup/ui/CustomsWidgets/custom_app_bar.dart";
import "package:o_spawn_cup/ui/CustomsWidgets/custom_background_around_field.dart";
import "package:o_spawn_cup/ui/CustomsWidgets/custom_drawer.dart";
import 'package:o_spawn_cup/ui/CustomsWidgets/no_data.dart';
import 'package:o_spawn_cup/ui/CustomsWidgets/row_tournament_state.dart';
import "package:o_spawn_cup/ui/CustomsWidgets/text_element.dart";
import "package:o_spawn_cup/constant.dart";
import "package:o_spawn_cup/models/Tournament/tournament.dart";
import "package:o_spawn_cup/models/TournamentType/tournament_type.dart";
import "package:o_spawn_cup/ui/CustomsWidgets/card_cup.dart";
import "package:o_spawn_cup/models/game_name.dart";
import "package:o_spawn_cup/models/server_type.dart";
import "package:shared_preferences/shared_preferences.dart";
import "package:shimmer/shimmer.dart";

import "floating_action_bottom_sheet.dart";


class ListCup extends StatelessWidget {

  ListCup({required GameName gameName});


  @override
  Widget build(BuildContext context) {

    final bloc = BlocProvider.of<BlocListCup>(context);

    GlobalKey<State<FloatingActionBottomSheet>> keyFloating = GlobalKey<State<FloatingActionBottomSheet>>();
    Size screenSize = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: colorBackgroundTheme,
      drawer: CustomDrawer(screenSize: screenSize),
      appBar: CustomAppBar(title: "TOURNOIS",),
      bottomNavigationBar: _buildBottomAppBar(context),
      body: Container(
        padding: const EdgeInsets.only(left: 20, right: 20, top: 18),
        child: StreamBuilder<List<Tournament>>(
            stream: bloc.stream,
            builder: (context,AsyncSnapshot<List<Tournament>> snapshot,) {
              if (snapshot.hasError) {
                return NoData(string: "Impossible de charger les tournois !");
               }
              if (!snapshot.hasData) {
                return const ShimmerForLoadData();
              }

              // QuerySnapshot<Tournament?>? querySnapshot =
              //     snapshot.requireData as QuerySnapshot<Tournament?>?;

              if (snapshot.data!.isEmpty) {
                return NoData(string: "Il n'y a aucun tournois !");
              } else {
                return Column(
                  children: [
                    const RowTournamentState(),
                    Flexible(
                      child: GridView.count(
                        mainAxisSpacing: 10,
                        crossAxisSpacing: 10,
                        crossAxisCount: 2,
                        children: snapshot.data!.map((e) => CardCup(tournament: e)).toList(),
                        //
                      ),
                    )
                  ],
                );
              }
            }),
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
      child: Container(height: 25,),
    );
  }
}

class ShimmerForLoadData extends StatelessWidget {
  const ShimmerForLoadData({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
        enabled: true,
        baseColor: Colors.grey[300]!,
        highlightColor: Colors.grey[100]!,
        child: Column(
          children: [
            const RowTournamentState(),
            Flexible(
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
                          crossAxisAlignment:
                              CrossAxisAlignment.center,
                          mainAxisAlignment:
                              MainAxisAlignment.center,
                        ),
                      ));
                }),
              ),
            ),
          ],
        ));
  }
}


