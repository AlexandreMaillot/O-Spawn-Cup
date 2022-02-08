import "package:flutter/material.dart";
import "package:flutter_bloc/flutter_bloc.dart";
import "package:o_spawn_cup/bloc/widget_number_by_player_bloc/widget_number_by_player_bloc.dart";
import "package:o_spawn_cup/constant.dart";
import 'package:o_spawn_cup/models/TournamentType/tournament_type.dart';
class WidgetNumPlayerByTeam extends StatelessWidget {
  String image;
  int index;
  TournamentType tournamentType;
  // Function onPress;
  WidgetNumPlayerByTeam({
    Key? key,
    required this.image,
    required this.index,
    required this.tournamentType,
    // required this.onPress,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<WidgetNumberByPlayerBloc, WidgetNumberByPlayerState>(
  builder: (context, state) {
    return InkWell(
      splashColor: Colors.transparent,
      highlightColor: Colors.transparent,
      onTap: () => context.read<WidgetNumberByPlayerBloc>().add(WidgetNumberByPlayerChanging(indexSelect: index)),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        width: 55,height: 55,
        decoration:
      BoxDecoration(
        borderRadius: BorderRadius.circular(7),
        border: ((state as WidgetNumberByPlayerInitial).indexSelect  == index) ? Border.all(color: colorTheme ,width: 3,) : Border.all(color: Colors.white ,),
        image: DecorationImage(image: Image.asset(image).image)),
      ),
    );
  },
);
  }
}