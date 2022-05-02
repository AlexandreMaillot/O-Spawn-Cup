import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:network_image_mock/network_image_mock.dart';
import 'package:o_spawn_cup/models/Member/member.dart';
import 'package:o_spawn_cup/pages/profil/cubit/profil_cubit.dart';
import 'package:o_spawn_cup/pages/profil/profil.dart';
import 'package:o_spawn_cup/shared/widgets/text_element.dart';

class MockMember extends Mock implements Member {}

class MockProfilCubit extends Mock implements ProfilCubit {}

void main() {
  late MockMember member;
  late MockProfilCubit profilCubit;
  setUp(() {
    member = MockMember();
    profilCubit = MockProfilCubit();
    when(
      () => profilCubit.stream,
    ).thenAnswer((invocation) => Stream.value(ProfilInitial()));
    when(
      () => profilCubit.close(),
    ).thenAnswer((invocation) => Future<void>.value());
  });
  group('Initialisation du widget', () {
    testWidgets('initialisation du widget', (WidgetTester tester) async {
      await mockNetworkImagesFor(
        () => tester.pumpWidget(
          BlocProvider<ProfilCubit>(
            create: (context) => profilCubit,
            child: const MaterialApp(
              home: Material(
                child: ProfilHeader(),
              ),
            ),
          ),
        ),
      );
      final pseudoWidget = tester.widget<TextElement>(find.byType(TextElement));
      expect(
        pseudoWidget.text,
        'Mon pseudo',
      );
    });
  });
  group('Pseudo profil', () {
    setUp(() {
      when(
        () => profilCubit.member,
      ).thenReturn(member);
      when(
        () => member.pseudo,
      ).thenReturn('Tamarok');
    });
    testWidgets('Affichage du pseudo utilisateur', (WidgetTester tester) async {
      await mockNetworkImagesFor(
        () => tester.pumpWidget(
          BlocProvider<ProfilCubit>(
            create: (context) => profilCubit,
            child: const MaterialApp(
              home: Material(
                child: ProfilHeader(),
              ),
            ),
          ),
        ),
      );
      final pseudoWidget = tester.widget<TextElement>(find.byType(TextElement));
      expect(
        pseudoWidget.text,
        'Tamarok',
      );
    });
  });
}
