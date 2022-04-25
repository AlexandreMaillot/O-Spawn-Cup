import 'dart:developer';

import 'package:mailer/mailer.dart';
import 'package:mailer/smtp_server.dart';

class EmailBroker {
  SmtpServer smtpServer;
  EmailBroker({required this.smtpServer});

  Future<void> sendEmailMessage(
    String message,
    String htmlMessage,
    String subject,
    String email,
  ) async {
    final myMessage = createEmailMessage(message, htmlMessage, subject, email);
    await sendEmail(myMessage, smtpServer);
  }

  Message createEmailMessage(
    String message,
    String htmlMessage,
    String subject,
    String email,
  ) {
    return Message()
      ..from = const Address('contact@o-spawn.re', 'O-Spawn')
      ..recipients.add(email)
      ..subject = subject
      ..text = message
      ..html = htmlMessage;
  }

  Future<void> sendEmail(Message message, SmtpServer smtpServer) async {
    try {
      final sendReport = await send(message, smtpServer);
      log('Message sent: $sendReport');
    } on MailerException catch (e) {
      log('$e Message not sent.');
      for (final p in e.problems) {
        log('Problem: ${p.code}: ${p.msg}');
      }
    }
  }
}
