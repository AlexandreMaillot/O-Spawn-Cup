import 'dart:io';

import 'package:bloc_test/bloc_test.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_bloc/flutter_form_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:o_spawn_cup/bloc/select_game_bloc/select_game_bloc.dart';
import 'package:o_spawn_cup/bloc/widget_number_by_player_bloc/widget_number_by_player_bloc.dart';
import 'package:o_spawn_cup/cubit/generate_code_cubit/generate_code_cubit.dart';
import 'package:o_spawn_cup/models/TournamentType/tournament_type.dart';
import 'package:o_spawn_cup/models/game_name.dart';
import 'package:o_spawn_cup/models/server_type.dart';
import 'package:o_spawn_cup/models/tournament/tournament.dart';
import 'package:o_spawn_cup/pages/form_tournament/bloc/tournament_form_bloc.dart';
import 'package:o_spawn_cup/pages/form_tournament/cubit/selected_image_predef_cubit/selected_image_predef_cubit.dart';
import 'package:o_spawn_cup/pages/form_tournament/cubit/take_image_gallery/take_image_gallery_cubit.dart';
import 'package:o_spawn_cup/repository/firestorage_service.dart';
import 'package:o_spawn_cup/repository/tournament_repository.dart';
import 'package:o_spawn_cup/services/field_bloc_validators_errors_fr.dart';

class MockTournamentCollection extends Mock
    implements TournamentCollectionReference {}

class MockTournamentRepository extends Mock implements TournamentRepository {}

class MockWidgetNumberByPlayerBloc extends Mock
    implements WidgetNumberByPlayerBloc {}

class MockSelectedImagePredefCubit extends Mock
    implements SelectedImagePredefCubit {}

class MockTakeImageGalleryCubit extends Mock implements TakeImageGalleryCubit {}

class MockGenerateCodeCubit extends Mock implements GenerateCodeCubit {}

class MockSelectGameBloc extends Mock implements SelectGameBloc {}

class MockTournament extends Mock implements Tournament {}

class MockFile extends Mock implements File {}

class MockFirestorageService extends Mock implements FirestorageService {}

