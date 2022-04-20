import 'package:mailer/mailer.dart';
import 'package:mailer/smtp_server.dart';
import 'package:o_spawn_cup/services/smtp_broker.dart';

class EmailBroker {
  SmtpServer smtpServer;
  EmailBroker({required this.smtpServer});

  Future<void> sendEmailMessage(String message,String htmlMessage,String subject,String email) async {
    Message myMessage = createEmailMessage(message,htmlMessage,subject,email);
    await sendEmail(myMessage, smtpServer);
  }


  Message createEmailMessage(String message,String htmlMessage,String subject,String email) {
    final myMessage = Message()
      ..from = const Address('contact@o-spawn.re', 'O-Spawn')
      ..recipients.add(email)
      ..subject = subject
      ..text = message
      ..html = htmlMessage;
    return myMessage;
  }

  Future<void> sendEmail(Message message, SmtpServer smtpServer) async {
    try {
      final sendReport = await send(message, smtpServer);
      print('Message sent: ' + sendReport.toString());
    } on MailerException catch (e) {
      print('$e Message not sent.');
      for (var p in e.problems) {
        print('Problem: ${p.code}: ${p.msg}');
      }
    }
  }
}