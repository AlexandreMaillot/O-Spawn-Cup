import "package:cloud_firestore/cloud_firestore.dart";
import "package:firebase_auth/firebase_auth.dart";
import "package:flutter/material.dart";
import "package:firebase_core/firebase_core.dart";
import "package:flutter/services.dart";
import "package:flutter_bloc/flutter_bloc.dart";
import "package:o_spawn_cup/models/game_name.dart";
import "package:o_spawn_cup/ui/view/home.dart";


import "package:o_spawn_cup/ui/view/login.dart";
import "package:o_spawn_cup/ui/view/login_register.dart";

import "bloc/bloc_router.dart";
import "bloc/list_tournament_bloc/list_tournament_bloc.dart";
import "constant.dart";
import "firebase_options.dart";
import "ui/view/register.dart";

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,

  );
  FirebaseFirestore.instance.settings =
  const Settings(persistenceEnabled: true);
  //await FirebaseAuth.instance.setPersistence(Persistence.NONE);
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp])
      .then((value) => runApp(const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          lazy: false,
          create: (_) => ListTournamentBloc(gameName: GameName.Fornite),
        ),
      ],
      child: MaterialApp(
        title: "O-SPAWN-CUP",

        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          appBarTheme: AppBarTheme(color: colorTheme),
          backgroundColor: colorBackgroundTheme,
          primarySwatch: Colors.blue,
        ),
        initialRoute: "/",

        routes: {
          "/": (context) =>
              StreamBuilder(
                stream: FirebaseAuth.instance.userChanges(),
                builder: (context, snapshot) {
                  return (snapshot.hasData)
                      ? const LoginRegister()
                      : const LoginRegister();
                },
              )
          ,
          "/login": (context) => Login(),
          "/register": (context) => Register(),
          "/home": (context) => BlocRouter().allGames(),
        },
      ),
    );
  }
}
