import 'package:authentication_repository/authentication_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:o_spawn_cup/constant.dart';
import 'package:o_spawn_cup/login/bloc/login_form_bloc.dart';
import 'package:o_spawn_cup/login/cubit/login_cubit.dart';
import 'package:o_spawn_cup/login/view/login_form.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  static Page page() => const MaterialPage<void>(child: LoginPage());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: colorBackgroundTheme,
      body: BlocProvider(
        create: (_) => LoginFormBloc(authenticationRepository: context.read<AuthenticationRepository>()),
        child: LoginForm(),
      ),
    );
  }
}
