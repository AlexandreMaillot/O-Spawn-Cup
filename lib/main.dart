import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:o_spawn_cup/ui/view/form_tournament.dart';
import 'package:o_spawn_cup/ui/view/home.dart';
import 'package:o_spawn_cup/ui/view/home2.dart';
import 'package:o_spawn_cup/ui/view/login.dart';

import 'bloc/bloc_router.dart';
import 'constant.dart';
import 'firebase_options.dart';
import 'models/Team/test.dart';
import 'ui/view/register.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  ok();
  FirebaseFirestore.instance.settings =
      const Settings(persistenceEnabled: true);
  //await FirebaseAuth.instance.setPersistence(Persistence.NONE);
  runApp(const MyApp());

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
        // '/': (context) => Home(),
        '/': (context) => BlocRouter().allGames(),
        '/login': (context) => Login(),
        '/register': (context) => Register(),
        '/home': (context) => const Home(),
        '/create_tournament': (context) => const FormTournament(),
        // '/list_cup': (context) => ListCup(gameName: ),
      },
    );
  }
}
