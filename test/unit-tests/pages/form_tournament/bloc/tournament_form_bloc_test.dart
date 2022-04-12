import 'dart:io';

import 'package:bloc_test/bloc_test.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_bloc/flutter_form_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:o_spawn_cup/bloc/widget_number_by_player_bloc/widget_number_by_player_bloc.dart';
import 'package:o_spawn_cup/cubit/selected_image_predef_cubit/selected_image_predef_cubit.dart';
import 'package:o_spawn_cup/cubit/take_image_gallery/take_image_gallery_cubit.dart';
import 'package:o_spawn_cup/models/Tournament/tournament.dart';
import 'package:o_spawn_cup/models/TournamentType/tournament_type.dart';
import 'package:o_spawn_cup/models/game_name.dart';
import 'package:o_spawn_cup/models/server_type.dart';
import 'package:o_spawn_cup/pages/form_tournament/bloc/tournament_form_bloc.dart';
import 'package:o_spawn_cup/repository/tournament_repository.dart';

class MockTournamentCollection extends Mock implements TournamentCollectionReference{}
class MockTournamentRepository extends Mock implements TournamentRepository{}
class MockWidgetNumberByPlayerBloc extends Mock implements WidgetNumberByPlayerBloc{}
class MockSelectedImagePredefCubit extends Mock implements SelectedImagePredefCubit{}
class MockTakeImageGalleryCubit extends Mock implements TakeImageGalleryCubit{}
class MockFile extends Mock implements File{}
void main() {
  late TournamentFormBloc tournamentFormBloc;
  late MockTournamentCollection tournamentCollection;
  late MockWidgetNumberByPlayerBloc widgetNumberByPlayerBloc;
  late SelectedImagePredefCubit selectedImagePredefCubit;
  late TakeImageGalleryCubit takeImageGalleryCubit;
  late MockFile file;
  setUp((){
    tournamentCollection = MockTournamentCollection();
    widgetNumberByPlayerBloc = MockWidgetNumberByPlayerBloc();
    selectedImagePredefCubit = MockSelectedImagePredefCubit();
    takeImageGalleryCubit = MockTakeImageGalleryCubit();
    file = MockFile();
    tournamentFormBloc = TournamentFormBloc(tournamentRepository: TournamentRepository(tournamentCollectionReference: tournamentCollection),
      widgetNumberByPlayerBloc: widgetNumberByPlayerBloc,
      selectedImagePredefCubit: selectedImagePredefCubit,
        takeImageGalleryCubit: takeImageGalleryCubit);
  });
  group('Normal test', (){
    setUp((){

    });
    test('numGameChange', () {
      tournamentFormBloc.numGameChange('ok');
    });
    test('tapOnNumberPlayerByTeamWidget selectionne une fois', () {
      when(() => widgetNumberByPlayerBloc.indexSelected,).thenReturn(null);
      tournamentFormBloc.tapOnNumberPlayerByTeamWidget(1);
      expect(tournamentFormBloc.numberPlayerByTeam.state.isValid, true);
    });
    test('tapOnNumberPlayerByTeamWidget selectionne meme widget', () {
      when(() => widgetNumberByPlayerBloc.indexSelected,).thenReturn(1);
      tournamentFormBloc.tapOnNumberPlayerByTeamWidget(1);
      expect(tournamentFormBloc.numberPlayerByTeam.state.isValid, false);
    });
    test('tapOnTileImagepreDef selectionne une fois', () {
      when(() => selectedImagePredefCubit.changedIndexSelect(1),).thenAnswer((invocation) => null);
      when(() => selectedImagePredefCubit.state,).thenAnswer((invocation) => SelectedImagePredefInitial(indexSelected: null));
      tournamentFormBloc.tapOnTileImagepreDef(1);
      expect(tournamentFormBloc.imageCup.state.isValid, true);
      verify(() => takeImageGalleryCubit.clearPicture()).called(1);
    });
    test('tapOnTileImagepreDef selectionne meme widget', () {
      when(() => selectedImagePredefCubit.changedIndexSelect(1),).thenAnswer((invocation) => null);
      when(() => selectedImagePredefCubit.state,).thenAnswer((invocation) => SelectedImagePredefInitial(indexSelected: 1));
      tournamentFormBloc.tapOnTileImagepreDef(1);
      expect(tournamentFormBloc.imageCup.state.isValid, false);
      verify(() => takeImageGalleryCubit.clearPicture()).called(1);
    });

    test('loadImageTaked image est null', () {
      tournamentFormBloc.loadImageTaked(null);
      expect(tournamentFormBloc.imageCup.state.isValid, false);
    });
    test('loadImageTaked image est non null', () {
      tournamentFormBloc.loadImageTaked(file);
      expect(tournamentFormBloc.imageCup.state.isValid, true);
      verify(() => selectedImagePredefCubit.clearImgSelect()).called(1);
    });
  });
  group('Bloc test', (){
    group('Step 1', (){
      blocTest(
        'submit avec etat global step 1 valide',
        build: () => tournamentFormBloc,
        act: (TournamentFormBloc bloc) {
          bloc.game.updateValue(GameName.LeagueOfLegend);
          bloc.submit();
        },
        expect: () => [
          isA<FormBlocSubmitting>(),
          isA<FormBlocSuccess>(),
        ],
      );
    });

    group('Step 2', (){
      setUp((){
        DateTime dateStart = DateTime(2050);
        tournamentFormBloc.updateCurrentStep(1);
        tournamentFormBloc.nameTournament.updateValue('name test');
        tournamentFormBloc.gameNumber.updateValue('1');
        tournamentFormBloc.signCupDate.updateValue(DateTime.now());
        tournamentFormBloc.startCupDate.updateValue(dateStart);
        tournamentFormBloc.numberPlayerByTeam.updateValue(TournamentType.solo);
        tournamentFormBloc.startTime.updateValue(TimeOfDay.now());
        tournamentFormBloc.numberTeam.updateValue('10');
        tournamentFormBloc.server.updateValue(ServerType.EU);
      });
      blocTest(
        'submit avec etat global step 2 valide',
        build: () => tournamentFormBloc,
        act: (TournamentFormBloc bloc) {
          bloc.submit();
        },
        skip: 1,
        expect: () => [
          isA<FormBlocSubmitting>(),
          isA<FormBlocSuccess>(),
        ],
      );
      blocTest(
        'submit name egal null',
        build: () => tournamentFormBloc,
        act: (TournamentFormBloc bloc) {
          bloc.nameTournament.updateValue('');
          bloc.submit();
        },
        skip: 1,
        expect: () => [
          isA<FormBlocSubmissionFailed>(),
          isA<FormBlocLoaded>(),
        ],
      );
      blocTest(
        'submit game number egal null',
        build: () => tournamentFormBloc,
        act: (TournamentFormBloc bloc) {
          bloc.gameNumber.updateValue('');
          bloc.submit();
        },
        skip: 1,
        expect: () => [
          isA<FormBlocSubmissionFailed>(),
          isA<FormBlocLoaded>(),
        ],
      );

      blocTest(
        'submit startCupDate inferieur sign date',
        build: () => tournamentFormBloc,
        act: (TournamentFormBloc bloc) {
          bloc.startCupDate.updateValue(DateTime(1900));
          bloc.submit();
        },
        skip: 1,
        expect: () => [
          isA<FormBlocSubmissionFailed>(),
          isA<FormBlocLoaded>(),
        ],
      );
      blocTest(
        'submit numberPlayerByTeam egal null',
        build: () => tournamentFormBloc,
        act: (TournamentFormBloc bloc) {
          bloc.numberPlayerByTeam.updateValue(null);
          bloc.submit();
        },
        skip: 1,
        expect: () => [
          isA<FormBlocSubmitting>(),
          isA<FormBlocSubmissionFailed>(),
          isA<FormBlocLoaded>(),
        ],
        verify: (_) {
          verify(() => widgetNumberByPlayerBloc.add(WidgetNumberByPlayerAnimating()),).called(1);
        }
      );

      blocTest(
        'submit number team egal null',
        build: () => tournamentFormBloc,
        act: (TournamentFormBloc bloc) {
          bloc.numberTeam.updateValue('0');
          bloc.submit();
        },
        skip: 1,
        expect: () => [
          isA<FormBlocSubmissionFailed>(),
          isA<FormBlocLoaded>(),
        ],
      );
      blocTest(
        'submit server egal null',
        build: () => tournamentFormBloc,
        act: (TournamentFormBloc bloc) {
          bloc.server.updateValue(null);
          bloc.submit();
        },
        skip: 1,
        expect: () => [
          isA<FormBlocSubmissionFailed>(),
          isA<FormBlocLoaded>(),
        ],
      );
    });
    group('Step 3', (){
      setUp((){

        tournamentFormBloc.updateCurrentStep(2);

        tournamentFormBloc.pointPerKill.updateValue('1');
        tournamentFormBloc.pointPerRang.updateValue('1');
        tournamentFormBloc.pointStart.updateValue('1');
        // print(tournamentFormBloc.state);
      });
      blocTest(
        'submit avec etat global step 2 valide',
        build: () => tournamentFormBloc,
        act: (TournamentFormBloc bloc) {
          bloc.submit();
        },
        skip: 1,
        expect: () => [
          isA<FormBlocSubmitting>(),
          isA<FormBlocSuccess>(),
        ],
      );
      blocTest(
        'submit avec point par kill egal null',
        build: () => tournamentFormBloc,
        act: (TournamentFormBloc bloc) {
          bloc.pointPerKill.updateValue('');
          bloc.submit();
        },
        skip: 1,
        expect: () => [
          isA<FormBlocSubmissionFailed>(),
          isA<FormBlocLoaded>(),
        ],
      );
      blocTest(
        'submit avec point par rang egal null',
        build: () => tournamentFormBloc,
        act: (TournamentFormBloc bloc) {
          bloc.pointPerRang.updateValue('');
          bloc.submit();
        },
        skip: 1,
        expect: () => [
          isA<FormBlocSubmissionFailed>(),
          isA<FormBlocLoaded>(),
        ],
      );
      blocTest(
        'submit avec point start egal null',
        build: () => tournamentFormBloc,
        act: (TournamentFormBloc bloc) {
          bloc.pointStart.updateValue('');
          bloc.submit();
        },
        skip: 1,
        expect: () => [
          isA<FormBlocSubmissionFailed>(),
          isA<FormBlocLoaded>(),
        ],
      );
    });
    group('Step 4', ()
    {
      setUp(() {
        tournamentFormBloc.updateCurrentStep(3);
        tournamentFormBloc.imageCup.updateValue(file);
        // print(tournamentFormBloc.state);
      });
      blocTest(
        'submit avec etat global step 4 valide',
        build: () => tournamentFormBloc,
        act: (TournamentFormBloc bloc) {
          bloc.submit();
        },
        skip: 1,
        expect: () => [
          isA<FormBlocSubmitting>(),
          isA<FormBlocSuccess>(),
        ],
      );
      blocTest(
        'submit avec image cup egal null',
        build: () => tournamentFormBloc,
        act: (TournamentFormBloc bloc) {
          tournamentFormBloc.imageCup.updateValue(null);
          bloc.submit();
        },
        skip: 1,
        expect: () => [
          isA<FormBlocSubmitting>(),
          isA<FormBlocSubmissionFailed>(),
          isA<FormBlocLoaded>(),
        ],
          verify: (_) {
            verify(() => selectedImagePredefCubit.selectImagePreDefAnimation(),).called(1);
            verify(() => takeImageGalleryCubit.takeImageAnimation(),).called(1);
          }
      );
    });
  });

}