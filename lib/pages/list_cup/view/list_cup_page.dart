import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:o_spawn_cup/models/Tournament/tournament.dart';
import 'package:o_spawn_cup/models/game_name.dart';
import 'package:o_spawn_cup/pages/list_cup/bloc/list_cup_filter_form_bloc.dart';
import 'package:o_spawn_cup/pages/list_cup/cubit/list_cup_cubit.dart';
import 'package:o_spawn_cup/pages/list_cup/view/list_cup_view.dart';
import 'package:o_spawn_cup/repository/tournament_repository.dart';

class ListCupPage extends StatelessWidget {
  GameName gameName;

  Route route() {
    return MaterialPageRoute<void>(builder: (_) => ListCupPage(gameName: gameName,));
  }
  static Page page({required GameName gameName}) => MaterialPage<void>(child: ListCupPage(gameName: gameName,));
  ListCupPage({
    Key? key,
    required this.gameName
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final tournamentRepository = TournamentRepository(tournamentCollectionReference: tournamentsRef);
    final listCupCubit = ListCupCubit(gameName: gameName,tournamentRepository: tournamentRepository);
    return MultiBlocProvider(
  providers: [
    BlocProvider(
      create: (_) => listCupCubit,
    ),
    BlocProvider(
      create: (context) => ListCupFilterFormBloc(listCupCubit: listCupCubit),
    ),
  ],
  child: ListCupView(gameName: gameName),
);
  }
}