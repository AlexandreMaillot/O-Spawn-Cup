import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:o_spawn_cup/view/home.dart';
import 'package:o_spawn_cup/view/login.dart';
import 'package:o_spawn_cup/view/login_register.dart';
import 'package:o_spawn_cup/CustomsWidgets/custom_dropdown.dart';

import 'constant.dart';
import 'firebase_options.dart';
import 'view/list_cup.dart';
import 'view/register.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  //await FirebaseAuth.instance.setPersistence(Persistence.NONE);
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'O-SPAWN-CUP',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        appBarTheme: AppBarTheme(color: colorTheme),
        backgroundColor: colorBackgroundTheme,
        primarySwatch: Colors.blue,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => const LoginRegister(),
        '/login': (context) => Login(),
        '/register': (context) => Register(),
        '/home': (context) => Home(),
        //'/list_cup': (context) => ListCup(gameName: ),
      },
    );
  }
}
