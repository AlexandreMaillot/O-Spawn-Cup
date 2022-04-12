import 'package:animated_widgets/widgets/rotation_animated.dart';
import 'package:animated_widgets/widgets/shake_animated_widget.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:o_spawn_cup/bloc/form_tournament_step_4_bloc/form_tournament_step_4_bloc.dart';
import 'package:o_spawn_cup/constant.dart';
import 'package:o_spawn_cup/cubit/selected_image_predef_cubit/selected_image_predef_cubit.dart';
import 'package:o_spawn_cup/cubit/take_image_gallery/take_image_gallery_cubit.dart';
import 'package:o_spawn_cup/pages/form_tournament/bloc/tournament_form_bloc.dart';
import 'package:o_spawn_cup/shared/widgets/text_element.dart';

class WidgetChooseImage extends StatelessWidget {
  const WidgetChooseImage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    var tournamentFormBloc = context.read<TournamentFormBloc>();
    return BlocBuilder<TakeImageGalleryCubit, TakeImageGalleryState>(
      builder: (context, state) {
        tournamentFormBloc.loadImageTaked(state.imageTaked);
        return InkWell(
          onTap: () => tournamentFormBloc.takeImageGalleryCubit.takePicture(),
          child: (tournamentFormBloc.imageCup.value != null)
              ? SizedBox(
            width: MediaQuery.of(context).size.width * 0.3,
            height: MediaQuery.of(context).size.height * 0.15,
            child: Container(
              decoration: BoxDecoration(
                border: Border.all(color: colorTheme, width: 3),
                borderRadius: BorderRadius.circular(9),
                image: DecorationImage(
                  image: Image.file(tournamentFormBloc.imageCup.value!).image,
                  fit: BoxFit.cover,
                ),
              ),
            ),
          )
              : ShakeAnimatedWidget(
            enabled: (state.runtimeType == TakeImageAnimated) ? true : false,
            duration: const Duration(milliseconds: 300),
            shakeAngle: Rotation.deg(z: 5),
            curve: Curves.linear,
            child: DottedBorder(
              borderType: BorderType.RRect,
              color: (state.runtimeType == TakeImageAnimated) ? const Color(0xffd22f2f) : Colors.white,
              strokeWidth: 0.6,
              strokeCap: StrokeCap.round,
              radius: const Radius.circular(9),
              padding: const EdgeInsets.all(6),
              child: SizedBox(
                height: screenSize.height * 0.08,
                width: screenSize.width,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(6),
                      ),
                      width: 23,
                      height: 23,
                      child: Icon(
                        Icons.add,
                        color: colorHintTextTheme,
                      ),
                    ),
                    TextElement(
                      text: 'CHOISIR UNE IMAGE',
                      color: Colors.white,
                    ),
                    Text(
                      'max 5 mo',
                      style: TextStyle(
                        color: colorOrange,
                        fontFamily: 'o_spawn_cup_font',
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}