import 'dart:io';

import 'package:animated_widgets/animated_widgets.dart';
import "package:flutter/cupertino.dart";
import "package:flutter/material.dart";
import "package:flutter_bloc/flutter_bloc.dart";
import "package:o_spawn_cup/constant.dart";
import 'package:o_spawn_cup/cubit/selected_image_predef_cubit/selected_image_predef_cubit.dart';
import 'package:o_spawn_cup/cubit/take_image_gallery/take_image_gallery_cubit.dart';
import 'package:o_spawn_cup/models/game_name.dart';

import '../../bloc/form_tournament_step_4_bloc/form_tournament_step_4_bloc.dart';

class TileImagePre extends StatelessWidget {
  String image;
  int index;
  GameName gameName;
  TileImagePre({
    Key? key,
    required this.image,
    required this.index,
    required this.gameName,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;

    return BlocBuilder<SelectedImagePredefCubit, SelectedImagePredefState>(
    builder: (context, state) {
    return InkWell(
      splashColor: Colors.transparent,
      highlightColor: Colors.transparent,
      onTap: ()  {
        var indexSelect = index;

        context.read<SelectedImagePredefCubit>().changedIndexSelect(index);
        context.read<TakeImageGalleryCubit>().clearPicture();
        if(indexSelect == (state as SelectedImagePredefInitial).indexSelected) {
          context.read<FormTournamentStep4Bloc>().add(const FormTournamentImageCupChanged(null));
        } else {
          context.read<FormTournamentStep4Bloc>().add(FormTournamentImageCupChanged(File(listImagePre[indexSelect].image)));
        }


        },
      child: ShakeAnimatedWidget(
        enabled: (state.runtimeType == SelectedImagePredefAnimated) ? true : false,
        duration: const Duration(milliseconds: 300),
        shakeAngle: Rotation.deg(z: 5),
        curve: Curves.linear,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          decoration: BoxDecoration(
            border: (state.runtimeType == SelectedImagePredefAnimated) ? Border.all(color: const Color(0xffd22f2f) ,width: 3,) : ((state as SelectedImagePredefInitial).indexSelected == index) ? Border.all(color: colorTheme,width: 3) : null,
            image: DecorationImage(
              image: ExactAssetImage(image),
              fit: BoxFit.cover,
            ),
            color: Colors.white,
            borderRadius: BorderRadius.circular(11),
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