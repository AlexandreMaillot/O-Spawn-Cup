import 'package:authentication_repository/authentication_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:o_spawn_cup/constant.dart';
import 'package:o_spawn_cup/cubit/google_authentication/google_authentication_cubit.dart';
import 'package:o_spawn_cup/pages/login/bloc/login_form_bloc.dart';
import 'package:o_spawn_cup/pages/login/view/login_form.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  static Route route() {
    return MaterialPageRoute<void>(builder: (_) => const LoginPage());
  }
  @override
  Widget build(BuildContext context) {
    final authenticationRepository = context.read<AuthenticationRepository>();
    return Scaffold(
      backgroundColor: colorBackgroundTheme,
      body: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (_) =>
                LoginFormBloc(authenticationRepository: authenticationRepository),
          ),
          // BlocProvider(
          //   create: (context) => GoogleAuthenticationCubit(authenticationRepository: authenticationRepository),
          // ),
        ],
        child: LoginForm(),
      ),
    );
  }
}
