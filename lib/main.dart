import 'package:authentication_repository/authentication_repository.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:o_spawn_cup/app/app.dart';
import 'package:o_spawn_cup/firebase_options.dart';

void main() {
  return BlocOverrides.runZoned(
    () async {
      WidgetsFlutterBinding.ensureInitialized();
      await Firebase.initializeApp(
        options: DefaultFirebaseOptions.currentPlatform,
      );
      final authenticationRepository = AuthenticationRepository();
      await authenticationRepository.user.first;
      await SystemChrome.setPreferredOrientations(
        [DeviceOrientation.portraitUp],
      );
      runApp(App(authenticationRepository: authenticationRepository));
    },
    blocObserver: AppBlocObserver(),
  );
}
