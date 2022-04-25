import 'package:animated_widgets/animated_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:o_spawn_cup/bloc/widget_number_by_player_bloc/widget_number_by_player_bloc.dart';
import 'package:o_spawn_cup/constant.dart';
import 'package:o_spawn_cup/models/TournamentType/tournament_type.dart';
import 'package:o_spawn_cup/pages/form_tournament/bloc/tournament_form_bloc.dart';

class WidgetNumPlayerByTeam extends StatelessWidget {
  final String image;
  final int index;
  final TournamentType tournamentType;
  // Function onPress;
  const WidgetNumPlayerByTeam({
    Key? key,
    required this.image,
    required this.index,
    required this.tournamentType,
    // required this.onPress,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final tournamentFormBloc = context.read<TournamentFormBloc>();

    return BlocBuilder<WidgetNumberByPlayerBloc, WidgetNumberByPlayerState>(
      bloc: tournamentFormBloc.widgetNumberByPlayerBloc,
      builder: (context, state) {
        return InkWell(
          splashColor: Colors.transparent,
          highlightColor: Colors.transparent,
          onTap: () => tournamentFormBloc.tapOnNumberPlayerByTeamWidget(index),
          child: ShakeAnimatedWidget(
            enabled:
                (state.runtimeType == WidgetNumberByPlayerAnimate) || false,
            duration: const Duration(milliseconds: 300),
            shakeAngle: Rotation.deg(z: 5),
            curve: Curves.linear,
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 200),
              width: 55,
              height: 55,
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.all(Radius.circular(7)),
                border: (state.runtimeType == WidgetNumberByPlayerAnimate)
                    ? const Border.fromBorderSide(
                        BorderSide(color: Color(0xffd22f2f), width: 3),
                      )
                    : (state.indexSelect == index)
                        ? const Border.fromBorderSide(
                            BorderSide(color: colorTheme, width: 3),
                          )
                        : const Border.fromBorderSide(
                            BorderSide(color: Colors.white),
                          ),
                image: DecorationImage(image: Image.asset(image).image),
              ),
            ),
          ),
        );
      },
    );
  }
}
