import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:o_spawn_cup/constant.dart';
import 'package:o_spawn_cup/models/game_name.dart';
import 'package:o_spawn_cup/pages/list_cup/cubit/list_cup_cubit.dart';
import 'package:o_spawn_cup/pages/list_cup/list_cup.dart';

class ListCupView extends StatelessWidget {
  final GameName gameName;
  const ListCupView({Key? key, required this.gameName}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: colorBackgroundTheme,
      endDrawer: const CustomDrawer(),
      appBar: const CustomAppBar(
        title: 'TOURNOIS',
      ),
      bottomNavigationBar: const BottomBar(),
      body: Container(
        padding: const EdgeInsets.only(left: 20, right: 20, top: 18),
        child: BlocBuilder<ListCupCubit, ListCupState>(
          builder: (context, state) {
            if (state.runtimeType == ListCupLoad) {
              return const ShimmerLoadCup();
            }

            if (state.runtimeType == ListCupNoData) {
              return const NoData(string: "Il n'y a aucun tournois !");
            } else {
              final listCup = (state as ListCupLoaded).listCup;

              return Column(
                children: [
                  const RowTournamentState(),
                  Flexible(
                    child: GridView.builder(
                      itemCount: listCup.length,
                      itemBuilder: (BuildContext context, int index) {
                        return CardCup(tournament: listCup[index]);
                      },
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        mainAxisSpacing: 10,
                        crossAxisSpacing: 10,
                        crossAxisCount: 2,
                      ),
                    ),
                  ),
                ],
              );
            }
          },
        ),
      ),
      floatingActionButton: const FloatingActionBottomSheet(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}
