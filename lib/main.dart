import 'package:authentication_repository/authentication_repository.dart';
import "package:cloud_firestore/cloud_firestore.dart";
import "package:firebase_auth/firebase_auth.dart";
import "package:flutter/material.dart";
import "package:firebase_core/firebase_core.dart";
import "package:flutter/services.dart";
import "package:flutter_bloc/flutter_bloc.dart";
import 'package:o_spawn_cup/app/app.dart';
import 'package:o_spawn_cup/list_cup/bloc/list_tournament_bloc/list_tournament_bloc.dart';
import "package:o_spawn_cup/models/game_name.dart";
import 'package:o_spawn_cup/home/view/home.dart';


import "bloc/bloc_router.dart";
import "constant.dart";
import "firebase_options.dart";
import 'sign_up/view/sign_up_form.dart';

void main() async {
  return BlocOverrides.runZoned(() async {
    WidgetsFlutterBinding.ensureInitialized();
    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );
    final authenticationRepository = AuthenticationRepository();
    await authenticationRepository.user.first;
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp])
        .then((value) => runApp(App(authenticationRepository: authenticationRepository)));
  },
    blocObserver: AppBlocObserver(),
  );
}

// class MyApp extends StatelessWidget {
//   const MyApp({Key? key}) : super(key: key);
//
//   // This widget is the root of your application.
//   @override
//   Widget build(BuildContext context) {
//     return MultiBlocProvider(
//       providers: [
//         BlocProvider(
//           lazy: false,
//           create: (_) => ListTournamentBloc(gameName: GameName.Fornite),
//         ),
//       ],
//       child: MaterialApp(
//         title: "O-SPAWN-CUP",
//
//         debugShowCheckedModeBanner: false,
//         theme: ThemeData(
//           appBarTheme: AppBarTheme(color: colorTheme),
//           backgroundColor: colorBackgroundTheme,
//         ),
//         initialRoute: "/",
//
//         routes: {
//           "/": (context) =>
//               StreamBuilder(
//                 stream: FirebaseAuth.instance.userChanges(),
//                 builder: (context, snapshot) {
//                   return (snapshot.hasData)
//                       ? const LoginRegister()
//                       : const LoginRegister();
//                 },
//               )
//           ,
//           "/login": (context) => Login(),
//           "/register": (context) => Register(),
//         },
//       ),
//     );
//   }
// }