void main() {
  late TournamentFormBloc tournamentFormBloc;
  late MockTournamentCollection tournamentCollection;
  late MockWidgetNumberByPlayerBloc widgetNumberByPlayerBloc;
  late MockSelectedImagePredefCubit selectedImagePredefCubit;
  late MockTakeImageGalleryCubit takeImageGalleryCubit;
  late MockFile file;
  late MockGenerateCodeCubit generateCodeCubit;
  late MockTournament tournament;
  late MockSelectGameBloc selectGameBloc;
  late MockFirestorageService firestorageService;
  setUp(() {
    tournamentCollection = MockTournamentCollection();
    widgetNumberByPlayerBloc = MockWidgetNumberByPlayerBloc();
    selectedImagePredefCubit = MockSelectedImagePredefCubit();
    takeImageGalleryCubit = MockTakeImageGalleryCubit();
    generateCodeCubit = MockGenerateCodeCubit();
    selectGameBloc = MockSelectGameBloc();
    tournament = MockTournament();
    firestorageService = MockFirestorageService();
    file = MockFile();
    tournamentFormBloc = TournamentFormBloc(
      tournamentRepository: TournamentRepository(
        tournamentCollectionReference: tournamentCollection,
      ),
      widgetNumberByPlayerBloc: widgetNumberByPlayerBloc,
      selectedImagePredefCubit: selectedImagePredefCubit,
      takeImageGalleryCubit: takeImageGalleryCubit,
      generateCodeCubit: generateCodeCubit,
      tournament: null,
      selectGameBloc: selectGameBloc,
      firestorageService: firestorageService,
    );
  });
  group('Normal test initCup', () {
    test('InitCup', () {
      final now = DateTime.now();
      final nextDate = DateTime(now.year, now.month, now.day + 7);
      when(
        () => tournament.game,
      ).thenReturn(GameName.leagueOfLegend);
      when(
        () => tournament.name,
      ).thenReturn('MonTournois');
      when(
        () => tournament.roundNumber,
      ).thenReturn(5);
      when(
        () => tournament.capacity,
      ).thenReturn(32);
      when(
        () => tournament.dateDebutInscription,
      ).thenReturn(now);
      when(
        () => tournament.dateDebutTournois,
      ).thenReturn(nextDate);
      when(
        () => tournament.tournamentType,
      ).thenReturn(TournamentType.trio);
      when(
        () => tournament.server,
      ).thenReturn(ServerType.eu);
      when(
        () => tournament.killPointTournament,
      ).thenReturn(1);
      when(
        () => tournament.pointPerRangTournament,
      ).thenReturn(2);
      when(
        () => tournament.rangStartTournament,
      ).thenReturn(5);
      when(
        () => tournament.imageName,
      ).thenReturn('123456');
      when(
        () => firestorageService.downloadFileImage(any()),
      ).thenAnswer((invocation) => Future.value(file));
      when(
        () => file.path,
      ).thenReturn('monpath');
      when(
        () => tournament.cashPrize,
      ).thenReturn(['lot1', 'lot2']);
      when(
        () => tournament.listCodesGames,
      ).thenReturn(['147', '258', '369']);

      // tester.binding.addPersistentFrameCallback((timeStamp) {
      // });
      final mytournamentFormBloc = TournamentFormBloc(
        tournamentRepository: TournamentRepository(
          tournamentCollectionReference: tournamentCollection,
        ),
        widgetNumberByPlayerBloc: widgetNumberByPlayerBloc,
        selectedImagePredefCubit: selectedImagePredefCubit,
        takeImageGalleryCubit: takeImageGalleryCubit,
        generateCodeCubit: generateCodeCubit,
        tournament: tournament,
        selectGameBloc: selectGameBloc,
        firestorageService: firestorageService,
      );

      expect(mytournamentFormBloc.game.value, tournament.game);
      expect(mytournamentFormBloc.nameTournament.value, tournament.name);
      expect(
        mytournamentFormBloc.gameNumber.value,
        tournament.roundNumber.toString(),
      );
      expect(
        mytournamentFormBloc.signCupDate.value,
        tournament.dateDebutInscription,
      );
      expect(
        mytournamentFormBloc.startCupDate.value,
        tournament.dateDebutTournois,
      );
      expect(
        mytournamentFormBloc.numberPlayerByTeam.value,
        tournament.tournamentType,
      );
      expect(
        mytournamentFormBloc.startTime.value,
        TimeOfDay.fromDateTime(tournament.dateDebutTournois!),
      );
      expect(
        mytournamentFormBloc.numberTeam.value,
        tournament.capacity.toString(),
      );
      expect(mytournamentFormBloc.server.value, tournament.server);
      expect(
        mytournamentFormBloc.pointPerKill.value,
        tournament.killPointTournament.toString(),
      );
      expect(
        mytournamentFormBloc.pointPerRang.value,
        tournament.pointPerRangTournament.toString(),
      );
      expect(
        mytournamentFormBloc.pointStart.value,
        tournament.rangStartTournament.toString(),
      );
      // TODO(Tamarok): test image.
      // expect(tournamentFormBloc.imageCup.value, file);
      // TODO(Tamarok): test cashprize
      // expect(mytournamentFormBloc.listCashPrize.value, tournament.cashPrize);
      // TODO(Tamarok): test listCodeGame
      expect(mytournamentFormBloc.listCode.value.first.value, 'init');
      // expect(mytournamentFormBloc.listCode.value[1].value,
      // tournament.listCodesGames[0]);
      // expect(mytournamentFormBloc.listCode.value[2].value,
      // tournament.listCodesGames[1]);
      // expect(mytournamentFormBloc.listCode.value[3].value,
      // tournament.listCodesGames[2]);
    });
  });
  group('Normal test', () {
    test('changeCode', () {
      const monCode = 'MonCode';
      when(() => generateCodeCubit.generateCode(any(), 5)).thenReturn(monCode);
      tournamentFormBloc.listCode
          .addFieldBloc(TextFieldBloc<TextFieldBloc>(initialValue: ''));
      tournamentFormBloc.changeCode(0);
      expect(tournamentFormBloc.listCode.value.first.value, monCode);
    });
    test('tapOnNumberPlayerByTeamWidget selectionne une fois', () {
      when(
        () => widgetNumberByPlayerBloc.indexSelected,
      ).thenReturn(null);
      tournamentFormBloc.tapOnNumberPlayerByTeamWidget(1);
      expect(tournamentFormBloc.numberPlayerByTeam.state.isValid, true);
    });
    test('tapOnNumberPlayerByTeamWidget selectionne meme widget', () {
      when(
        () => widgetNumberByPlayerBloc.indexSelected,
      ).thenReturn(1);
      tournamentFormBloc.tapOnNumberPlayerByTeamWidget(1);
      expect(tournamentFormBloc.numberPlayerByTeam.state.isValid, false);
    });
    test('tapOnTileImagepreDef selectionne une fois', () {
      when(
        () => selectedImagePredefCubit.changedIndexSelect(indexSelect: 1),
      ).thenAnswer((invocation) => null);
      when(
        () => selectedImagePredefCubit.state,
      ).thenAnswer(
        (invocation) => const SelectedImagePredefInitial(indexSelected: null),
      );
      tournamentFormBloc.tapOnTileImagepreDef(1);
      expect(tournamentFormBloc.imageCup.state.isValid, true);
      verify(() => takeImageGalleryCubit.clearPicture()).called(1);
    });
    test('tapOnTileImagepreDef selectionne meme widget', () {
      when(
        () => selectedImagePredefCubit.changedIndexSelect(indexSelect: 1),
      ).thenAnswer((invocation) => null);
      when(
        () => selectedImagePredefCubit.state,
      ).thenAnswer(
        (invocation) => const SelectedImagePredefInitial(indexSelected: 1),
      );
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

    test('cash prize null est valide', () {
      expect(tournamentFormBloc.listCashPrize.state.isValid, true);
    });
    test('deleteCashPrize', () {
      tournamentFormBloc.listCashPrize.updateValue(['value1']);
      tournamentFormBloc.deleteCashPrize(0);
      expect(tournamentFormBloc.listCashPrize.value.isEmpty, true);
    });
    test('modifCashPrize', () {
      tournamentFormBloc.listCashPrize.updateValue(['value1']);
      tournamentFormBloc.modifCashPrize(0, 'MaValeur');
      expect(tournamentFormBloc.listCashPrize.value.first, 'MaValeur');
    });
    test('addCashPrize', () {
      tournamentFormBloc.addCashPrize('ValeurTest');
      expect(tournamentFormBloc.listCashPrize.value.isNotEmpty, true);
      expect(tournamentFormBloc.listCashPrize.value.length, 1);
    });
  });
  group('Bloc test', () {
    group('Step 1', () {
      blocTest(
        'submit avec etat global step 1 valide',
        build: () => tournamentFormBloc,
        act: (TournamentFormBloc bloc) {
          bloc.game.updateValue(GameName.leagueOfLegend);
          bloc.submit();
        },
        expect: () => [
          isA<FormBlocSubmitting>(),
          isA<FormBlocSuccess>(),
        ],
      );
    });

    group('Step 2', () {
      setUp(() {
        final dateStart = DateTime(2050);
        tournamentFormBloc.updateCurrentStep(1);
        tournamentFormBloc.nameTournament.updateValue('name test');
        tournamentFormBloc.gameNumber.updateValue('1');
        tournamentFormBloc.signCupDate.updateValue(DateTime.now());
        tournamentFormBloc.startCupDate.updateValue(dateStart);
        tournamentFormBloc.numberPlayerByTeam.updateValue(TournamentType.solo);
        tournamentFormBloc.startTime.updateValue(TimeOfDay.now());
        tournamentFormBloc.numberTeam.updateValue('10');
        tournamentFormBloc.server.updateValue(ServerType.eu);
        when(() => generateCodeCubit.generateCode(any(), 5))
            .thenReturn('123456789123412345');
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
          verify(
            () => widgetNumberByPlayerBloc.add(WidgetNumberByPlayerAnimating()),
          ).called(1);
        },
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
    group('Step 3', () {
      setUp(() {
        tournamentFormBloc.updateCurrentStep(2);

        tournamentFormBloc.pointPerKill.updateValue('1');
        tournamentFormBloc.pointPerRang.updateValue('1');
        tournamentFormBloc.pointStart.updateValue('1');
        // print(tournamentFormBloc.state);
      });
      blocTest(
        'submit avec etat global step 3 valide',
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
    group('Step 4', () {
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
        setUp: () {
          when(
            () => selectedImagePredefCubit.selectImagePreDefAnimation(),
          ).thenAnswer((invocation) => Future.value());
          when(
            () => takeImageGalleryCubit.takeImageAnimation(),
          ).thenAnswer((invocation) => Future.value());
        },
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
          verify(
            () => selectedImagePredefCubit.selectImagePreDefAnimation(),
          ).called(1);
          verify(
            () => takeImageGalleryCubit.takeImageAnimation(),
          ).called(1);
        },
      );
    });
    group('Step 5', () {
      setUp(() {
        tournamentFormBloc.updateCurrentStep(4);
        tournamentFormBloc.listCashPrize.updateValue([]);
        // print(tournamentFormBloc.state);
      });
      blocTest(
        'submit avec etat global step 5 valide avec cash prize vide',
        build: () => tournamentFormBloc,
        act: (TournamentFormBloc bloc) {
          bloc.submit();
        },
        expect: () => [
          isA<FormBlocSubmitting>(),
          isA<FormBlocSuccess>(),
        ],
      );
      blocTest(
        'submit avec etat global step 5 valide avec cash prize non vide',
        build: () => tournamentFormBloc,
        act: (TournamentFormBloc bloc) {
          tournamentFormBloc.listCashPrize.updateValue(['Cash 1', 'Cash 2']);
          bloc.submit();
        },
        expect: () => [
          isA<FormBlocSubmitting>(),
          isA<FormBlocSuccess>(),
        ],
      );
    });
    group('Step 6', () {
      setUp(() {
        //J'ai ajouter un autre step pour pouvoir
        // verifier la validité de la liste de code
        tournamentFormBloc
          ..addFieldBlocs(
            fieldBlocs: [
              TextFieldBloc(validators: [FieldBlocValidatorsFr.required]),
            ],
            step: 6,
          )
          ..updateCurrentStep(5)
          ..listCode.addFieldBloc(
            TextFieldBloc(
              validators: [FieldBlocValidatorsFr.required],
              initialValue: '',
            ),
          );
      });
      blocTest(
        'submit avec etat global step 6 valide',
        build: () => tournamentFormBloc,
        act: (TournamentFormBloc bloc) {
          bloc.submit();
        },
        expect: () => [
          isA<FormBlocSubmitting>(),
          // isA<FormBlocSuccess>(),
        ],
      );
    });

    blocTest(
      'submit valide form',
      build: () => tournamentFormBloc,
      setUp: () {
        final dateStart = DateTime(2050);
        tournamentFormBloc.nameTournament.updateValue('name test');
        tournamentFormBloc.gameNumber.updateValue('1');
        tournamentFormBloc.signCupDate.updateValue(DateTime.now());
        tournamentFormBloc.startCupDate.updateValue(dateStart);
        tournamentFormBloc.numberPlayerByTeam.updateValue(TournamentType.solo);
        tournamentFormBloc.startTime.updateValue(TimeOfDay.now());
        tournamentFormBloc.numberTeam.updateValue('10');
        tournamentFormBloc.server.updateValue(ServerType.eu);

        tournamentFormBloc.pointPerKill.updateValue('1');
        tournamentFormBloc.pointPerRang.updateValue('1');
        tournamentFormBloc.pointStart.updateValue('1');

        when(() => file.path).thenReturn('test');
        tournamentFormBloc.imageCup.updateValue(file);

        tournamentFormBloc.listCashPrize.updateValue(['Cash 1', 'Cash 2']);

        tournamentFormBloc.listCode.addFieldBloc(
          TextFieldBloc(
            validators: [FieldBlocValidatorsFr.required],
            initialValue: 'test',
          ),
        );
      },
      act: (TournamentFormBloc bloc) {
        bloc.submit();
      },
      expect: () => [
        isA<FormBlocSubmitting>(),
        isA<FormBlocSuccess>(),
      ],
    );
  });
}
