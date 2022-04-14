import 'dart:async';
import 'dart:io';

import 'package:authentication_repository/authentication_repository.dart';
import 'package:bloc/bloc.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
import 'package:flutter_form_bloc/flutter_form_bloc.dart';
import 'package:o_spawn_cup/bloc/select_game_bloc/select_game_bloc.dart';
import 'package:o_spawn_cup/bloc/widget_number_by_player_bloc/widget_number_by_player_bloc.dart';
import 'package:o_spawn_cup/constant.dart';
import 'package:o_spawn_cup/cubit/generate_code_cubit/generate_code_cubit.dart';
import 'package:o_spawn_cup/models/Tournament/tournament.dart';
import 'package:o_spawn_cup/models/TournamentType/tournament_type.dart';
import 'package:o_spawn_cup/models/game_name.dart';
import 'package:o_spawn_cup/models/server_type.dart';
import 'package:o_spawn_cup/pages/form_tournament/cubit/selected_image_predef_cubit/selected_image_predef_cubit.dart';
import 'package:o_spawn_cup/pages/form_tournament/cubit/take_image_gallery/take_image_gallery_cubit.dart';
import 'package:o_spawn_cup/pages/form_tournament/form_tournament.dart';
import 'package:o_spawn_cup/repository/firestorage_service.dart';
import 'package:o_spawn_cup/repository/tournament_repository.dart';
import 'package:o_spawn_cup/services/field_bloc_validators_errors_fr.dart';


class TournamentFormBloc extends FormBloc<String, String> {
  final game = InputFieldBloc<GameName, Object>(
    validators: [FieldBlocValidatorsFr.required],
    initialValue: GameName.Fornite,
    name: 'game',
  );
  bool takeByCamera = false;
  final nameTournament = TextFieldBloc(validators: [FieldBlocValidatorsFr.required],);
  final gameNumber = TextFieldBloc(validators: [FieldBlocValidatorsFr.required],);
  final signCupDate = InputFieldBloc<DateTime, Object>(
      validators: [FieldBlocValidatorsFr.required],
    initialValue: DateTime(2020,01,01).toUtc(),
    name: 'Date des inscriptions',
  );

