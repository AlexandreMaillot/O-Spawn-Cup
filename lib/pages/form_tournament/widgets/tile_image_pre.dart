import 'package:animated_widgets/animated_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:o_spawn_cup/constant.dart';
import 'package:o_spawn_cup/models/game_name.dart';
import 'package:o_spawn_cup/pages/form_tournament/bloc/tournament_form_bloc.dart';
import 'package:o_spawn_cup/pages/form_tournament/cubit/selected_image_predef_cubit/selected_image_predef_cubit.dart';

class TileImagePre extends StatelessWidget {
  final String image;
  final int index;
  final GameName gameName;
  const TileImagePre({
    Key? key,
    required this.image,
    required this.index,
    required this.gameName,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final tournamentFormBloc = context.read<TournamentFormBloc>();

    return BlocBuilder<SelectedImagePredefCubit, SelectedImagePredefState>(
      builder: (context, state) {
        return InkWell(
          splashColor: Colors.transparent,
          highlightColor: Colors.transparent,
          onTap: () => tournamentFormBloc.tapOnTileImagepreDef(index),
          child: ShakeAnimatedWidget(
            enabled:
                (state.runtimeType == SelectedImagePredefAnimated) || false,
            duration: const Duration(milliseconds: 300),
            shakeAngle: Rotation.deg(z: 5),
            curve: Curves.linear,
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 200),
              decoration: BoxDecoration(
                border: (state.runtimeType == SelectedImagePredefAnimated)
                    ? const Border.fromBorderSide(
                        BorderSide(color: Color(0xffd22f2f), width: 3),
                      )
                    : ((state as SelectedImagePredefInitial).indexSelected ==
                            index)
                        ? const Border.fromBorderSide(
                            BorderSide(color: colorTheme, width: 3),
                          )
                        : null,
                image: DecorationImage(
                  image: ExactAssetImage(image),
                  fit: BoxFit.cover,
                ),
                color: Colors.white,
                borderRadius: const BorderRadius.all(Radius.circular(11)),
              ),
              height: screenSize.height / 9,
              width: screenSize.width / 4,
            ),
          ),
        );
      },
    );
  }
}
