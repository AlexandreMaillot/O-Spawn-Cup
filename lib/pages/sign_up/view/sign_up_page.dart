import 'package:authentication_repository/authentication_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:o_spawn_cup/constant.dart';
import 'package:o_spawn_cup/cubit/google_authentication/google_authentication_cubit.dart';
import 'package:o_spawn_cup/models/Member/member.dart';
import 'package:o_spawn_cup/pages/sign_up/sign_up.dart';
import 'package:o_spawn_cup/repository/member_repository.dart';

class SignUpPage extends StatelessWidget {
  const SignUpPage({Key? key}) : super(key: key);

  static Route route() {
    return MaterialPageRoute<void>(builder: (_) => const SignUpPage());
  }

  @override
  Widget build(BuildContext context) {
    final authenticationRepository = context.read<AuthenticationRepository>();
    debugPrint('SignUpPage ${context.hashCode.toString()}');

    return Scaffold(
      backgroundColor: colorBackgroundTheme,
      body: MultiBlocProvider(
        providers: [
          BlocProvider<SignUpFormBloc>(
            create: (_) => SignUpFormBloc(
              authenticationRepository: authenticationRepository,
            ),
          ),
          BlocProvider(
            create: (_) => GoogleAuthenticationCubit(
              authenticationRepository: authenticationRepository,
              memberRepository: MemberRepository(
                memberCollectionReference: MemberCollectionReference(),
              ),
            ),
          ),
        ],
        child: const SignUpForm(),
      ),
    );
  }
}
