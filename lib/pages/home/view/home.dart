import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:o_spawn_cup/bloc/select_game_bloc/select_game_bloc.dart';
import 'package:o_spawn_cup/constant.dart';
import 'package:o_spawn_cup/pages/home/view/home_view.dart';

class Home extends StatelessWidget {
  static Page page() => const MaterialPage<void>(child: Home());
  static Route route() {
    return MaterialPageRoute<void>(builder: (_) => const Home());
  }

  const Home({
    Key? key,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => SelectGameBloc(listGameName: listCardGame, initialIndex: 1)
        ..add(SelectGameloadList()),
      child: HomeView(),
    );
  }
}
