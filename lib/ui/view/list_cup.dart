
import "package:flutter/material.dart";
import "package:flutter_bloc/flutter_bloc.dart";
import 'package:o_spawn_cup/bloc/list_tournament_bloc/tournament_bloc.dart';
import "package:o_spawn_cup/ui/CustomsWidgets/custom_app_bar.dart";
import "package:o_spawn_cup/ui/CustomsWidgets/custom_drawer.dart";
import "package:o_spawn_cup/ui/CustomsWidgets/no_data.dart";
import "package:o_spawn_cup/ui/CustomsWidgets/row_tournament_state.dart";
import "package:o_spawn_cup/constant.dart";
import "package:o_spawn_cup/ui/CustomsWidgets/card_cup.dart";
import "package:o_spawn_cup/models/game_name.dart";
import "package:shimmer/shimmer.dart";
import "floating_action_bottom_sheet.dart";

class ListCup extends StatelessWidget {
  GameName gameName;
  ListCup({Key? key,required this.gameName}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => TournamentBloc(gn: gameName)..add(TournamentInitialisation()),
      child: ListCupView(gameName: gameName,),
    );
  }
}
class ListCupView extends StatelessWidget {

  ListCupView({required GameName gameName});


  @override
  Widget build(BuildContext context) {

    GlobalKey<State<FloatingActionBottomSheet>> keyFloating = GlobalKey<State<FloatingActionBottomSheet>>();
    Size screenSize = MediaQuery
        .of(context)
        .size;

    return Scaffold(
      backgroundColor: colorBackgroundTheme,
      drawer: CustomDrawer(screenSize: screenSize),
      appBar: CustomAppBar(title: "TOURNOIS",),
      bottomNavigationBar: _buildBottomAppBar(context),
      body: Container(
        padding: const EdgeInsets.only(left: 20, right: 20, top: 18),
        child: BlocBuilder<TournamentBloc, TournamentState>(
          builder: (context, state) {
            print(state.runtimeType);
            if (state.runtimeType == TournamentError) {
              return NoData(string: "Impossible de charger les tournois !");
            }

            if (state.runtimeType == TournamentLoading) {
              return const ShimmerForLoadData();
            }

            if ((state as TournamentLoaded).tournaments.isEmpty) {
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
                      children: (state as TournamentLoaded).tournaments.map((e) => CardCup(tournament: e)).toList(),
                      //
                    ),
                  )
                ],
              );
            }
          },
        ),
      ),
      floatingActionButton: FloatingActionBottomSheet(
        key: keyFloating,
        onPress: () => context.read<TournamentBloc>().add(TournamentLoad()),
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

