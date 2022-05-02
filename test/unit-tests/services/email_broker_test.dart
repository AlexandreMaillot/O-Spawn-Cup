import 'package:flutter_test/flutter_test.dart';
import 'package:mailer/mailer.dart';
import 'package:mailer/smtp_server.dart';
import 'package:mocktail/mocktail.dart';
import 'package:o_spawn_cup/services/email_broker.dart';

class MockSmtpServer extends Mock implements SmtpServer {}

void main() {
  late EmailBroker emailBroker;
  late MockSmtpServer smtpServer;
  setUp(() {
    smtpServer = MockSmtpServer();
    emailBroker = EmailBroker(smtpServer: smtpServer);
  });
  group('Normal test', () {
    // when(() => smtpServer.host,).thenReturn('MonHost');
    test('sendEmailMessage', () {
      // const monEmail = 'monemail@email.com';
      // const monSujet = 'MonSujet';
      // const monMessage = 'MonMessage';
      // const monMessageHtml = 'MonHtmlMessage';
      // Todo(Tamarok): sendEmailMessage
      // emailBroker.sendEmailMessage
      // (monMessage, monMessageHtml, monSujet, monEmail);
    });
    test('Create Message', () {
      const monEmail = 'monemail@email.com';
      const monSujet = 'MonSujet';
      const monMessage = 'MonMessage';
      const monMessageHtml = 'MonHtmlMessage';
      final monMessageObjet = emailBroker.createEmailMessage(
        monMessage,
        monMessageHtml,
        monSujet,
        monEmail,
      );
      expect(
        monMessageObjet.from,
        const Address('contact@o-spawn.re', 'O-Spawn'),
      );
      expect(monMessageObjet.recipients.first, monEmail);
      expect(monMessageObjet.subject, monSujet);
      expect(monMessageObjet.text, monMessage);
      expect(monMessageObjet.html, monMessageHtml);
    });
  });
}
