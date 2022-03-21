
import "package:flutter/material.dart";
import "package:flutter_bloc/flutter_bloc.dart";
import "package:o_spawn_cup/constant.dart";


import "package:o_spawn_cup/models/game_name.dart";
import 'package:o_spawn_cup/pages/list_cup/bloc/list_tournament_bloc/list_tournament_bloc.dart';

import '../list_cup.dart';



class ListCupPage extends StatelessWidget {
  GameName gameName;
  Route route() {
    return MaterialPageRoute<void>(builder: (_) => ListCupPage(gameName: gameName,));
  }
  Page page() => MaterialPage<void>(child: ListCupPage(gameName: gameName,));
  ListCupPage({
    Key? key,
    required this.gameName
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    print(gameName.state);
    return BlocProvider(
      create: (_) => ListTournamentBloc(gameName: gameName),
      child: ListCupView(gameName: gameName),
    );
  }
}
class ListCupView extends StatelessWidget {
  GameName gameName;
  ListCupView({required this.gameName});

  @override
  Widget build(BuildContext context) {
    context.read<ListTournamentBloc>().add(TournamentInitialisation(gameName: gameName));
    Size screenSize = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: colorBackgroundTheme,
      endDrawer: CustomDrawer(screenSize: screenSize),
      appBar: CustomAppBar(title: "TOURNOIS",),
      bottomNavigationBar: const BottomBar(),
      body: Container(
        padding: const EdgeInsets.only(left: 20, right: 20, top: 18),
        child: BlocBuilder<ListTournamentBloc, ListTournamentState>(
          builder: (context, state) {
            if (state.runtimeType == TournamentError) {
              return NoData(string: "Impossible de charger les tournois !");
            }

            if (state.runtimeType == TournamentLoading) {
              return const ShimmerLoadCup();
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
}




