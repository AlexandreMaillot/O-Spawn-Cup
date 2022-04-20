import 'package:flutter_test/flutter_test.dart';
import 'package:mailer/smtp_server.dart';
import 'package:mocktail/mocktail.dart';
import 'package:o_spawn_cup/services/email_broker.dart';
import 'package:mailer/mailer.dart';

class MockSmtpServer extends Mock implements SmtpServer{}

void main() {
  late EmailBroker emailBroker;
  late MockSmtpServer smtpServer;
  setUp((){
    smtpServer = MockSmtpServer();
    emailBroker = EmailBroker(smtpServer: smtpServer);
  });
  group('Normal test',(){
    // when(() => smtpServer.host,).thenReturn('MonHost');
    test('sendEmailMessage', (){
      var monEmail = 'monemail@email.com';
      var monSujet = 'MonSujet';
      var monMessage = 'MonMessage';
      var monMessageHtml = 'MonHtmlMessage';
      //Todo sendEmailMessage
      // emailBroker.sendEmailMessage(monMessage, monMessageHtml, monSujet, monEmail);
    });
    test('Create Message', () {
      var monEmail = 'monemail@email.com';
      var monSujet = 'MonSujet';
      var monMessage = 'MonMessage';
      var monMessageHtml = 'MonHtmlMessage';
      var monMessageObjet = emailBroker.createEmailMessage(monMessage, monMessageHtml, monSujet, monEmail);
      expect(monMessageObjet.from, const Address('contact@o-spawn.re', 'O-Spawn'));
      expect(monMessageObjet.recipients[0], monEmail);
      expect(monMessageObjet.subject, monSujet);
      expect(monMessageObjet.text, monMessage);
      expect(monMessageObjet.html, monMessageHtml);
    });
  });

}