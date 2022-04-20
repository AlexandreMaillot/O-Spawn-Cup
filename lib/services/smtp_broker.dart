import 'package:mailer/smtp_server.dart';

class SmtpBroker {

  final String username;
  final String password;
  final String smtp;
  final int port;

  const SmtpBroker({required this.username,required this.password,required this.smtp,required this.port});

  static SmtpServer get ospawn => SmtpServer('ssl0.ovh.net',port: 587,username: 'contact@o-spawn.re',password: 'AF6PJ4KMU0OG7s&NCCwC');
  static SmtpServer get tamoro974 => SmtpServer('ssl0.ovh.net',port: 587,username: 'tamoro974@gmail.com',password: 'fgmpfizenmfzmdlb&NCCwC');

  SmtpServer paramSmtp() {
    return SmtpServer(smtp,port: port,username: username,password: password);
  }
}