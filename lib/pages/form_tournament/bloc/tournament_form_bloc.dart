import 'dart:async';
import 'dart:io';

import 'package:authentication_repository/authentication_repository.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
import 'package:flutter_form_bloc/flutter_form_bloc.dart';
import 'package:o_spawn_cup/bloc/widget_number_by_player_bloc/widget_number_by_player_bloc.dart';
import 'package:o_spawn_cup/constant.dart';
import 'package:o_spawn_cup/cubit/selected_image_predef_cubit/selected_image_predef_cubit.dart';
import 'package:o_spawn_cup/cubit/take_image_gallery/take_image_gallery_cubit.dart';
import 'package:o_spawn_cup/models/TournamentType/tournament_type.dart';
import 'package:o_spawn_cup/models/game_name.dart';
import 'package:o_spawn_cup/models/server_type.dart';
import 'package:o_spawn_cup/repository/tournament_repository.dart';
import 'package:o_spawn_cup/services/field_bloc_validators_errors_fr.dart';


class TournamentFormBloc extends FormBloc<String, String> {
  final game = InputFieldBloc<GameName, Object>(
    validators: [FieldBlocValidatorsFr.required],
    initialValue: GameName.Fornite,
    name: 'game',
  );
  final nameTournament = TextFieldBloc(validators: [FieldBlocValidatorsFr.required],);
  final gameNumber = TextFieldBloc(validators: [FieldBlocValidatorsFr.required],);
  final signCupDate = InputFieldBloc<DateTime, Object>(
      validators: [FieldBlocValidatorsFr.required],
    initialValue: DateTime(2020,01,01).toUtc(),
    name: "Date des inscriptions",
  );
  // final signTime = InputFieldBloc<TimeOfDay, Object>(
  //   validators: [FieldBlocValidatorsFr.required],
  //   initialValue: TimeOfDay.now(),
  //   name: "Heure des inscriptions",
  // );
  final startCupDate = InputFieldBloc<DateTime, Object>(
    validators: [FieldBlocValidatorsFr.required],
    initialValue: DateTime(2020,01,01,1).toUtc(),
    name: "Date de début",
  );
  final startTime = InputFieldBloc<TimeOfDay, Object>(
    validators: [FieldBlocValidatorsFr.required],
    initialValue: TimeOfDay.now(),
    name: "Heure de début",
  );
  final numberTeam = TextFieldBloc(validators: [FieldBlocValidatorsFr.required,FieldBlocValidatorsFr.numberNot0],);
  final server = SelectFieldBloc(
    validators: [FieldBlocValidatorsFr.required],
    items: ServerType.values.map((e) => e).toList(),
  );

  final numberPlayerByTeam = InputFieldBloc<TournamentType?, Object>(
    validators: [FieldBlocValidatorsFr.required],
    initialValue: null,
    name: 'Nombre de joueur par team',
  );
  final pointPerKill = TextFieldBloc(validators: [FieldBlocValidatorsFr.required],);
  final pointPerRang = TextFieldBloc(validators: [FieldBlocValidatorsFr.required],);
  final pointStart = TextFieldBloc(validators: [FieldBlocValidatorsFr.required],);

  final imageCup = InputFieldBloc<File?, Object>(
    validators: [FieldBlocValidatorsFr.required],
    initialValue: null,
    name: 'Image du tournois',
  );

  late TournamentRepository _tournamentRepository;
  late WidgetNumberByPlayerBloc widgetNumberByPlayerBloc;
  late SelectedImagePredefCubit selectedImagePredefCubit;
  late TakeImageGalleryCubit takeImageGalleryCubit;
  TournamentFormBloc({required TournamentRepository tournamentRepository,
    required this.widgetNumberByPlayerBloc,
    required this.selectedImagePredefCubit,required this.takeImageGalleryCubit}) {
    _tournamentRepository = tournamentRepository;
    addFieldBlocs(step: 0,fieldBlocs: [
      game,
    ]);
    addFieldBlocs(step: 1,fieldBlocs: [
      nameTournament,
      gameNumber,
      signCupDate,
      startCupDate,
      numberPlayerByTeam,
      startTime,
      numberTeam,
      server,
    ]);
    addFieldBlocs(step: 2,fieldBlocs: [
      pointPerKill,
      pointPerRang,
      pointStart,
    ]);
    addFieldBlocs(step: 3,fieldBlocs: [
      imageCup
    ]);
    addFieldBlocs(step: 4,fieldBlocs: [
      imageCup
    ]);
    startCupDate.addValidators([FieldBlocValidatorsFr.dateSupOtherDate(signCupDate)]);
    // numberPlayerByTeam.er;
  }



  numGameChange(String gameNumber){
    print(gameNumber);
    // context
    //     .read<GenerateCodeCubit>()
    //     .numRoundChange(numberRound);

  }

  loadImageTaked(File? imageTaked){
    if (imageTaked != null) {
      selectedImagePredefCubit.clearImgSelect();
      imageCup.updateValue(imageTaked);
    }
  }
  tapOnTileImagepreDef(int index){
    var indexSelect = index;
    selectedImagePredefCubit.changedIndexSelect(index);
    takeImageGalleryCubit.clearPicture();
    if(indexSelect == (selectedImagePredefCubit.state as SelectedImagePredefInitial).indexSelected) {
      imageCup.updateValue(null);
    } else {
      imageCup.updateValue(File(listImagePre[indexSelect].image));
    }
  }
  tapOnNumberPlayerByTeamWidget(int index){
    widgetNumberByPlayerBloc.add(WidgetNumberByPlayerChanging(indexSelect: index));
    if(widgetNumberByPlayerBloc.indexSelected == index){
      numberPlayerByTeam.updateValue(null);
    } else {
      numberPlayerByTeam.updateValue(listTournamentType[index]);
    }
  }

  @override
  void submit() {
    if(state.currentStep == 1){
      if(!numberPlayerByTeam.state.isValid) {
        widgetNumberByPlayerBloc.add(WidgetNumberByPlayerAnimating());
        emitFailure();
      }
    }
    if(state.currentStep == 3){
      if(!imageCup.state.isValid) {
        selectedImagePredefCubit.selectImagePreDefAnimation();
        takeImageGalleryCubit.takeImageAnimation();
        emitFailure();
      }
    }
    super.submit();
  }
  @override
  Future<FutureOr<void>> onSubmitting() async {
    if(state.currentStep == 0){
      emitSuccess();
    } else if(state.currentStep == 1){
      emitSuccess();
    } else if(state.currentStep == 2) {
      emitSuccess();
    } else if(state.currentStep == 3) {
      emitSuccess();
    }


  }
}
