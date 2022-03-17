import "package:flutter/cupertino.dart";
import "package:flutter/material.dart";
import "package:flutter_bloc/flutter_bloc.dart";
import 'package:o_spawn_cup/bloc/form_tournament_step_2_bloc/form_tournament_step_2_bloc.dart';

import "package:o_spawn_cup/bloc/form_tournament_step_3_bloc/form_tournament_step_3_bloc.dart";
import 'package:o_spawn_cup/bloc/form_tournament_step_4_bloc/form_tournament_step_4_bloc.dart';
import "package:o_spawn_cup/bloc/select_game_bloc/select_game_bloc.dart";
import "package:o_spawn_cup/bloc/step_by_step_widget_bloc/step_by_step_widget_bloc.dart";
import "package:o_spawn_cup/bloc/widget_number_by_player_bloc/widget_number_by_player_bloc.dart";
import "package:o_spawn_cup/cubit/generate_code_cubit/generate_code_cubit.dart";
import "package:o_spawn_cup/cubit/list_cash_prizes_cubit.dart";
import "package:o_spawn_cup/cubit/selected_image_predef_cubit/selected_image_predef_cubit.dart";
import "package:o_spawn_cup/cubit/take_image_gallery/take_image_gallery_cubit.dart";

import "package:o_spawn_cup/models/Tournament/tournament.dart";
import "package:o_spawn_cup/constant.dart";
import 'package:o_spawn_cup/pages/form_tournament/view/form_tournament_view.dart';


class FormTournament extends StatelessWidget {

  Route route() {
    return MaterialPageRoute<void>(builder: (_) => FormTournament(tournament: tournament,));
  }
  Tournament? tournament;
  FormTournament({
    Key? key,
    required this.tournament
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) =>
              SelectGameBloc(listGameName: listCardGame, initialIndex: 1.0),
        ),
        BlocProvider(
          create: (_) =>
              StepByStepWidgetBloc(initialIndex: 0, initialIndexMax: 5),
        ),
        BlocProvider(
          create: (_) => WidgetNumberByPlayerBloc(),
        ),
        BlocProvider(
          create: (_) => SelectedImagePredefCubit(),
        ),
        BlocProvider(
          create: (_) => GenerateCodeCubit(),
        ),
        BlocProvider(
          create: (_) => TakeImageGalleryCubit(),
        ),
        BlocProvider(
          create: (_) => FormTournamentStep2Bloc(),
        ),
        BlocProvider(
          create: (_) => FormTournamentStep3Bloc(),
        ),
        BlocProvider(
          create: (_) => FormTournamentStep4Bloc(),
        ),
        BlocProvider(
          create: (_) => ListCashPrizesCubit(listCashPrizes: []),
        ),
      ],
      child: FormTournamentView(tournament: tournament),
    );
  }
}
