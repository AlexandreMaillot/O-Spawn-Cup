import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:o_spawn_cup/models/team/team.dart';
import 'package:o_spawn_cup/models/tournament/tournament.dart';
import 'package:o_spawn_cup/services/email_broker.dart';
import 'package:o_spawn_cup/services/email_message.dart';

class MockEmailBroker extends Mock implements EmailBroker {}

class MockTournament extends Mock implements Tournament {}

class MockTeam extends Mock implements Team {}

void main() {
  late EmailMessage emailMessage;
  late MockEmailBroker emailBroker;
  late MockTeam team;
  late MockTournament tournament;
  setUp(() {
    emailBroker = MockEmailBroker();
    tournament = MockTournament();
    team = MockTeam();
    emailMessage = EmailMessage(emailBroker);
  });
  group('Normal test', () {
    setUp(() {
      when(
        () => tournament.name,
      ).thenReturn('NomTournois');
      when(
        () => team.teamCode,
      ).thenReturn('Code123');
      when(
        () => emailBroker.sendEmailMessage(any(), any(), any(), any()),
      ).thenAnswer((invocation) => Future.value());
    });
    group('Message welcome', () {
      test('init', () {
        emailMessage.sendMessageWelcomeMethod(
          tournament,
          team,
          'email@email.com',
        );
      });
      test('Email null donc manquant', () {
        expect(
          () => emailMessage.sendMessageWelcomeMethod(tournament, team, null),
          throwsA(
            isA<ArgumentError>().having(
              (error) => error.message, // The feature you want to check.
              'message', // The description of the feature.
              'Email manquant', // The error message.
            ),
          ),
        );
      });
      test('Email vide donc manquant', () {
        expect(
          () => emailMessage.sendMessageWelcomeMethod(tournament, team, ''),
          throwsA(
            isA<ArgumentError>().having(
              (error) => error.message, // The feature you want to check.
              'message', // The description of the feature.
              'Email manquant', // The error message.
            ),
          ),
        );
      });
    });

    group('Message team code', () {
      test('init', () {
        emailMessage.sendMessageTeamCodeMethod(
          tournament,
          team,
          'email@email.com',
        );
      });
      test('Email null donc manquant', () {
        expect(
          () => emailMessage.sendMessageTeamCodeMethod(tournament, team, null),
          throwsA(
            isA<ArgumentError>().having(
              (error) => error.message, // The feature you want to check.
              'message', // The description of the feature.
              'Email manquant', // The error message.
            ),
          ),
        );
      });
      test('Email vide donc manquant', () {
        expect(
          () => emailMessage.sendMessageTeamCodeMethod(tournament, team, ''),
          throwsA(
            isA<ArgumentError>().having(
              (error) => error.message, // The feature you want to check.
              'message', // The description of the feature.
              'Email manquant', // The error message.
            ),
          ),
        );
      });
    });
  });
}
