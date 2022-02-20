import 'package:firebase_auth/firebase_auth.dart';
import 'package:mailer/mailer.dart';
import 'package:mailer/smtp_server.dart';

class EmailBroker {
  Future<void> sendEmailMessage(String message,String htmlMessage,String subject,String email) async {
    SmtpServer smtpServer = paramEmail();
    Message myMessage = createMessage(message,htmlMessage,subject,email);

    await showReport(myMessage, smtpServer);
  }

  SmtpServer paramEmail() {
    String username = "tamoro974@gmail.com";
    String token = "fftvuferdeyhpqqh";
    // String password = 'AIzaSyC67O8S6jcsHAnV0ursdHN2gTcjeaj76wA';
    // String password = 'fgmpfizenmfzmdlb';

    final smtpServer = SmtpServer("ssl0.ovh.net",port: 587,username: "contact@o-spawn.re",password: "AF6PJ4KMU0OG7s&NCCwC");
    return smtpServer;
  }

  Message createMessage(String message,String htmlMessage,String subject,String email) {


    final myMessage = Message()
      ..from = const Address("contact@o-spawn.re", "O-Spawn")
      ..recipients.add(email)
    // ..ccRecipients.addAll(["destCc1@example.com", "destCc2@example.com"])
    //   ..bccRecipients.add(const Address("bccAddress@example.com"))
      ..subject = subject
      ..text = message
      ..html = htmlMessage;
    return myMessage;
  }

  Future<void> showReport(Message message, SmtpServer smtpServer) async {
    try {
      final sendReport = await send(message, smtpServer);
      print("Message sent: " + sendReport.toString());
    } on MailerException catch (e) {
      print("$e Message not sent.");
      for (var p in e.problems) {
        print("Problem: ${p.code}: ${p.msg}");
      }
    }
  }
}