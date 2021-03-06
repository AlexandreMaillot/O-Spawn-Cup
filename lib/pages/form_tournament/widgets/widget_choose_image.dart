import 'package:animated_widgets/widgets/rotation_animated.dart';
import 'package:animated_widgets/widgets/shake_animated_widget.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:o_spawn_cup/constant.dart';
import 'package:o_spawn_cup/pages/form_tournament/bloc/tournament_form_bloc.dart';
import 'package:o_spawn_cup/pages/form_tournament/cubit/take_image_gallery/take_image_gallery_cubit.dart';
import 'package:o_spawn_cup/shared/widgets/text_element.dart';

class WidgetChooseImage extends StatelessWidget {
  const WidgetChooseImage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final tournamentFormBloc = context.read<TournamentFormBloc>();

    return BlocBuilder<TakeImageGalleryCubit, TakeImageGalleryState>(
      builder: (context, state) {
        tournamentFormBloc.loadImageTaked(state.imageTaked);

        return InkWell(
          onTap: tournamentFormBloc.takePictureInGallery,
          child: (tournamentFormBloc.imageCup.value != null &&
                  tournamentFormBloc.takeByCamera)
              ? SizedBox(
                  width: MediaQuery.of(context).size.width * 0.3,
                  height: MediaQuery.of(context).size.height * 0.15,
                  child: Container(
                    decoration: BoxDecoration(
                      border: const Border.fromBorderSide(
                        BorderSide(color: colorTheme, width: 3),
                      ),
                      borderRadius: const BorderRadius.all(Radius.circular(9)),
                      image: DecorationImage(
                        image: Image.file(tournamentFormBloc.imageCup.value!)
                            .image,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                )
              : ShakeAnimatedWidget(
                  enabled: (state.runtimeType == TakeImageAnimated) || false,
                  duration: const Duration(milliseconds: 300),
                  shakeAngle: Rotation.deg(z: 5),
                  curve: Curves.linear,
                  child: DottedBorder(
                    borderType: BorderType.RRect,
                    color: (state.runtimeType == TakeImageAnimated)
                        ? const Color(0xffd22f2f)
                        : Colors.white,
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
                            decoration: const BoxDecoration(
                              color: Colors.white,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(6)),
                            ),
                            width: 23,
                            height: 23,
                            child: const Icon(
                              Icons.add,
                              color: colorHintTextTheme,
                            ),
                          ),
                          const TextElement(
                            text: 'CHOISIR UNE IMAGE',
                            color: Colors.white,
                          ),
                          const Text(
                            'max 5 mo',
                            style: TextStyle(
                              color: colorOrange,
                              fontFamily: 'o_spawn_cup_font',
                            ),
                          ),
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
