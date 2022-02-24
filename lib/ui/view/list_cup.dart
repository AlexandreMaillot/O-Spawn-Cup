
import "package:flutter/material.dart";
import "package:flutter_bloc/flutter_bloc.dart";
import 'package:o_spawn_cup/bloc/list_tournament_bloc/list_tournament_bloc.dart';
import "package:o_spawn_cup/ui/CustomsWidgets/custom_app_bar.dart";
import "package:o_spawn_cup/ui/CustomsWidgets/custom_drawer.dart";
import "package:o_spawn_cup/ui/CustomsWidgets/no_data.dart";
import "package:o_spawn_cup/ui/CustomsWidgets/row_tournament_state.dart";
import "package:o_spawn_cup/constant.dart";
import "package:o_spawn_cup/ui/CustomsWidgets/card_cup.dart";
import "package:o_spawn_cup/models/game_name.dart";
import "package:shimmer/shimmer.dart";
import '../../cubit/member_bloc/member_cubit.dart';
import "floating_action_bottom_sheet.dart";


class ListCup extends StatelessWidget {
  GameName gameName;
  ListCup({required this.gameName});

  @override
  Widget build(BuildContext context) {
    context.read<ListTournamentBloc>().add(TournamentInitialisation(gameName: gameName));
    Size screenSize = MediaQuery
        .of(context)
        .size;

    return Scaffold(
      backgroundColor: colorBackgroundTheme,
      endDrawer: CustomDrawer(screenSize: screenSize),
      appBar: CustomAppBar(title: "TOURNOIS",),
      bottomNavigationBar: _buildBottomAppBar(context),
      body: Container(
        padding: const EdgeInsets.only(left: 20, right: 20, top: 18),
        child: BlocBuilder<ListTournamentBloc, ListTournamentState>(
          builder: (context, state) {
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
                    child: GridView.builder(
                      itemCount: state.tournaments.length,
                      itemBuilder: (BuildContext context, int index) {
                        return CardCup(tournament: state.tournaments[index]) ;
                      },
                      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                        mainAxisSpacing: 10,
                        crossAxisSpacing: 10,
                        crossAxisCount: 2,
                      ),
                    ),
                  )
                ],
              );
            }
          },
        ),
      ),
      floatingActionButton: FloatingActionBottomSheet(),
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


