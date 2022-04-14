import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:o_spawn_cup/bloc/select_game_bloc/select_game_bloc.dart';
import 'package:o_spawn_cup/bloc/step_by_step_widget_bloc/step_by_step_widget_bloc.dart';
import 'package:o_spawn_cup/bloc/widget_number_by_player_bloc/widget_number_by_player_bloc.dart';
import 'package:o_spawn_cup/cubit/generate_code_cubit/generate_code_cubit.dart';
import 'package:o_spawn_cup/models/Tournament/tournament.dart';
import 'package:o_spawn_cup/constant.dart';
import 'package:o_spawn_cup/pages/form_tournament/bloc/tournament_form_bloc.dart';
import 'package:o_spawn_cup/pages/form_tournament/cubit/list_cash_prize/list_cash_prizes_cubit.dart';
import 'package:o_spawn_cup/pages/form_tournament/cubit/selected_image_predef_cubit/selected_image_predef_cubit.dart';
import 'package:o_spawn_cup/pages/form_tournament/cubit/take_image_gallery/take_image_gallery_cubit.dart';
import 'package:o_spawn_cup/pages/form_tournament/view/form_tournament_view.dart';
import 'package:o_spawn_cup/repository/firestorage_service.dart';
import 'package:o_spawn_cup/repository/tournament_repository.dart';


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
    var  widgetNumberByPlayerBloc = WidgetNumberByPlayerBloc();
    var  takeImageGalleryCubit = TakeImageGalleryCubit();
    var  selectedImagePredefCubit = SelectedImagePredefCubit();
    var  generateCodeCubit = GenerateCodeCubit();

    var  selectGameBloc = SelectGameBloc(listGameName: listCardGame, initialIndex: 1.0);
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) => selectGameBloc,
        ),
        BlocProvider(
          create: (_) =>
              StepByStepWidgetBloc(initialIndex: 0, initialIndexMax: 5),
        ),
        BlocProvider(
          create: (_) => widgetNumberByPlayerBloc,
        ),
        BlocProvider(
          create: (_) => selectedImagePredefCubit,
        ),
        BlocProvider(
          create: (_) => generateCodeCubit,
        ),
        BlocProvider(
          create: (_) => takeImageGalleryCubit,
        ),

        BlocProvider(
          create: (_) => ListCashPrizesCubit(listCashPrizes: []),
        ),
        BlocProvider(
          create: (_) => TournamentFormBloc(
              tournamentRepository: TournamentRepository(tournamentCollectionReference: TournamentCollectionReference()),
            widgetNumberByPlayerBloc: widgetNumberByPlayerBloc,
              takeImageGalleryCubit: takeImageGalleryCubit,
            selectedImagePredefCubit: selectedImagePredefCubit,
            generateCodeCubit: generateCodeCubit,
            selectGameBloc: selectGameBloc,
            tournament: tournament,
            firestorageService: FirestorageService(firebaseStorage: FirebaseStorage.instance),
          ),
        ),
      ],
      child: FormTournamentView(tournament: tournament),
    );
  }
}
