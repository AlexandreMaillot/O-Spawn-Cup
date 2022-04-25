import 'package:authentication_repository/authentication_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:o_spawn_cup/cubit/google_authentication/google_authentication_cubit.dart';
import 'package:o_spawn_cup/models/Member/member.dart';
import 'package:o_spawn_cup/pages/start_page/view/start_page_view.dart';
import 'package:o_spawn_cup/repository/member_repository.dart';

class StartPage extends StatelessWidget {
  static Page page() => const MaterialPage<void>(child: StartPage());
  const StartPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final authenticationRepository = context.read<AuthenticationRepository>();

    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) => GoogleAuthenticationCubit(
            authenticationRepository: authenticationRepository,
            memberRepository: MemberRepository(
              memberCollectionReference: MemberCollectionReference(),
            ),
          ),
        ),
      ],
      child: const StartPageView(),
    );
  }
}