  final startCupDate = InputFieldBloc<DateTime, Object>(
    validators: [FieldBlocValidatorsFr.required],
    initialValue: DateTime(2020,01,01,1).toUtc(),
    name: 'Date de début',
  );
  final startTime = InputFieldBloc<TimeOfDay, Object>(
    validators: [FieldBlocValidatorsFr.required],
    initialValue: TimeOfDay.now(),
    name: 'Heure de début',
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

  final listCashPrize = InputFieldBloc<List<String>, Object>(
    validators: [],
    initialValue: [],
    name: 'Liste cash prize',
  );
  final listCode = ListFieldBloc<TextFieldBloc,dynamic>(name: 'listCode',);

  late TournamentRepository _tournamentRepository;
  late WidgetNumberByPlayerBloc widgetNumberByPlayerBloc;
  late SelectedImagePredefCubit selectedImagePredefCubit;
  late TakeImageGalleryCubit takeImageGalleryCubit;
  late GenerateCodeCubit generateCodeCubit;
  late SelectGameBloc selectGameBloc;
  late FirestorageService firestorageService;
  PageController pageController = PageController(viewportFraction: 0.5, initialPage: 1,keepPage: false);
  Tournament? tournament;
  TournamentFormBloc({required TournamentRepository tournamentRepository,
    required this.widgetNumberByPlayerBloc,
    required this.selectedImagePredefCubit,
    required this.takeImageGalleryCubit,
    required this.selectGameBloc,
  required this.generateCodeCubit,
  required this.tournament,
  required this.firestorageService
  }) {

    initCup(tournament: tournament);
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
      listCashPrize,
    ]);
    listCode.addFieldBloc(TextFieldBloc(validators: [FieldBlocValidatorsFr.required],initialValue: "init"));
    addFieldBlocs(step: 5,fieldBlocs: [
      listCode,
    ]);
    startCupDate.addValidators([FieldBlocValidatorsFr.dateSupOtherDate(signCupDate)]);
  }


  generateCode() {
    String beforeCode = DateTime.now().millisecond.toString() + DateTime.now().microsecond.toString();
    return generateCodeCubit.generateCode(beforeCode, 5);
  }
  changeCode(int index){
    listCode.value[index].updateValue(generateCode());
  }
  initCodeWidget(){
    listCode.value.clear();
      for(int numberCode = 0;numberCode <= int.parse(gameNumber.value); numberCode++) {
        listCode.addFieldBloc(TextFieldBloc(validators: [FieldBlocValidatorsFr.required],initialValue: generateCode()));
      }
  }
  addCashPrize(String value){
    if(value != '') {
      listCashPrize.value.add(value);
    }
  }
  modifCashPrize(int index, String value){
    if(value != '' && listCashPrize.value[index] != value) {

      listCashPrize.value[index] = value;
    }
  }
  deleteCashPrize(int index){
    listCashPrize.value.removeAt(index);
  }

  loadImageTaked(File? imageTaked){
    if (imageTaked != null) {
      selectedImagePredefCubit.clearImgSelect();
      imageCup.updateValue(imageTaked);
      takeByCamera = true;
    }
  }

  takePictureInGallery(){
    takeImageGalleryCubit.takePicture();
    takeByCamera = true;
  }
  tapOnTileImagepreDef(int index){
    takeImageGalleryCubit.clearPicture();
    if(index == (selectedImagePredefCubit.state as SelectedImagePredefInitial).indexSelected) {
      imageCup.updateValue(null);
    } else {
      selectedImagePredefCubit.changedIndexSelect(index);
      imageCup.updateValue(File(listImagePre[index].image));
      takeByCamera = false;
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


  initCup(
      {required Tournament? tournament,}) async {
    if (this.tournament != null) {
      int indexGame = listCardGame.indexWhere((element) => element.gameName == tournament!.game);
      selectGameBloc.add(SelectGameChange(indexSelect: indexGame.toDouble()));

      game.updateValue(tournament!.game);
      nameTournament.updateValue(tournament.name);
      gameNumber.updateValue(tournament.roundNumber.toString());
      numberTeam.updateValue(tournament.capacity.toString());
      signCupDate.updateValue(tournament.dateDebutInscription!);
      startCupDate.updateValue(tournament.dateDebutTournois!);
      startTime.updateValue(
          TimeOfDay.fromDateTime(tournament.dateDebutTournois!));
      numberPlayerByTeam.updateValue(tournament.tournamentType);
      int indexPlayerBy = listTournamentType.indexWhere((element) =>
      element == tournament.tournamentType);
      widgetNumberByPlayerBloc.add(
          WidgetNumberByPlayerChanging(indexSelect: indexPlayerBy));
      server.updateValue(tournament.server);
      pointPerKill.updateValue(tournament.killPointTournament.toString());
      pointPerRang.updateValue(tournament.pointPerRangTournament.toString());
      pointStart.updateValue(tournament.rangStartTournament.toString());

      if (tournament.imageName != null) {

        File fileCup = await firestorageService.downloadFileImage(
            tournament.imageName);
        imageCup.updateValue(fileCup);
        selectedImagePredefCubit.clearImgSelect();
        takeImageGalleryCubit.loadPicture(fileCup.path);
        // selectedImagePredefCubit.clearImgSelect();
      }
      for (var element in tournament.cashPrize) {
        addCashPrize(element);
      }
      tournament.listCodesGames.asMap().forEach((key, element) {
        listCode.addFieldBloc(TextFieldBloc(
            validators: [FieldBlocValidatorsFr.required],
            initialValue: element));
      });
    }
  }
    @override
    Future<FutureOr<void>> onSubmitting() async {
      if (state.currentStep == 0) {
        emitSuccess();
      } else if (state.currentStep == 1) {
        initCodeWidget();
        emitSuccess();
      } else if (state.currentStep == 2) {
        emitSuccess();
      } else if (state.currentStep == 3) {
        emitSuccess();
      } else if (state.currentStep == 4) {
        emitSuccess();
      } else if (state.currentStep == 5) {
        var imgName = firestorageService.getPreffixImage();
        Tournament tournament = Tournament(name: nameTournament.value,
            dateDebutTournois: startCupDate.value,
            game: game.value,
            server: server.value!,
            tournamentType: numberPlayerByTeam.value!,
            capacity: numberTeam.valueToInt!,
            roundNumber: gameNumber.valueToInt!,
            dateDebutInscription: signCupDate.value,
            killPointTournament: pointPerKill.valueToInt!,
            pointPerRangTournament: pointPerRang.valueToInt!,
            rangStartTournament: pointStart.valueToInt!,
            listCodesGames: listCode.value.map((e) => e.value).toList(),
            imageName: imgName,
            cashPrize: listCashPrize.value,
            imageUrl: await firestorageService.addImageToStorage(imgName,imageCup.value!, takeByCamera,)
        );
        _tournamentRepository.addTournamentInFirebase(tournament);
        emitSuccess();
      }
    }
}
